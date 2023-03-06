//
//  DataWrapper.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 21/02/23.
//

import Foundation

struct DataWrapper<BaseModel, NetworkError>: Equatable where NetworkError: LocalizedError, BaseModel: Equatable {
    var data: BaseModel?
    var error: NetworkError?
    
    static func == (lhs: DataWrapper<BaseModel, NetworkError>, rhs: DataWrapper<BaseModel, NetworkError>) -> Bool {
        return lhs.data == rhs.data && lhs.error?.errorDescription == rhs.error?.errorDescription
    }
}


