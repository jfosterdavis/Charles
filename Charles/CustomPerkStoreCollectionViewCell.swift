//
//  CustomPerkStoreCollectionViewCell.swift
//  Charles
//
//  Created by Jacob Foster Davis on 5/29/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation
import UIKit
import StoreKit

class CustomPerkStoreCollectionViewCell: CustomStoreCollectionViewCell {
    
    
    @IBOutlet weak var perkIconImageView: UIImageView!
    @IBOutlet weak var perkColorFrame: UIView!
    @IBOutlet weak var perkGotFromCharacterIndicator: UIImageView!
    @IBOutlet weak var perkIconBlocker: UIView!
    
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
        
        perkGotFromCharacterIndicator.image = #imageLiteral(resourceName: "GroupChecked")
        perkGotFromCharacterIndicator.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 0.95) //an off-white
        perkGotFromCharacterIndicator.roundCorners(with: 6)
        
        //make background the paper color
        self.backgroundColor = UIColor(red: 249/255, green: 234/255, blue: 188/255, alpha: 1)
        
        perkIconBlocker.isHidden = true
        
        //default the shade on top unless others will change
        perkGotFromCharacterIndicator.layer.zPosition = 2
        perkGotFromCharacterIndicator.alpha = 0.65
        
        characterNameLabel.textColor = .black
        
    }
    
    func loadAppearance(fromAppStoreProduct product: SKProduct, fromASPD aspd: AppStoreProductDetail) {
        
        //empty all, don't use the stackview
        for subView in stackView.subviews {
            stackView.removeArrangedSubview(subView)
            
            //remove button from heirarchy
            subView.removeFromSuperview()
        }
        
        
        
        //create the ImageView
        perkIconImageView.image = aspd.icon
        
        //make the background color app store blue
        //perkIconImageView.backgroundColor = aspd.displayColor
        
        //color the border
        perkColorFrame.layer.borderWidth = 4 //make distinct from perks
        perkColorFrame.layer.borderColor = aspd.displayColor.cgColor
        perkColorFrame.roundCorners(with: 3) //make frame distinct from perks
        
        //stackView.addArrangedSubview(imageView)
        
        roundCorners(with: 3) //make corners distinct from perks
        
        perkGotFromCharacterIndicator.image = #imageLiteral(resourceName: "GroupChecked")
        perkGotFromCharacterIndicator.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 0.95) //an off-white
        perkGotFromCharacterIndicator.roundCorners(with: 6)
        
        //make background app store blue
        self.backgroundColor = UIColor(red: 26/255, green: 91/255, blue: 238/255, alpha: 1)
        
        perkIconBlocker.isHidden = true
        
        //default the shade on top unless others will change
        perkGotFromCharacterIndicator.layer.zPosition = 2
        perkGotFromCharacterIndicator.alpha = 0.65
        
        statusLabel.alpha = 0
        expirationStatusView.isHidden = true
        pieLockImageView.isHidden = true
        
        priceLabel.textColor = .white
        characterNameLabel.textColor = .white
        
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
        perkGotFromCharacterIndicator.alpha = 1
        perkGotFromCharacterIndicator.image = #imageLiteral(resourceName: "GroupMissing")
        perkGotFromCharacterIndicator.backgroundColor = UIColor(red: 255/255, green: 94/255, blue: 94/255, alpha: 1) //a gentle red
        self.setNeedsDisplay()
        
        //put to black and white
        self.backgroundColor = .white
        perkIconBlocker.isHidden = false
        perkColorFrame.layer.borderColor = UIColor.black.cgColor
        
        statusShade.alpha = 0.80
        statusShade.backgroundColor = UIColor(red: 102/255, green: 102/255, blue: 102/255, alpha: 1)
        setStatusVisibility(label: false, shade: true)
        
        priceLabel.text = ""
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
