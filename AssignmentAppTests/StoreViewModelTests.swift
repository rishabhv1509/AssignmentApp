//
//  StoreViewModelTests.swift
//  AssignmentAppTests
//
//  Created by Rishabh Verma on 06/03/23.
//

import XCTest
@testable import AssignmentApp

final class StoreViewModelTests: XCTestCase {
    var sut : StoreViewModel?
    var mockVmDelegate : MockStoreVMDelegate?
    
    
    override func setUpWithError() throws {
       try super.setUpWithError()
        sut = StoreViewModel()
        mockVmDelegate = MockStoreVMDelegate()
        sut?.vmDelegate = mockVmDelegate
        
    }

    override func tearDownWithError() throws {
        sut = nil
        mockVmDelegate = nil
    }

    func testFetchStoreData() {
        let expectation = XCTestExpectation(description: "fetch store data from repository")
        sut?.fetchStoreData()
        var data = DataWrapper<[Item], NetworkError>()
        data.data = mockstoreData.data.items
        XCTAssertEqual(data.data, mockVmDelegate?.fetchedDataFromVm?.data)
        expectation.fulfill()
        wait(for: [expectation], timeout: 1.0)
    }

    

}
