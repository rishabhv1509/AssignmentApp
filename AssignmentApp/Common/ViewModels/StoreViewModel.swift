//
//  StoreViewModel.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 21/02/23.
//

import Foundation

class StoreViewModel : ObservableObject {
    @Published var store: DataWrapper<StoreResponseModel,LocalizedError> = DataWrapper()
    func getStoreDetails() async {
        store.isLoading = true
        let result = await StoreRepository().getStoreData()
        if(result.error != nil) {
            store.error = result.error
        } else {
            store.response = result.response
        }
        store.isLoading = false
    }
}
