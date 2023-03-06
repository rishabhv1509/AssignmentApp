//
//  ApiServiceTest.swift
//  AssignmentAppTests
//
//  Created by Rishabh Verma on 05/03/23.
//

import XCTest
@testable import AssignmentApp

class ApiServiceTests: XCTestCase {
    
    var apiService: ApiService!
    var mockNetworkClient: MockNetworkClient!
    var mockApiDelegate : MockApiDelegate!
    
    override func setUpWithError() throws {
        mockNetworkClient = MockNetworkClient()
        mockApiDelegate = MockApiDelegate()
        apiService = ApiService(networkClient: mockNetworkClient)
        apiService.apiDelegate = mockApiDelegate
    }
    
    override func tearDownWithError() throws {
        apiService = nil
        mockNetworkClient = nil
        mockApiDelegate = nil
    }
    
    func test_fetchStoreDataFromApi_callsGetResponseOnNetworkClient() throws {
        
        let url = URL(string: Urls.getStoreData)!
        apiService.fetchStoreDataFromApi()
        XCTAssertEqual(mockNetworkClient.urlRequest?.url, url)
    }
    
    func testValidData() throws {
        
        let mockStoreResponse = mockstoreData
        let mockData = try JSONEncoder().encode(mockStoreResponse)
        let apiResponse = ApiResponse<Data, NetworkError>.success(mockData)
        let expectation = XCTestExpectation(description: "Valid data")
        apiService.networkResponseRecieved(apiResponse)
        XCTAssertNotNil(self.mockApiDelegate.apiResponse?.data)
        XCTAssertEqual(mockStoreResponse, self.mockApiDelegate.apiResponse?.data)
        XCTAssertNotNil(self.mockApiDelegate.apiResponse?.data)
        expectation.fulfill()
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testError() throws {
        
        let networkError = NetworkError.clientError
        let apiResponse = ApiResponse<Data, NetworkError>.failure(networkError)
        apiService.networkResponseRecieved(apiResponse)
        let expectation = XCTestExpectation(description: "Network Error")
        XCTAssertNotNil(self.mockApiDelegate.apiResponse?.error)
        XCTAssertEqual(networkError, self.mockApiDelegate.apiResponse?.error)
        XCTAssertNotNil(self.mockApiDelegate.apiResponse?.error)
        expectation.fulfill()
        wait(for: [expectation], timeout: 1.0)
    }
    
}

class MockNetworkClient: NetworkClient {
    
    var urlRequest: URLRequest?
    
    override func getResponse(urlString: String) {
        guard let url = URL(string: urlString) else {
            self.networkDelegate?.networkResponseRecieved(.failure(.invalidURL))
            return
        }
        self.urlRequest = URLRequest(url: url)
    }
}




