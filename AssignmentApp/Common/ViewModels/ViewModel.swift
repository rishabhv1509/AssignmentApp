//
//  ViewModel.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 21/02/23.
//

import Foundation

class ViewModel : ObservableObject {
    @Published var store: DataWrapper<Items,LocalizedError> = DataWrapper()
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
