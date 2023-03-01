//
//  ErrorEnums.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 20/02/23.
//

import Foundation


/// Enums for network errors
enum NetworkError: String,LocalizedError {
    case invalidURL =  "Invalid URL"
    case requestFailed = "Request failed"
    case invalidData = "Invalid data"
    case clientError = "Some client error occured"
    case serverError = "Some server error occured"
    case unexpectedError = "Some error occured"
    
}

/// Enums for decoding errors
enum DecodingErrors : String, LocalizedError{
    case decodeError = "Some error occured while decoding"
}

