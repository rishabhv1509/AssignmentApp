//
//  TableViewController.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 21/02/23.
//

import Foundation
import UIKit


class TableViewController:UIViewController,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate{
    
    private var storeItems:ItemsList!
    private var baseItems:ItemsList!
    private var viewModel: StoreViewModel = StoreViewModel.instance
    private var loader = LoaderView()
    private var tableView = UITableView()
    private var appBar = AppBarView()
    private var stackView = UIStackView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appBar.searchBar.delegate = self
        Task{
            await  loadStoreData()
        }
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
        tableView.dataSource = self
        tableView.delegate = self
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
    
    func loadStoreData()async{
        
        loader.startLoading(view: self.view)
        await viewModel.getStoreDetails()
        storeItems = (viewModel.store.response?.data)!
        baseItems = storeItems
        loader.stopLoading(view: self.view)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return   storeItems?.items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {


        let cell = tableView.dequeueReusableCell(withIdentifier: TableCell.identifier, for: indexPath) as! TableCell

        let item = storeItems.items[indexPath.row]

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

        storeItems.items = storeItems.items.filter { item in
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


                                                                                                                                                                                                                    
                                                                                                                                                                                                                    
                                                                                                                                                                                                                    
                                                                                                                                                                                                                    
