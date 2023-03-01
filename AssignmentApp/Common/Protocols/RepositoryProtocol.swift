//
//  RepositoryProtocol.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 28/02/23.
//

import Foundation

protocol Repository : AnyObject {
//    associatedtype Entity
    
    func fetchStoreDataFromRepo(_ data: [Item])
    
}
