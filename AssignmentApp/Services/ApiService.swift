//
//  ApiService.swift
//  AssignmentApp
// 
//  Created by Rishabh Verma on 21/02/23.
//

import Foundation


/// Service to fetch data from API
/// 
class ApiService : NetworkDelegate  { 
    
    var apiDelegate : ApiDelegate!
    var networkClient : NetworkClient = NetworkClient()
    
    init(networkClient: NetworkClient) { 
        self.networkClient = networkClient
        self.networkClient.networkDelegate = self
    }
    
    init (){
        self.networkClient.networkDelegate = self
    }
    
    /// fetch store data from api
    func fetchStoreDataFromApi() {
        self.networkClient.getResponse(urlString: Urls.getStoreData)
    }
    
    func networkResponseRecieved(_ data: ApiResponse<Data,NetworkError>) {
        var apiResponse = DataWrapper<StoreResponseModel, NetworkError>()
        
        switch data {
            case .success(let response):
                do{
                    let storeResponse = try StoreResponseModel(data: response)
                    apiResponse.data = storeResponse
                }
                catch{
                    apiResponse.error = NetworkError.clientError
                }
            case .failure(let networkError):
                apiResponse.error = networkError
        }
        self.apiDelegate?.fetchedApiData(apiResponse)
    }
}





