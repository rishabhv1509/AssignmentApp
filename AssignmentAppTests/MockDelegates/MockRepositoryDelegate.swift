//
//  MockRepositoryDelegate.swift
//  AssignmentAppTests
//
//  Created by Rishabh Verma on 06/03/23.
//

import Foundation
@testable import AssignmentApp

class MockRepositoryDelegate: RepositoryDelegate {
    
    
    var fetchedRepositoryData : DataWrapper<[Item], NetworkError>?
    
    func fetchedRepositoryData(_ data: DataWrapper<[Item], NetworkError>) {
        
        self.fetchedRepositoryData = data
    }
}
