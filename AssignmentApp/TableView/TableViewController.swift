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
    private var appBarView = UIView()
    private var appBar = AppBarController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loader = LoaderView(frame: view.frame)
//        appBarView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: appBar.appBarHeight)
        addSubviews()
        setTableValues()
        addConstraints()
        print("height ---", appBar.appBarHeight)
        Task{
            await  loadStoreData()
        }
    }
    
    func setTableValues()  {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TableCell.self, forCellReuseIdentifier: TableCell.identifier)
        tableView.showsVerticalScrollIndicator = true
        tableView.rowHeight = 80
        tableView.frame = CGRect(x: 0, y: appBar.appBarHeight + 34, width: view.frame.width, height: self.view.frame.size.height - appBar.appBarHeight + 34)
    }
    
    func addSubviews() {
        self.view.addSubview(tableView)
        self.view.addSubview(self.appBarView)
        self.appBarView.addSubview(self.appBar.view!)
    }
    
    func addConstraints()  {
        appBarView.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
//        let labelTop = NSLayoutConstraint(item: appBarView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0)
//
//        let labelLeading = NSLayoutConstraint(item: appBarView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0 )
        let appBarTop = NSLayoutConstraint(item: appBarView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0)
        let appBarLeading = NSLayoutConstraint(item: appBarView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 34)
        let appBarTrailing = NSLayoutConstraint(item: appBarView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -34)
        let tableBottom = NSLayoutConstraint(item: tableView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 100)
        let appBarBottom = NSLayoutConstraint(item: appBarView, attribute: .bottom, relatedBy: .equal, toItem: tableView, attribute: .top, multiplier: 1, constant: 100)
        let tableTop = NSLayoutConstraint(item: tableView, attribute: .top, relatedBy: .equal, toItem: appBarView, attribute: .bottom, multiplier: 1, constant: 0)
        let tableLeading = NSLayoutConstraint(item: tableView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 34)
        let tableTrailing = NSLayoutConstraint(item: tableView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -34)
        let tableHeight = NSLayoutConstraint(item: tableView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 340)
        let appBarHeight = NSLayoutConstraint(item: appBarView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: appBar.appBarHeight)

        
        NSLayoutConstraint.activate(
            [

//                tableTop,
                tableLeading, tableTrailing,
                appBarTop,appBarBottom,
//                appBarLeading, appBarTrailing,
//                appBarHeight

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
