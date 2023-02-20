//
//  APIResponseEnums.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 20/02/23.
//

import Foundation

enum ApiResponse<T,NetworkError> {
    case success(T)
    case failure(NetworkError)
}


