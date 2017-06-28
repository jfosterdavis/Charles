//
//  CustomStoreCollectionViewCell.swift
//  Charles
//
//  Created by Jacob Foster Davis on 5/11/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation
import UIKit

class CustomStoreCollectionViewCell: CommonStoreCollectionViewCell {
    
    //label
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var buyButton: UIButton!
    
    //status
    @IBOutlet weak var statusShade: UIView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var pieLockImageView: UIImageView!
    @IBOutlet weak var characterOutfitBlocker: UIView!
    
    @IBOutlet weak var infoButton: UIButton!
    
    //expiration timer
    @IBOutlet weak var expirationStatusView: UIView!
    
    var characterClue: Character? = nil
    
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
        infoButton.roundCorners(with: infoButton.bounds.width / 2)
        
        characterOutfitBlocker.isHidden = true
        
        self.backgroundColor = UIColor(red: 249/255, green: 234/255, blue: 188/255, alpha: 1)
        
        self.canUserHighlight = true
        self.isUserInteractionEnabled = true
        self.infoButton.isEnabled = true
        
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
        
        self.canUserHighlight = true
        self.isUserInteractionEnabled = true
        self.infoButton.isEnabled = true
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
        
        self.canUserHighlight = true
        self.isUserInteractionEnabled = true
        self.infoButton.isEnabled = true
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
        
        self.canUserHighlight = true
        self.isUserInteractionEnabled = true
        self.infoButton.isEnabled = true
    }
    
    func setStatusLevelRequirementNotMet(levelRequired: Int) {
        //rotate and set text of the label
        statusLabel.transform = CGAffineTransform.identity //resets to normal
        //statusLabel.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 5) //rotates <45 degrees
        statusLabel.text = "Level \(levelRequired)"
        
        statusShade.alpha = 0.80
        characterOutfitBlocker.isHidden = false  //hide the outfit
        self.backgroundColor = .white //put the card to white
        statusShade.backgroundColor = UIColor(red: 102/255, green: 102/255, blue: 102/255, alpha: 1)
        setStatusVisibility(label: false, shade: true)
        
        priceLabel.text = ""
        priceLabel.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        priceLabel.font = UIFont(name:"GurmukhiMN-Bold", size: 15.0)
        
        self.canUserHighlight = false
        self.isUserInteractionEnabled = false
        self.infoButton.isEnabled = false
    }
    

    @IBAction override func infoButtonPressed(_ sender: Any) {
        //launch the clue if it exists
        
        print("character clue button pressed")
        
        if let character = self.characterClue, infoButton.isEnabled {
            
            //create an image from the CharacterView to display
            //define the frame (size) for the view
            let screen = self.superview!.bounds
            let width = screen.width / 3.6 //make image 1/3 size of CV
            let height = width
            let frame = CGRect(x: 0, y: 0, width: width, height: height)
            let x = (screen.size.width - frame.size.width) * 0.5
            let y = (screen.size.height - frame.size.height) * 0.5
            let mainFrame = CGRect(x: x, y: y, width: frame.size.width, height: frame.size.height)
            
            //setup the paramaters for it to draw
            let characterView = CharacterView()
            characterView.frame = mainFrame
            characterView.phrase = character.phrases![0]
            characterView.setNeedsDisplay()
            
            let characterViewImage = characterView.asImage()
            
            //check how long the description is and split in two
            let wordCount = Utilities.wordCount(character.gameDescription)
            
            let part1 = character.gameDescription
            let part2 = ""
            
            //            if wordCount.count > 30 {
            //                let twoHalves = Utilities.getTwoStringsFromOne(character.gameDescription)
            //                part1 = twoHalves.0
            //                part2 = twoHalves.1
            //            } else {
            //
            //            }
            
            //create a clue based on the perk that was pressed
            let characterClue = Clue(clueTitle: character.name,
                                     part1: nil,
                                     part1Image: characterViewImage,
                                     part2: part1,
                                     part3: part2
            )
            
            if let storyboard = self.storyboard {
                let topVC = topMostController()
                let clueVC = storyboard.instantiateViewController(withIdentifier: "BasicClueViewController") as! BasicClueViewController
                clueVC.clue = characterClue
                clueVC.delayDismissButton = false
                //set the background to paper color
                clueVC.view.backgroundColor = UIColor(red: 249/255, green: 234/255, blue: 188/255, alpha: 1) //paper color
                clueVC.overrideTextColor = .black
                clueVC.overrideGoldenRatio = true
                clueVC.overrideStackViewDistribution = .fillProportionally
                
                topVC.present(clueVC, animated: true, completion: nil)
            }
        }
    }
    
}
