//
//  TableViewController.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 21/02/23.
//

import Foundation
import UIKit


class TableViewController:UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    private var storeItems:ItemsList!
    private var viewModel: StoreViewModel = StoreViewModel.instance
    private var loader = LoaderView()
    private var tableView = UITableView()
    private var appBar = AppBarView()
    private var stackView = UIStackView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Task{
            await  loadStoreData()
        }
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
    }
    
    func setupStackView(){
        loader.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .leading
        stackView.distribution = .fill
        stackView.spacing = 20
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
        let tableHeight = NSLayoutConstraint(item: tableView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: view.frame.height)
        let appBarHeight = NSLayoutConstraint(item: appBar, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: appBar.appBarHeight)
        
        
        NSLayoutConstraint.activate(
            [
                tableLeading, tableTrailing,
                appBarTop,
                tableHeight,
                appBarLeading, appBarTrailing,
                appBarHeight,
            ]
        )
    }
    
    func loadStoreData()async{
        
        loader.startLoading(view: self.view)
        await viewModel.getStoreDetails()
        storeItems=(viewModel.store.response?.data)!
        loader.stopLoading(view: self.view)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        storeItems?.items.count ?? 0
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
}
