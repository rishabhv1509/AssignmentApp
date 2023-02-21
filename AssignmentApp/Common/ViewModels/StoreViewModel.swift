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
        let result = await StoreRepository().getStoreData()
        if(result.error != nil) {
            self.store.error = result.error
        } else {
            self.store.response = result.response
        }
    }
}
