//
//  NetworkClientTest.swift
//  AssignmentAppTests
//
//  Created by Rishabh Verma on 13/02/23.
//


 
import XCTest
@testable import AssignmentApp

class NetworkClientTests: XCTestCase {
    
    var sut: NetworkClient! 
    var mockDelegate: MockNetworkDelegate!
    
    override func setUpWithError() throws {
        self.mockDelegate = MockNetworkDelegate()
        self.sut = NetworkClient()
        self.sut.networkDelegate = self.mockDelegate
    }
    
    override func tearDownWithError() throws {
        self.sut = nil
        self.mockDelegate = nil
    }
    
//    func testValidURL() throws {
        func testGetResponseWithValidURL() {
            let validURL = Urls.getStoreData
            let expectation = XCTestExpectation(description: "Valid URL and Data")
            
            sut.getResponse(urlString:validURL)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                XCTAssertNotNil(self.mockDelegate.apiResponse)
                switch self.mockDelegate.apiResponse! {
                    case .success(let data):
                        XCTAssertNotNil(data)
                        expectation.fulfill()
                    case .failure(_):
                        XCTFail("Response should be successful")
                }
            }
            wait(for: [expectation], timeout: 10)

        }

    

    
    func testInvalidUrl() {
        let expectation = XCTestExpectation(description: "Invalid URL")
        
        sut.getResponse(urlString: "invalid url")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            XCTAssertNotNil(self.mockDelegate.apiResponse)
            switch self.mockDelegate.apiResponse! {
                case .success(_):
                    XCTFail("Response should be a failure")
                case .failure(let error):
                    XCTAssertEqual(error, NetworkError.invalidURL)
                    expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 10)
    }
    
    func testValidUrlAndInvalidData() {
        let expectation = XCTestExpectation(description: "Valid URL and Invalid Data")
        
        sut.getResponse(urlString: "https://jsonplaceholder.typicode.com/invalid")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            XCTAssertNotNil(self.mockDelegate.apiResponse)
            switch self.mockDelegate.apiResponse! {
                case .success(_):
                    XCTFail("Response should be a failure")
                case .failure(let error):
                    XCTAssertEqual(error, NetworkError.clientError)
                    expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 10)
    }
}
    

