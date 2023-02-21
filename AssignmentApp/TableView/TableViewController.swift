//
//  TableViewController.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 21/02/23.
//

import Foundation
import UIKit


class TableViewController:UIViewController,UITableViewDataSource,UITableViewDelegate{
    private var myTableView: UITableView!
    private var storeItems:[Item]=[]
    private var viewModel: StoreViewModel = StoreViewModel()
    private var loader = LoaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loader=LoaderView(frame: view.frame)
        myTableView = UITableView(frame: view.frame)
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.register(TableCell.self, forCellReuseIdentifier: TableCell.identifier)
        myTableView.showsVerticalScrollIndicator = true
        Task{
          await  loadStoreData()
        }
    }

    func loadStoreData()async{
        loader.startLoading(view: self.view)
        await viewModel.getStoreDetails()
        storeItems=(viewModel.store.response?.data.items)!
        loader.stopLoading(view: self.view)
        self.myTableView.frame = CGRect(x: 0, y: 180, width: self.view.frame.size.width, height: self.view.frame.size.height - 180)
        self.view.addSubview(self.myTableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("storeItems.count", storeItems.count)
        return storeItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableCell.identifier, for: indexPath) as! TableCell
               let item = storeItems[indexPath.row]
               cell.configureImageView(image: item.image)
               cell.configureTitle(title: item.name )
               cell.configureSubtitle(subtitle: item.price )
               cell.configureSameDayShipping(shippingDay: item.extra)
               return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
}
