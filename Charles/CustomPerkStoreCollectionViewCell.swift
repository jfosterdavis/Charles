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
    
    var perkClue: Perk? = nil
    
    /// Adds buttons from the given phrase to the stackview
    func loadAppearance(fromPerk perk: Perk) {
        
        //empty all
        for subView in stackView.subviews {
            stackView.removeArrangedSubview(subView)
            
            //remove button from heirarchy
            subView.removeFromSuperview()
        }
        
        self.perkClue = perk
        
        //create the ImageView
        perkIconImageView.image = perk.icon
        
        //perkIconImageView.backgroundColor = perk.displayColor
        
        //color the border
        perkColorFrame.layer.borderWidth = 5
        perkColorFrame.layer.borderColor = perk.displayColor.cgColor
        perkColorFrame.roundCorners(with: 6)
        
        //stackView.addArrangedSubview(imageView)
                
        roundCorners()
        //infoButton.roundCorners(with: infoButton.bounds.width / 2)
        
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
        
        self.canUserHighlight = true
        self.isUserInteractionEnabled = true
        self.canShowInfo = true
        
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
        
        self.canUserHighlight = true
        self.isUserInteractionEnabled = true
        self.canShowInfo = true
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
        
        self.canUserHighlight = true
        self.isUserInteractionEnabled = true
        self.canShowInfo = true
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
        
        self.canUserHighlight = false
        self.isUserInteractionEnabled = false
        self.canShowInfo = false
    }

    ///sets the visual status to affordable and ready for purchase
    override func setStatusUnlocked() {
        setStatusVisibility(label: false, shade: false)
        
        priceLabel.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        priceLabel.font = UIFont(name:"GurmukhiMN", size: 15.0)
        priceLabel.text = "Active"
        
        self.canUserHighlight = true
        self.isUserInteractionEnabled = true
        self.canShowInfo = true
    }
    
    override func showInfo() {
        //launch the clue if it exists
        
        print("perk clue button pressed")
        
        if let perk = self.perkClue, canShowInfo {
            
            //create a clue based on the perk that was pressed
            let perkClue = Clue(clueTitle: perk.name,
                                part1: nil,
                                part1Image: perk.icon,
                                part2: perk.gameDescription
            )
            
            
            if let storyboard = self.storyboard {
                let topVC = topMostController()
                let clueVC = storyboard.instantiateViewController(withIdentifier: "BasicClueViewController") as! BasicClueViewController
                clueVC.clue = perkClue
                clueVC.delayDismissButton = false
                //set the background
                clueVC.view.backgroundColor = UIColor(red: 107/255, green: 12/255, blue: 0/255, alpha: 1) //expired perks background color
                clueVC.overrideTextColor = UIColor(red: 249/255, green: 234/255, blue: 188/255, alpha: 1) //paper color
                clueVC.overrideGoldenRatio = true
                //clueVC.overrideStackViewDistribution = .fillProportionally
                
                topVC.present(clueVC, animated: true, completion: nil)
            }
        }
    }
}
