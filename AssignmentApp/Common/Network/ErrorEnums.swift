//
//  ErrorEnums.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 20/02/23.
//

import Foundation


/// Enums for network errors
enum NetworkError: String,LocalizedError, Equatable {
    case invalidURL =  "Invalid URL"
    case requestFailed = "Request failed"
    case invalidData = "Invalid data"
    case clientError = "Some client error occured"
    case serverError = "Some server error occured"
    case unexpectedError = "Some error occured"
    
    static func ==(lhs: NetworkError, rhs: NetworkError) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
    
}

/// Enums for decoding errors
enum DecodingErrors : String, LocalizedError, Equatable{
    case decodeError = "Some error occured while decoding"
    static func ==(lhs: DecodingErrors, rhs: DecodingErrors) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
}

