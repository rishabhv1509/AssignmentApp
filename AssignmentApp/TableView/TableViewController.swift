//
//  TableViewController.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 21/02/23.
//

import Foundation
import UIKit
import CoreData


class TableViewController:UIViewController,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate, StoreVMDelegate{
 
    

    private var loader = LoaderView()
    private var tableView = UITableView()
    private var appBar = AppBarView()
    private var stackView = UIStackView()
    private var storeItems : [Item] = []
    private var baseItems : [Item] = []
    private var viewModel: StoreViewModel = StoreViewModel.instance
    var isLoading = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.vmDelegate = self
        appBar.searchBar.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        TableUtils(tableView: tableView, view: view, stackView: stackView, appBar: appBar).setTableValues()
        TableUtils(tableView: tableView, view: view, stackView: stackView, appBar: appBar).setupStackView()
        _ = TableViewConstraints(appBar: appBar, tableView: tableView, view: self.view)
        viewModel.fetchStoreData()
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .all
    }
    
    
    func fetchedDataFromVm(_ vmData: DataWrapper<[Item], LocalizedError>) {
        storeItems = vmData.data!
        baseItems = storeItems
        DispatchQueue.global(qos: .background).async {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return   storeItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TableCell.identifier, for: indexPath) as! TableCell
        let item = storeItems[indexPath.row]
        return TableUtils(tableView: tableView, view: self.view, stackView: stackView, appBar: appBar).setupCell(item: item, cell: cell)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.tableRowHeight
    }
    
    func search(forText: String){
        
        storeItems = storeItems.filter { item in
            item.name.lowercased().contains(forText.lowercased())
        }
        tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if(searchText.isEmpty){
            storeItems = baseItems
            tableView.reloadData()
        }else{
            search(forText: searchText)}
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        storeItems = baseItems
    }
}
