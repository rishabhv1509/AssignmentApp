//
//  ApiService.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 21/02/23.
//

import Foundation

class ApiService : NetworkDelegate {
    
    var apiDelegate : ApiDelegate!
    var networkClient : NetworkClient
    
    init( networkClient: NetworkClient) {
        
        self.networkClient = networkClient
        self.networkClient.networkDelegate = self
    }
    
    func getStoreData() {
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
    
    
    
    func fetchNetworkResponse(_ response: ApiResponse<Data, NetworkError>) {
        
        var storeData : DataWrapper<BaseModel, LocalizedError> = DataWrapper()
        
        switch response {
            case .success(let data):
                
                do{
                    storeData.response = try StoreResponseModel(data: data)
                }
                
                catch{
                    storeData.error=DecodingErrors.decodeError
                }
                
            case .failure(let networkError):
                storeData.error=networkError
        }
        apiDelegate?.fetchApiData(storeData)
    }
    
}



