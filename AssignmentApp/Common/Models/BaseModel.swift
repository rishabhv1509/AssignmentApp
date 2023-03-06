//
//  BaseModel.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 21/02/23.
//

import Foundation

protocol BaseModel: Equatable {
    // protocol definition
}

extension BaseModel {
    static func == (lhs: Self, rhs: Self) -> Bool {
        // implementation of the == operator function for BaseModel
        // compare properties of the conforming type for equality
        return true // replace with the actual implementation
    }
}

