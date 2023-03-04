//
//  CoreDataServiceTest.swift
//  AssignmentAppTests
//
//  Created by Rishabh Verma on 02/03/23.
//

import XCTest
@testable import AssignmentApp

class CoreDataServiceTest: XCTestCase {
    
    var coreDataService : CoreDataService!
    var coreDataDelegate : CoreDataDelegate!
    
   
    
    override func setUp() {
        super.setUp()
        coreDataService = CoreDataService.instance
        coreDataDelegate = Core
        coreDataService.coreDataDelegate = Core
        
    }
     
     override func tearDown() {
         coreDataService = nil
     }
    
     func testSaveItems(){
         let items = [
            Item(name: "Item 1", price: "100", image: "image", extra: "Same day shipping")
         ]
         coreDataService.deleteAll()
          coreDataService.saveDataInDb(items: items)
         let storeItems = coreDataService.fetchDataFromDb()
         XCTAssertEqual(items.count, storeItems.count)
     }
    
 
    }
    

