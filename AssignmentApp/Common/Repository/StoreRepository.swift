//
//  StoreRepository.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 21/02/23.
//

import Foundation


/// Repository to handle db and api data
class StoreRepository : ApiDelegate , CoreDataDelegate {
    
    
    
    var apiService : ApiService = ApiService()
    var coreDataService : CoreDataService = CoreDataService()
    weak var repositoryDelegate : RepositoryDelegate!
    var storeItems : [Item] = []
    
    init(apiService: ApiService!, coreDataService: CoreDataService!) {
        self.apiService = apiService ?? ApiService()
        self.coreDataService = coreDataService ?? CoreDataService()

    }
    
    init(){
        coreDataService.coreDataDelegate = self
        apiService.apiDelegate = self
    }
    
    
    
    /// get data for VM
    func getStoreData() {
        coreDataService.fetchDataFromDb()
    }
    
    
    /// delegate to get fetched data from the api
    /// - Parameter data: response coming from api
    func fetchedApiData(_ apiResponse: DataWrapper<StoreResponseModel, LocalizedError>) {
        let apiData = apiResponse.data
        coreDataService.saveDataInDb(items: (apiData?.data.items)!)
        getStoreData()
    }
    
    
    /// delegate to get fetched data from the internal db
    /// - Parameter data: response coming from internal db
    func fetchedCoreData(_ data: DataWrapper<[Item], LocalizedError>) {
        var storeDataforVm = DataWrapper<[Item], LocalizedError>()
        let coreData = data.data
        if(coreData!.isEmpty){
            apiService.fetchStoreDataFromApi()
        }
        else{
            storeDataforVm.data = coreData
            storeDataforVm.error = data.error
            repositoryDelegate.fetchedRepositoryData(storeDataforVm)
        }
    }
    
    
}




