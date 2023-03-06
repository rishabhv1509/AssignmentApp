//
//  MockStoreViewModelDelegate.swift
//  AssignmentAppTests
//
//  Created by Rishabh Verma on 06/03/23.
//

import Foundation
@testable import AssignmentApp

class MockStoreVMDelegate : StoreVMDelegate {
    var fetchedDataFromVm : DataWrapper<[Item], NetworkError>?
    func fetchedDataFromVm(_ vmData: AssignmentApp.DataWrapper<[AssignmentApp.Item], AssignmentApp.NetworkError>) {
        fetchedDataFromVm = vmData
    }
    
  
}
