//
//  StoreRepository.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 21/02/23.
//

import Foundation

class StoreRepository{
    func getStoreData()async->DataWrapper<StoreResponseModel,LocalizedError>{
       let storeData = await ApiService().getStoreData()
        return DataWrapper<StoreResponseModel,LocalizedError>(response: storeData.response as? StoreResponseModel, error: storeData.error)
    }
}
