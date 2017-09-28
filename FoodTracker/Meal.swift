//
//  Meal.swift
//  FoodTracker
//
//  Created by Venkateshwarlu Jangili on 10/25/16.
//  Copyright © 2016 Venkat Jangili. All rights reserved.
//

import UIKit

class Meal{
    
    //MARK: Properties
    var name: String
    var photo: UIImage?
    var rating: Int
    
    init?(name: String, photo: UIImage?, rating: Int) {
        
        self.name = name
        self.photo = photo
        self.rating = rating
        
        //Initialization should fail if there is no Name or the rating is -ve
        
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
    

}
