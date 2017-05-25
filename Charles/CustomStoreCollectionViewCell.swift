//
//  CustomStoreCollectionViewCell.swift
//  Charles
//
//  Created by Jacob Foster Davis on 5/11/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation
import UIKit

class CustomStoreCollectionViewCell: UICollectionViewCell {
    
    //label
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var buyButton: UIButton!
    
    
    /******************************************************/
    /*******************///MARK: Appearance
    /******************************************************/


    func roundCorners() {
        
        self.layer.masksToBounds = true
        var maskLayer = CAShapeLayer()
        
        //top left
        
        maskLayer.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.allCorners], cornerRadii: CGSize(width: 10, height: 10)).cgPath
        self.layer.mask = maskLayer

    }
    
    /// Adds buttons from the given phrase to the stackview
    func loadAppearance(from phrase: Phrase) {
        
        guard let slots = phrase.slots else {
            //TODO: handle phrase with nil slots
            return
            
        }
        
        //buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        var counter = 0
        //step through each slot and createa  button for it
        for slot in slots {
            //create a button
            let slotButton = createButton(from: slot)
            //add the button to the array of buttons
            //currentButtons.append(slotButton)
            
            //add the button to the stackview
            stackView.addArrangedSubview(slotButton)
            
            //create layout constraints for the button
            let widthConstraint = NSLayoutConstraint(item: slotButton, attribute: .width, relatedBy: .equal, toItem: stackView, attribute: .width, multiplier: 1, constant: 0)
            widthConstraint.isActive = true
            stackView.addConstraint(widthConstraint)
            
            counter += 1
        }
        
        roundCorners()
        
        
        
    }
    
    /// creates a new button with the color indicated by the given Slot
    func createButton(from slot: Slot) -> UIButton {
        let newButton = UIButton(type: .system)
        newButton.backgroundColor = slot.color
        newButton.setTitle("", for: .normal)
        
        //disable buttons in this interface
        newButton.isEnabled = false
        return newButton
    }
}
