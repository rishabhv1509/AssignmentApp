//
//  CoreDataServiceTest.swift
//  AssignmentAppTests
//
//  Created by Rishabh Verma on 02/03/23.
//

import XCTest
@testable import AssignmentApp
import CoreData

class CoreDataServiceTest: XCTestCase {

    
    var sut: CoreDataService!
    var mockDelegate: MockCoreDataDelegate!
    
    override func setUp() {
        super.setUp()
        sut = CoreDataService()
        mockDelegate = MockCoreDataDelegate()
        sut.coreDataDelegate = mockDelegate
    }
    
    override func tearDown() {
        sut = nil
        mockDelegate = nil
        super.tearDown()
    }
    
    func testFetchDatawithEmptyList() throws {

        sut.fetchDataFromDb()
        XCTAssertEqual(mockDelegate.fetchedData?.data?.count, 0, "Should return an empty list")
        XCTAssertNil(mockDelegate.fetchedData?.error, "Should not return an error")
    }
    
    func testDaveDataInDb( ){
        
        let items = mockstoreData.data.items
        sut.saveDataInDb(items: items)
        sut.fetchDataFromDb()
        XCTAssertEqual(mockDelegate.fetchedData?.data?.count, 9, "Should return an 9 items")
        XCTAssertNil(mockDelegate.fetchedData?.error, "Should not return an error")
      
    }

    func testDeleteAll(){
        sut.deleteAll()
        sut.fetchDataFromDb()
        XCTAssertEqual(mockDelegate.fetchedData?.data?.count, 0, "Should return an empty list")
        XCTAssertNil(mockDelegate.fetchedData?.error, "Should not return an error")
    }

    }


