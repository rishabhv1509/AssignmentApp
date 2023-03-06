//
//  GridView.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 21/02/23.
//

import Foundation 
import UIKit

class GridViewController: UIViewController,StoreVMDelegate {
    
    private var collectionView : CustomCollectionView?
    private var loader : LoaderView?
    private var isLoading = false
    private var viewModel: StoreViewModel = StoreViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.vmDelegate = self
        collectionView = CustomCollectionView(frame: self.view.frame)
        self.view.addSubview(collectionView!)
        isLoading = true
        loader = LoaderView(frame: self.view.frame)
        self.view.addSubview(loader!)
        loader?.startLoading(view: self.view)
        viewModel.fetchStoreData()
        
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .all
    }
    
    func fetchedDataFromVm(_ vmData: DataWrapper<[Item], NetworkError>) {
        
        collectionView?.storeItems = vmData.data!
        isLoading = false
        DispatchQueue.main.async {
            self.loader?.stopLoading(view: self.view)
            self.loader?.removeFromSuperview()
        }
        
    }
}
