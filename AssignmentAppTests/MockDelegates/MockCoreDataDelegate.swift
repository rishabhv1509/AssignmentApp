//
//  MockCoreDataDelegate.swift
//  AssignmentAppTests
//
//  Created by Rishabh Verma on 06/03/23.
//

import Foundation
@testable import AssignmentApp

class MockCoreDataDelegate: CoreDataDelegate {
    var fetchedData: DataWrapper<[Item], NetworkError>?
    
    func fetchedCoreData(_ data: DataWrapper<[Item], NetworkError>) {
        fetchedData = data
    }
}
