//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Venkateshwarlu Jangili on 10/23/16.
//  Copyright © 2016 Venkat Jangili. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    
    override public var intrinsicContentSize: CGSize {
        return CGSize(width: 240, height: 44)
    }
    
    //MARK: Properties
    var rating = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    var ratingButtons = [UIButton]()
    let spacing = 5
    let starCount = 5
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
    //MARK: Action Button
    func ratingButtonTapped(button: UIButton)
    {
        rating = ratingButtons.index(of: button)! + 1
        
        updateButtonSelectionStates()
        
    }
    
    //MARK: Initialization
    required init?(coder aDecoder: NSCoder) {
        
        let filledStarImage = UIImage(named: "FilledStar")
        let emptyStarImage = UIImage(named: "EmptyStar")
        
        super.init(coder: aDecoder)
        
        for _ in 0..<starCount{
            
            let button = UIButton()
            
            button.setImage(emptyStarImage, for: .normal)
            button.setImage(filledStarImage, for: .selected)
            button.setImage(filledStarImage, for: [.highlighted, .selected])
            
            button.adjustsImageWhenHighlighted = false
            
            //button.backgroundColor = UIColor.red
            
            //Add Button action using this code
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchDown)
            
            ratingButtons += [button]
            
            addSubview(button)
        }
    }
    
    override func layoutSubviews() {
        
        let buttonSize = Int(frame.size.height)
        
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        //Offset each button;s Origin by the length of the buttons plus spacing.
        for(index, button) in ratingButtons.enumerated(){
            
            buttonFrame.origin.x = CGFloat(index * (buttonSize+spacing))
            button.frame = buttonFrame
            
        }
        
        updateButtonSelectionStates()
    }
    
    func updateButtonSelectionStates() {
        for (index, button) in ratingButtons.enumerated() {
            // If the index of a button is less than the rating, that button should be selected.
            button.isSelected = index < rating
        }
    }
    

}
