//
//  StoreViewModel.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 21/02/23.
//

import Foundation

class StoreViewModel : ObservableObject, Repository {
     var vmDelegate : StoreVMDelegate!
    var storeRepository : StoreRepository
    
    static let instance = StoreViewModel()
     init(){
         storeRepository = StoreRepository.instance
         storeRepository.repositoryDelegate = self
         
    }
    
    func getStoreDetails()  {
        print("111")
        storeRepository.getStoreData()
    }
    
    func fetchStoreDataFromRepo(_ data: [Item]) {
        vmDelegate.fetchDataFromVm(data)
        
    }
}
