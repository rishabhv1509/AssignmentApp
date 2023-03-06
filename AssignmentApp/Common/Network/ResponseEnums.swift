//
//  APIResponseEnums.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 20/02/23.
//

import Foundation

//enum ApiResponse<Response,NetworkError> {
//    case success(Response)
//    case failure(NetworkError)
//}

enum ApiResponse<Response, NetworkError>: Equatable where Response: Equatable, NetworkError: Equatable {
    case success(Response)
    case failure(NetworkError)
    
    static func ==(lhs: ApiResponse<Response, NetworkError>, rhs: ApiResponse<Response, NetworkError>) -> Bool {
        switch (lhs, rhs) {
            case let (.success(leftResponse), .success(rightResponse)):
                return leftResponse == rightResponse
            case let (.failure(leftError), .failure(rightError)):
                return leftError == rightError
            default:
                return false
        }
    }
}








