//
//  RepositoryDelegate.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 28/02/23.
//

import Foundation

protocol RepositoryDelegate : AnyObject {
    
    func fetchedRepositoryData(_ repositoryData: DataWrapper<[Item], NetworkError>)
    
}
