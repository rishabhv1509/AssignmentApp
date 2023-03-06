//
//  TableViewController.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 21/02/23.
//

import Foundation
import UIKit
import CoreData
import Lottie


class TableViewController:UIViewController,StoreVMDelegate{
    
    private var tableView : CustomTableView?
    private var viewModel: StoreViewModel = StoreViewModel()
    var animationView: LottieAnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.vmDelegate = self
        tableView = CustomTableView(frame: self.view.frame)
        animationView = LottieAnimationView(name: "loading")
        animationView.loopMode = .loop
        animationView.contentMode = .scaleAspectFit
        self.view.addSubview(tableView!)
        view.addSubview(animationView)
        DispatchQueue.main.async {
            self.animationView.play()
        }
        viewModel.fetchStoreData()
        
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .all
    }
    func fetchedDataFromVm(_ vmData: DataWrapper<[Item], NetworkError>) {
        
        tableView?.storeItems = vmData.data!
        
        DispatchQueue.main.async {
            self.animationView.stop()
            self.animationView.removeFromSuperview()
        }
        
    }
    
}
