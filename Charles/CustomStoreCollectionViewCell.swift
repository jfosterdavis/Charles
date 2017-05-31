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
    
    //status
    @IBOutlet weak var statusShade: UIView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var pieLockImageView: UIImageView!
    
    //expiration timer
    @IBOutlet weak var expirationStatusView: UIView!
    
    
    
    
    /******************************************************/
    /*******************///MARK: Appearance
    /******************************************************/


//    func roundCorners() {
//        
//        self.layer.masksToBounds = true
//        var maskLayer = CAShapeLayer()
//        
//        //top left
//        
//        maskLayer.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.allCorners], cornerRadii: CGSize(width: 10, height: 10)).cgPath
//        self.layer.mask = maskLayer
//
//    }
    
    /// Adds buttons from the given phrase to the stackview
    func loadAppearance(from phrase: Phrase) {
        
        guard let slots = phrase.slots else {
            //TODO: handle phrase with nil slots
            return
            
        }
        
        //empty all buttons
        for subView in stackView.subviews {
            stackView.removeArrangedSubview(subView)
            
            //remove button from heirarchy
            subView.removeFromSuperview()
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
    
    /******************************************************/
    /*******************///MARK: Status
    /******************************************************/

    ///sets the status to unlocked
    func setStatusAffordable() {
        //rotate and set text of the label
        statusLabel.transform = CGAffineTransform.identity //resets to normal
        statusLabel.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 5) //rotates <45 degrees
        statusLabel.text = "For Hire"
        
        statusShade.alpha = 0.05
        statusShade.backgroundColor = UIColor(red: 102/255, green: 102/255, blue: 102/255, alpha: 1)
        
        setStatusVisibility(label: true, shade: true)
        
        priceLabel.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        priceLabel.font = UIFont(name:"GurmukhiMN", size: 15.0)
    }
    
    func setStatusVisibility(label: Bool, shade: Bool){
        statusLabel.isHidden = !label
        statusShade.isHidden = !shade
    }
    
    ///sets the visual status to affordable and ready for purchase
    func setStatusUnlocked() {
        setStatusVisibility(label: false, shade: false)
        
        priceLabel.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        priceLabel.font = UIFont(name:"GurmukhiMN", size: 15.0)
        priceLabel.text = "Employed"
    }
    
    func setStatusUnaffordable() {
        //rotate and set text of the label
        statusLabel.transform = CGAffineTransform.identity //resets to normal
        statusLabel.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 5) //rotates <45 degrees
        statusLabel.text = "For Hire"
        
        priceLabel.layer.zPosition = 1
        self.setNeedsDisplay()
        
        statusShade.alpha = 0.45
        statusShade.backgroundColor = UIColor(red: 102/255, green: 102/255, blue: 102/255, alpha: 1)
        setStatusVisibility(label: true, shade: true)
        
        priceLabel.textColor = .red
        priceLabel.font = UIFont(name:"GurmukhiMN-Bold", size: 15.0)
    }
    
    func setStatusLevelRequirementNotMet(levelRequired: Int) {
        //rotate and set text of the label
        statusLabel.transform = CGAffineTransform.identity //resets to normal
        //statusLabel.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 5) //rotates <45 degrees
        statusLabel.text = "Level \(levelRequired)"
        
        statusShade.alpha = 0.75
        statusShade.backgroundColor = UIColor(red: 102/255, green: 102/255, blue: 102/255, alpha: 1)
        setStatusVisibility(label: false, shade: true)
        
        priceLabel.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        priceLabel.font = UIFont(name:"GurmukhiMN-Bold", size: 15.0)
    }

}
