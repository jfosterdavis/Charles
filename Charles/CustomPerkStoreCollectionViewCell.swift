//
//  CustomPerkStoreCollectionViewCell.swift
//  Charles
//
//  Created by Jacob Foster Davis on 5/29/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation
import UIKit

class CustomPerkStoreCollectionViewCell: CustomStoreCollectionViewCell {
    
    
    @IBOutlet weak var perkIconImageView: UIImageView!
    @IBOutlet weak var perkColorFrame: UIView!
    @IBOutlet weak var perkGotFromCharacterIndicator: UIImageView!
    
    /// Adds buttons from the given phrase to the stackview
    func loadAppearance(fromPerk perk: Perk) {
        
        //empty all
        for subView in stackView.subviews {
            stackView.removeArrangedSubview(subView)
            
            //remove button from heirarchy
            subView.removeFromSuperview()
        }
        
        //create the ImageView
        perkIconImageView.image = perk.icon
        //perkIconImageView.backgroundColor = perk.displayColor
        
        //color the border
        perkColorFrame.layer.borderWidth = 5
        perkColorFrame.layer.borderColor = perk.displayColor.cgColor
        perkColorFrame.roundCorners(with: 6)
        
        //stackView.addArrangedSubview(imageView)
                
        roundCorners()
        
        perkGotFromCharacterIndicator.roundCorners(with: 6)
        
        
        
    }
    
    func setGotPerkFromCharacterIndicator(visible: Bool) {
        perkGotFromCharacterIndicator.isHidden = !visible
    }
    
    override func setStatusAffordable() {
        //rotate and set text of the label
        statusLabel.transform = CGAffineTransform.identity //resets to normal
        statusLabel.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 5) //rotates <45 degrees
        statusLabel.text = "For Hire"
        
        statusShade.alpha = 0.1
        statusShade.backgroundColor = UIColor(red: 102/255, green: 102/255, blue: 102/255, alpha: 1)
        
        setStatusVisibility(label: false, shade: true)
        
        priceLabel.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        priceLabel.font = UIFont(name:"GurmukhiMN", size: 15.0)
    }
    
    override func setStatusUnaffordable() {
        //rotate and set text of the label
        statusLabel.transform = CGAffineTransform.identity //resets to normal
        statusLabel.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 5) //rotates <45 degrees
        statusLabel.text = "For Hire"
        
        priceLabel.layer.zPosition = 1
        self.setNeedsDisplay()
        
        statusShade.alpha = 0.45
        statusShade.backgroundColor = UIColor(red: 102/255, green: 102/255, blue: 102/255, alpha: 1)
        setStatusVisibility(label: false, shade: true)
        
        priceLabel.textColor = .red
        priceLabel.font = UIFont(name:"GurmukhiMN-Bold", size: 15.0)
    }
    
    func setStatusRequiredCharacterNotPresent() {
        //rotate and set text of the label
        statusLabel.transform = CGAffineTransform.identity //resets to normal
        //statusLabel.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 5) //rotates <45 degrees
        statusLabel.text = "Requires Party"
        
        perkGotFromCharacterIndicator.layer.zPosition = 1
        self.setNeedsDisplay()
        
        statusShade.alpha = 0.85
        statusShade.backgroundColor = UIColor(red: 102/255, green: 102/255, blue: 102/255, alpha: 1)
        setStatusVisibility(label: false, shade: true)
        
        priceLabel.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        priceLabel.font = UIFont(name:"GurmukhiMN-Bold", size: 15.0)
    }

    ///sets the visual status to affordable and ready for purchase
    override func setStatusUnlocked() {
        setStatusVisibility(label: false, shade: false)
        
        priceLabel.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        priceLabel.font = UIFont(name:"GurmukhiMN", size: 15.0)
        priceLabel.text = "Active"
    }
    
}
