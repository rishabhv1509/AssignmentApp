//
//  DataWrapper.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 21/02/23.
//

import Foundation

struct DataWrapper<BaseModel,NetworkError> {
    
    var data: BaseModel?
    var error: LocalizedError?
    
}
