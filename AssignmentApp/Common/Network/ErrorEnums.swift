//
//  ErrorEnums.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 20/02/23.
//

import Foundation

enum NetworkError: String,LocalizedError {
    case invalidURL =  "Invalid URL"
    case requestFailed = "Request failed"
    case invalidData = "Invalid data"
    case clientError = "Some client error occured"
    case serverError = "Some server error occured"
    case unexpectedError = "Some error occured"
    
}

