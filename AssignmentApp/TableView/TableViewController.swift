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

    private var baseItems : [Item] = []
    private var viewModel: StoreViewModel = StoreViewModel.instance
    private var loader = LoaderView()
    private var tableView = UITableView()
    private var appBar = AppBarView()
    private var stackView = UIStackView()
    private var storeItems : [Item] = []
    var isLoading = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.vmDelegate = self
        appBar.searchBar.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        viewModel.fetchStoreData()
        
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .all
    }
    
    override func viewDidLayoutSubviews() {
        setTableValues()
        setupStackView()
        addConstraints()
    }
    
    func setTableValues()  {
       
        tableView.register(TableCell.self, forCellReuseIdentifier: TableCell.identifier)
        tableView.showsVerticalScrollIndicator = true
        tableView.rowHeight = 80
        tableView.frame = .zero
        tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
    }
    
    func setupStackView(){
        loader.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .leading
        stackView.distribution = .fill
        stackView.spacing = 0
        appBar.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        let views = [ appBar, tableView]
        for view in views {
            stackView.addArrangedSubview(view)
        }
        view.addSubview(stackView)
    }

    func addConstraints()  {
        appBar.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        let appBarTop = NSLayoutConstraint(item: appBar, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0)
        let appBarLeading = NSLayoutConstraint(item: appBar, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0)
        let appBarTrailing = NSLayoutConstraint(item: appBar, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -0)
        let tableLeading = NSLayoutConstraint(item: tableView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0)
        let tableTrailing = NSLayoutConstraint(item: tableView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -0)
        let appBarHeight = NSLayoutConstraint(item: appBar, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: appBar.appBarHeight)
        let tableBottom = NSLayoutConstraint(item: tableView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: -100)
        
        NSLayoutConstraint.activate(
            [
                tableLeading, tableTrailing,
                appBarTop,
                tableBottom,
                appBarLeading, appBarTrailing,
                appBarHeight,
            ]
        )
    }
    
    func fetchDataFromVm(_ data: [Item]) {
        
        storeItems = data
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

        cell.configureLeadingImage(image: item.image)
        cell.configureTitle(title: item.name )
        cell.configureSubtitle(subtitle: item.price )
        cell.configureExtraSubtitle(shippingDay: item.extra)
        cell.configureMrpSubtitle()
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
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


                                                                                                                                                                                                                    
                                                                                                                                                                                                                    
                                                                                                                                                                                                                    
                                                                                                                                                                                                                    
