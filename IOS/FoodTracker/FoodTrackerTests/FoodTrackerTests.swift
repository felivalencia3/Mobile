//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Felipe Valencia  on 11/19/19.
//  Copyright © 2019 Felipe Valencia . All rights reserved.
//
import XCTest
@testable import FoodTracker
 
class FoodTrackerTests: XCTestCase {
    //MARK: Meal Class Tests
    // Confirm that the Meal initializer returns a Meal object when passed valid parameters.
    func testMealInitializationSucceeds() {
        //Zero Rating
        let zeroRatingMeal = Meal.init(rating: 0, image: nil, name: "zeroRating")
        XCTAssertNotNil(zeroRatingMeal)
        
        //Highest Positive Rating
        let positiveRatingMeal = Meal.init(rating: 5, image: nil, name: "postiveRating")
        XCTAssertNotNil(positiveRatingMeal)
    }
    
    // Confirms that the Meal initializer return nil when passed incorrect parameters
    func testMealInitializationFail() {
        // Negative Rating
        let negativeRatingMeal = Meal(rating:-1,image:nil,name:"negativeRating")
        XCTAssertNil(negativeRatingMeal)
        
        //Empty String
        let emptyStringMeal = Meal.init(rating:0, image:nil, name:"")
        XCTAssertNil(emptyStringMeal)
        
        //Large Rating
        let largeRatingMeal = Meal.init(rating: 20, image: nil, name:"")
        XCTAssertNil(largeRatingMeal)
    }
}
