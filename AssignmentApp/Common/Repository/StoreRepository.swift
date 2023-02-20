//
//  StoreRepository.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 21/02/23.
//

import Foundation

class StoreRepository{
    func getStoreData()async->DataWrapper<Items,LocalizedError>{
       let storeData = await ApiService().getStoreData()
        return DataWrapper<Items,LocalizedError>(response: storeData.response as? Items, error: storeData.error)
    }
}
