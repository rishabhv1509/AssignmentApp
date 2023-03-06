//
//  TableViewController.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 21/02/23.
//

import Foundation
import UIKit
import CoreData


class TableViewController:UIViewController,StoreVMDelegate{
    
    private var tableView : CustomTableView?
    private var loader : LoaderView?
    private var viewModel: StoreViewModel = StoreViewModel()
    private var isLoading = false


    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.vmDelegate = self
        tableView = CustomTableView(frame: self.view.frame)
        self.view.addSubview(tableView!)
        isLoading = true
        loader = LoaderView(frame: self.view.frame)
        self.view.addSubview(loader!)
        DispatchQueue.main.async {
            self.loader?.startLoading(view: self.view)
        }
        viewModel.fetchStoreData()
        
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .all
    }
        func fetchedDataFromVm(_ vmData: DataWrapper<[Item], NetworkError>) {
      
        tableView?.storeItems = vmData.data!
        isLoading = false
            DispatchQueue.main.async {
                self.loader?.stopLoading(view: self.view)
                self.loader?.removeFromSuperview()
            }
        
    }
    
}
