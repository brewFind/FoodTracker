//
//  MealTableViewCell.swift
//  FoodTracker
//
//  Created by Venkateshwarlu Jangili on 10/25/16.
//  Copyright © 2016 Venkat Jangili. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {

    //MARK: Properties
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgSelectedPic: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
