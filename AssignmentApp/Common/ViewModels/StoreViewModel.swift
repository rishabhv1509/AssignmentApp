//
//  StoreViewModel.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 21/02/23.
//

import Foundation


/// View Model to communicate b/w view and repository
class StoreViewModel : Repository {
    
   
    var storeRepository : StoreRepository
    weak var vmDelegate : StoreVMDelegate!
    static let instance = StoreViewModel(storeRepository: StoreRepository.instance)
    
    init( storeRepository: StoreRepository) {
        
        self.storeRepository = storeRepository
        self.storeRepository.repositoryDelegate = self
    }

    
    /// fetch data from repository
    func fetchStoreData()  {
        
        storeRepository.getStoreData()
    }
    
    
    /// delegate method to pass data to view
    /// - Parameter data: list of store items
    func fetchStoreDataFromRepository(_ data: [Item]) {
        vmDelegate.fetchDataFromVm(data)
        
    }
}
