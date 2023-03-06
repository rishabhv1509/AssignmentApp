//
//  MockNetworkDelegate.swift
//  AssignmentAppTests
//
//  Created by Rishabh Verma on 05/03/23.
//

import Foundation
@testable import AssignmentApp

class MockNetworkDelegate : NetworkDelegate {
    
    var didNetworkResponseRecievedCalled = false
    var apiResponse: ApiResponse<Data, NetworkError>?
    var didFailWithErrorCalled = false
    var networkData: Data?
    var networkError: NetworkError?
    
//    init() {
//       networkData = nil
//        networkData = nil
//    }
    
    func networkResponseRecieved(_ data: AssignmentApp.ApiResponse<Data, AssignmentApp.NetworkError>) {


        print("data---", data)
        self.apiResponse = data
        
//        switch data {
//            case .success(let response):
//                print("response---", response)
//                networkData = response
//            case .failure(let networkError):
//                self.networkError = networkError
//        }
        didNetworkResponseRecievedCalled = true

    }
    
    
}

