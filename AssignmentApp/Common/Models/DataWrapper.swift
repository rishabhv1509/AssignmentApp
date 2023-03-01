//
//  DataWrapper.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 21/02/23.
//

import Foundation

struct DataWrapper<BaseModel,NetworkError> {
    
    var response: BaseModel?
    var error: LocalizedError?
    var isLoading: Bool=false
}
