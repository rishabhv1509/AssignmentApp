//
//  GridView.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 21/02/23.
//

import Foundation 
import UIKit
import Lottie

class GridViewController: UIViewController,StoreVMDelegate {
    
    private var collectionView : CustomCollectionView?
    private var animationView: LottieAnimationView!
    private var viewModel: StoreViewModel = StoreViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.vmDelegate = self
        collectionView = CustomCollectionView(frame: self.view.frame)
        self.view.addSubview(collectionView!)
        animationView = LottieAnimationView(name: "loading")
        animationView.loopMode = .loop
        animationView.contentMode = .scaleAspectFit
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
        
        collectionView?.storeItems = vmData.data!
        DispatchQueue.main.async {
            self.animationView.stop()
            self.animationView.removeFromSuperview()
        }
        
    }
}
