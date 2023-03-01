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
    func getStoreData(){
        var storeData : DataWrapper<BaseModel, LocalizedError> = DataWrapper()
//        _ = try! await withUnsafeThrowingContinuation { continuation in
            
            self.networkClient.getResponse(urlString: Urls.getStoreData, completion: { data in
                switch data {
                case .success(let response):
                    do{
//                        print("inhere-----")
                       storeData.response = try StoreResponseModel(data: response)
                        
//                        continuation.resume(returning: self.storeData)
                    }
                    catch{
                        storeData.error=DecodingErrors.decodeError
//                        continuation.resume(returning: self.storeData)
                    }
                case .failure(let networkError):
                    storeData.error=networkError
//                    continuation.resume(returning: self.storeData)
                }
                self.apiDelegate?.fetchApiData(storeData)
            })
//
//    }
        
//        return DataWrapper()
    }
    
    func getStoreDataCOMMENT()async->DataWrapper<BaseModel, LocalizedError>{
        var storeData : DataWrapper<BaseModel, LocalizedError> = DataWrapper()
        //        _ = try! await withUnsafeThrowingContinuation { continuation in
        
        self.networkClient.getResponse(urlString: Urls.getStoreData, completion: { data in
            switch data {
                case .success(let response):
                    do{
                        //                        print("inhere-----")
                        storeData.response = try StoreResponseModel(data: response)
                        
                        //                        continuation.resume(returning: self.storeData)
                    }
                    catch{
                        storeData.error=DecodingErrors.decodeError
                        //                        continuation.resume(returning: self.storeData)
                    }
                case .failure(let networkError):
                    storeData.error=networkError
                    //                    continuation.resume(returning: self.storeData)
            }
        })
        //
        //    }
        
        return DataWrapper()
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



