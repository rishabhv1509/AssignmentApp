//
//  ApiService.swift
//  AssignmentApp
// 
//  Created by Rishabh Verma on 21/02/23.
//

import Foundation


/// Service to fetch data from API
/// 
class ApiService  {
    static var instance = ApiService(networkClient: NetworkClient.instance)
    var apiDelegate : ApiDelegate!
    var networkClient : NetworkClient
    
    init( networkClient: NetworkClient) {
        
        self.networkClient = networkClient

        
    }
    
    
    /// fetch store data from api
    func fetchStoreData() {
        var storeData : DataWrapper<BaseModel, LocalizedError> = DataWrapper()
        networkClient.getResponse(urlString: Urls.getStoreData, completion: { data in
            switch data {
                case .success(let response):
                    do{
                        storeData.response = try StoreResponseModel(data: response)
                    }
                    catch{
                        storeData.error=DecodingErrors.decodeError
                    }
                case .failure(let networkError):
                    storeData.error=networkError
            }
            self.apiDelegate?.fetchApiData(storeData)
        })
    }
    
}



