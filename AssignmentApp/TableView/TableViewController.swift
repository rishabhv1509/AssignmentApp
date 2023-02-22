//
//  TableViewController.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 21/02/23.
//

import Foundation
import UIKit


class TableViewController:UIViewController,UITableViewDataSource,UITableViewDelegate{
    private var tableView: UITableView!
    private var storeItems:ItemsList!
    private var viewModel: StoreViewModel = StoreViewModel.instance
    private var loader = LoaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loader = LoaderView(frame: view.frame)
        tableView = UITableView(frame: view.frame)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TableCell.self, forCellReuseIdentifier: TableCell.identifier)
        tableView.showsVerticalScrollIndicator = true
        
        
        Task{
            await  loadStoreData()
        }
    }
    
    func loadStoreData()async{
        loader.startLoading(view: self.view)
        await viewModel.getStoreDetails()
        storeItems=(viewModel.store.response?.data)!
        loader.stopLoading(view: self.view)
        self.tableView.frame = CGRect(x: 0, y: 180, width: self.view.frame.size.width, height: self.view.frame.size.height - 180)
        self.view.addSubview(self.tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        storeItems.items.count
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
        70
    }
}
