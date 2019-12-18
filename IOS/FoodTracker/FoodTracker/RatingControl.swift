//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Felipe Valencia  on 11/11/19.
//  Copyright © 2019 Felipe Valencia . All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    //MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
     
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    //MARK: Properties
    private var ratingButtons = [UIButton]()
    var rating = 0 {
        didSet {
            updateButtonState()
        }
    }
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet {
            setupButtons()
        }
    }
     
    @IBInspectable var starCount: Int = 5 {
        didSet {
            setupButtons()
        }
    }
    
    
    //MARK: Button Actions
    @objc func buttonPressed(button: UIButton) {
        guard let index = ratingButtons.firstIndex(of: button) else {
            fatalError("The button \(button) is not in the ratingButtons Array: \(ratingButtons)")
        }
        let selectedRating = index+1
        if selectedRating == rating {
            // If the user taps the rightmost selected star, they reset
            rating = 0
        }
        else {
            // Else update the stars
            rating = selectedRating
        }
    }
    
    
    //MARK: Private Methods
    private func setupButtons() {
        //Clear any existing buttons
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named:"emptyStar", in:bundle, compatibleWith: self.traitCollection)
        let highlitedStar = UIImage(named:"highlightedStar", in:bundle, compatibleWith: self.traitCollection)
        
        //Create starCount buttons
        for i in 0..<starCount {
            // Create the button
            let button = UIButton()
            
            // Set Button Images
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlitedStar, for: .highlighted)
            button.setImage(highlitedStar, for: [.highlighted, .selected])
            
            // Set the Accesibility Label
            button.accessibilityLabel = "Set \(i+1) star rating"
            
            // Add constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height
            ).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            // Setup the button action
            button.addTarget(self, action: #selector(RatingControl.buttonPressed(button:)), for: .touchUpInside)
            
            // Add the button to the stack
            addArrangedSubview(button)
            
            // Add the new button to the rating button array
            ratingButtons.append(button)
        }
        updateButtonState()
    }
    
    private func updateButtonState() {
        for (index,button) in ratingButtons.enumerated() {
            button.isSelected = index < rating
            
            
            // Set the hint string for the currently selected star
            let hintString: String?
            if rating == index + 1 {
                hintString = "Tap to reset the rating to zero."
            } else {
                hintString = nil
            }
             
            // Calculate the value string
            let valueString: String
            switch (rating) {
            case 0:
                valueString = "No rating set."
            case 1:
                valueString = "1 star set."
            default:
                valueString = "\(rating) stars set."
            }
             
            // Assign the hint string and value string
            button.accessibilityHint = hintString
            button.accessibilityValue = valueString
        }
    }
}
