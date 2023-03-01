//
//  StoreRepository.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 21/02/23.
//

import Foundation

class StoreRepository  {
//    func getStoreData(_ data: [Item]) {
//        <#code#>
//    }
    

    var apiService : ApiService
    var coreDataService : CoreDataService
    weak var delegate : Repository!
    
    static let instance = StoreRepository(apiService: ApiService(), coreDataService: CoreDataService())
    
    init(apiService : ApiService, coreDataService : CoreDataService) {
        self.apiService = apiService
        self.coreDataService = coreDataService
        
        
    }
    var storeItems : [Item] = []
    
    typealias Entity = [Item]
    
    func getStoreData() async ->[Item] {
        let dbData = self.coreDataService.getDataFromDb()
        
        if (dbData == []){
            var test = await self.apiService.getStoreData()
            print("test---")
            if (test.error == nil ){
                var t = test.response as? StoreResponseModel
                storeItems = (t?.data.items)!
            }
        }else{
            let storeData = await apiService.getStoreData()
          var t = storeData.response as? StoreResponseModel
            storeItems = (t?.data.items)!
            delegate?.getStoreData(storeItems)
            print("dbData---", dbData[0].name, "type of------", type(of: dbData))
            
        }
        return storeItems
    }
    
    func getStoreData1()async->DataWrapper<StoreResponseModel,LocalizedError>{
       let storeData = await ApiService().getStoreData()
        return DataWrapper<StoreResponseModel,LocalizedError>(response: storeData.response as? StoreResponseModel, error: storeData.error)
    }
}


// isloading
// is error

