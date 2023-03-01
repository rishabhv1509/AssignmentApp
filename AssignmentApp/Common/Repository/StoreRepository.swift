//
//  StoreRepository.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 21/02/23.
//

import Foundation

class StoreRepository : ApiDelegate , CoreDataDelegate {
    
    var apiService : ApiService
    var coreDataService : CoreDataService
    weak var repositoryDelegate : Repository!
    var storeItems : [Item] = []
    
    static let instance = StoreRepository(apiService: ApiService(networkClient: NetworkClient.instance), coreDataService: CoreDataService())
    
    init(apiService : ApiService, coreDataService : CoreDataService) {
        self.apiService = apiService
        self.coreDataService = coreDataService
        self.coreDataService.coreDataDelegate = self
        self.apiService.apiDelegate = self
    }
    
    func getStoreData() {
        coreDataService.getDataFromDb()
    }
    
    func fetchApiData(_ data: DataWrapper<BaseModel, LocalizedError>) {
        let apiData = data.response as? StoreResponseModel
        coreDataService.saveDataInDb(items: (apiData?.data.items)!)
        getStoreData()
    }
    
    
    
    func fetchCoreData(_ data: DataWrapper<[Item], LocalizedError>) {
        let coreData = data.response
        if(coreData!.isEmpty){
            apiService.getStoreData()
        }
        else{
            repositoryDelegate.fetchStoreDataFromRepo(coreData!)
        }
    }
    
    
}




