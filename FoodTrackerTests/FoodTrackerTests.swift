//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Venkateshwarlu Jangili on 10/23/16.
//  Copyright © 2016 Venkat Jangili. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testMealInitialization()
    {
        //Success Case
        let item = Meal(name: "Newest Meal", photo: nil, rating: 5)
        XCTAssertNotNil(item)
        
        // Failure cases.
        let noName = Meal(name: "", photo: nil, rating: 0)
        XCTAssertNil(noName, "Empty name is invalid")
        
        //Failure Case
        let badRating = Meal(name: "Bad Rating", photo: nil, rating: -1)
        XCTAssertNil(badRating)
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
