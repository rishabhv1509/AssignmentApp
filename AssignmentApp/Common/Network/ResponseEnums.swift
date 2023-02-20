//
//  APIResponseEnums.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 20/02/23.
//

import Foundation

enum ApiResponse<Response,NetworkError> {
    case success(Response)
    case failure(NetworkError)
}


