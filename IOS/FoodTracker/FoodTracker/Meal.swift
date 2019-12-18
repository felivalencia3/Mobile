//
//  Meal.swift
//  FoodTracker
//
//  Created by Felipe Valencia  on 11/19/19.
//  Copyright © 2019 Felipe Valencia . All rights reserved.
//

import UIKit

class Meal {
    //MARK: Properties
    var rating: Int
    var image: UIImage?
    var name: String
    
    
    //MARK: Initialization
    init?(rating: Int, image: UIImage?, name: String) {
        guard !name.isEmpty else {
            return nil
        }
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        self.name = name
        self.rating = rating
        self.image = image
    }
    
}
