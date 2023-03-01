//
//  StoreRepository.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 21/02/23.
//

import Foundation


/// Repository to handle db and api data
class StoreRepository : ApiDelegate , CoreDataDelegate {
    
    var apiService : ApiService
    var coreDataService : CoreDataService
    weak var repositoryDelegate : Repository!
    var storeItems : [Item] = []
    
    static let instance = StoreRepository(apiService: ApiService.instance, coreDataService: CoreDataService.instance)
    
    
    init(apiService : ApiService, coreDataService : CoreDataService) {
        self.apiService = apiService
        self.coreDataService = coreDataService
        self.coreDataService.coreDataDelegate = self
        self.apiService.apiDelegate = self
    }
    
    
    /// get data for VM
    func getStoreData() {
        coreDataService.fetchDataFromDb()
    }
    
    
    /// delegate to fetch data from the api
    /// - Parameter data: response coming from api
    func fetchApiData(_ data: DataWrapper<BaseModel, LocalizedError>) {
        let apiData = data.response as? StoreResponseModel
        coreDataService.saveDataInDb(items: (apiData?.data.items)!)
        getStoreData()
    }
    
    
    /// delegate to fetch data from the internal db
    /// - Parameter data: response coming from internal db
    func fetchCoreData(_ data: DataWrapper<[Item], LocalizedError>) {
        let coreData = data.response
        if(coreData!.isEmpty){
            apiService.fetchStoreData()
        }
        else{
            repositoryDelegate.fetchStoreDataFromRepository(coreData!)
        }
    }
    
    
}




