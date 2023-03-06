//
//  MockApiDelegate.swift
//  AssignmentAppTests
//
//  Created by Rishabh Verma on 05/03/23.
//

import Foundation
@testable import AssignmentApp

class MockApiDelegate : ApiDelegate {

    var apiResponse: DataWrapper<StoreResponseModel, NetworkError>?
    
   
    
    func fetchedApiData(_ apiResponse: DataWrapper<StoreResponseModel, NetworkError>) {
        self.apiResponse = apiResponse
        
    }
}
