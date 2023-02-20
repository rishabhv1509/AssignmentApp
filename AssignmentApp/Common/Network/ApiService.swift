//
//  ApiService.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 21/02/23.
//

import Foundation

class ApiService{
    var storeData : DataWrapper<BaseModel, LocalizedError> = DataWrapper()
    
    func getStoreData()async->DataWrapper<BaseModel, LocalizedError>{
        
        _ = try! await withUnsafeThrowingContinuation { continuation in
            
            NetworkClient.instance.getResponse(urlString: Urls.getStoreData, completion: { data in
                switch data {
                case .success(let response):
                    do{
                        self.storeData.response=try Items(data: response)
                        continuation.resume(returning: self.storeData)
                    }
                    catch{
                        self.storeData.error=DecodingErrors.decodeError
                        continuation.resume(returning: self.storeData)
                    }
                case .failure(let networkError):
                    self.storeData.error=networkError
                    continuation.resume(returning: self.storeData)
                }
            })}
        return self.storeData
    }
    
}



