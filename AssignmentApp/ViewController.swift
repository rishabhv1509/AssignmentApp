//
//  ViewController.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 13/02/23.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad()  {
        super.viewDidLoad()
        Task{
            await StoreRepository().getStoreData()
        }
    }
    
    
    
    
}
