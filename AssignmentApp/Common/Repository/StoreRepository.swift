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
    var repositoryDelegate : RepositoryDelegate!
    
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
    func fetchedApiData(_ apiResponse: DataWrapper<StoreResponseModel, NetworkError>) {
        let apiData = apiResponse.data
        coreDataService.saveDataInDb(items: (apiData?.data.items)!)
        getStoreData()
    }
    
    
    /// delegate to get fetched data from the internal db
    /// - Parameter data: response coming from internal db
    func fetchedCoreData(_ data: DataWrapper<[Item], NetworkError>) {
        var storeDataforVm = DataWrapper<[Item], NetworkError>()
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




