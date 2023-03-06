//
//  StoreRepositoryTest.swift
//  AssignmentAppTests 
//
//  Created by Rishabh Verma on 06/03/23.
//


import XCTest
@testable import AssignmentApp

class StoreRepositoryTests: XCTestCase {
    
    var sut: StoreRepository!
    var mockApiService: ApiService!
    var mockCoreDataService: CoreDataService!
    var mockRepositoryDelegate: MockRepositoryDelegate!
    
    override func setUp() {
        super.setUp()
        mockApiService = ApiService()
        mockCoreDataService = CoreDataService()
        mockRepositoryDelegate = MockRepositoryDelegate()
        sut = StoreRepository()
        sut.repositoryDelegate = mockRepositoryDelegate
    }
    
    override func tearDown() {
        mockApiService = nil
        mockCoreDataService = nil
        mockRepositoryDelegate = nil
        sut = nil
        super.tearDown()
    }
    
    func testGetStoreData() {
        sut.getStoreData()
        var data = DataWrapper<[Item], NetworkError>()
        data.data = mockstoreData.data.items
        
        sut.fetchedCoreData(data)
        XCTAssertEqual(mockRepositoryDelegate.fetchedRepositoryData, data)

    }
    
    func testFetchedApiData() {
        var apiResponse = DataWrapper<StoreResponseModel, NetworkError>()
        apiResponse.data = mockstoreData
        sut.fetchedApiData(apiResponse)
        XCTAssertEqual(mockRepositoryDelegate.fetchedRepositoryData?.data!, apiResponse.data?.data.items)
    }
    
    func testFetchedCoreData() {
        var data = DataWrapper<[Item], NetworkError>()
        data.data = mockstoreData.data.items
        
        sut.fetchedCoreData(data)
        XCTAssertEqual(mockRepositoryDelegate.fetchedRepositoryData, data)
    }
}





