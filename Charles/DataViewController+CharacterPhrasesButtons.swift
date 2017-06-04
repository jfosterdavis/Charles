//
//  DataViewController+CharacterPhrasesButtons.swift
//  Charles
//
//  Created by Jacob Foster Davis on 5/29/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation
import UIKit

/******************************************************/
/*******************///MARK: Related to the Character, Phrases and Buttons
/******************************************************/

extension DataViewController {
    
    
    /******************************************************/
    /*******************///MARK: Character
    /******************************************************/
    
    //fades in the stackView.  Assumes buttons are already loaded
    func fadeInCharacter() {
        
        UIView.animate(withDuration: 0.8,
                       delay: 0.0,
                       options: [.curveEaseInOut],
                       animations: {
                        self.buttonStackView.alpha = 1
        }, completion: { (finished:Bool) in
            self.setAllUserInteraction(enabled: true)
            
            //refresh the view
            //self.viewDidLayoutSubviews()
            
        })
        
        
    }
    
    ///checks the store for expired characters.  If found they are removed and the storeClosed() function is called. Returns true if expired characters were found, false otherwise
    func checkForAndRemoveExpiredCharacters() -> [Character]? {
        
        //create a store object to use its functions for checking if characters have expired
        let storeVC = self.storyboard!.instantiateViewController(withIdentifier: "Store") as! StoreCollectionViewController
        let expiredCharacters: [UnlockedCharacter] = storeVC.getExpiredCharacters()
        
        if !expiredCharacters.isEmpty {
            
            //prepare the data for the VC
            var departingCharacters: [Character] = [Character]()
            for unlockedCharacter in expiredCharacters {
                for character in Characters.ValidCharacters {
                    if unlockedCharacter.name == character.name {
                        departingCharacters.append(character)
                    }
                }
            }
            
            //there are expired characters.  lock them and reload the modelController
            storeVC.parentVC = self
            storeVC.lockAllExpiredCharacters()
            
            self.parentVC.storeClosed()
            
            return departingCharacters
            
        } else {
            return nil
        }
    }
    
    
    /******************************************************/
    /*******************///MARK: Buttons
    /******************************************************/

    /// Round button corners.  Must be called in viewDidLayoutSubviews
    func roundButtonCorners(topRadius: Int, bottomRadius: Int) {
        
        let button = currentButtons[0]
        //round the corners of the top buttons
        button.layer.masksToBounds = true
        let maskLayer = CAShapeLayer()
        
        maskLayer.path = UIBezierPath(roundedRect: buttonStackView.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: topRadius, height: topRadius)).cgPath
        button.layer.mask = maskLayer
        
        //round the corners of the bottom button
        //        button = currentButtons[currentButtons.count - 1]
        // /******************************************************/
        /*******************///MARK: Timer
        /******************************************************/
        
        func updateTimer() {
            //reduce the score
            let currentScore = getCurrentScore()
            
            if currentScore >= 0 {
                let penalty = pointsToLoseEachCycle
                var newScore = currentScore - penalty
                
                if newScore < 0 {
                    newScore = 0
                }
                if !(newScore == 0 && currentScore == 0) {
                    setCurrentScore(newScore: newScore)
                    refreshScore()
                }
            }
        }
        //        maskLayer = CAShapeLayer()
        //
        //        maskLayer.path = UIBezierPath(roundedRect: button.bounds, byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize(width: bottomRadius, height: bottomRadius)).cgPath
        //        //maskLayer.frame = button.bounds
        //        //maskLayer.position = button.center
        //
        //        button.layer.mask = maskLayer
    }
    
    /// fades the stackview out, removes old buttons, then Adds buttons from the given phrase to the stackview
    func removeAndReloadButtons(from phrase: Phrase) {
        
        var delay = 1.5
        if getCurrentScore() <= minimumScoreToUnlockObjective && objectiveFeedbackView.alpha < 1.0 {
            delay = 0.1
        }
        
        UIView.animate(withDuration: 0.5,
                       delay: delay,
                       options: [.curveEaseInOut],
                       animations: {
                        //hide the stackview
                        self.buttonStackView.alpha = 0.0
                        
                        
                        
        }, completion: { (finished:Bool) in
            
            //first, remove all current buttons from the stackview
            self.removeAllButtons()
            
            //now add a new set of buttons
            self.addNewButtons(from: phrase)
            
            self.fadeInCharacter()
            
        })
        
    }
    
    
    //loads the character without animation
    func initialButtonLoad(from phrase: Phrase){
        removeAllButtons()
        
        addNewButtons(from: phrase)
        
        buttonStackView.alpha = 1.0
        
        setAllUserInteraction(enabled: true)
    }
    
    //adds buttons to the stackView from the given phrase
    func addNewButtons(from phrase: Phrase) {
        
        guard let slots = phrase.slots else {
            //TODO: handle phrase with nil slots
            return
            
        }
        
        var counter = 0
        //step through each slot and createa  button for it
        for slot in slots {
            //create a button
            let slotButton = self.createButton(from: slot)
            //slotButton.isHidden = true
            slotButton.isEnabled = false
            //add the button to the array of buttons
            self.currentButtons.append(slotButton)
            
            //add the button to the stackview
            self.buttonStackView.addArrangedSubview(slotButton)
            
            //create layout constraints for the button
            let widthConstraint = NSLayoutConstraint(item: slotButton, attribute: .width, relatedBy: .equal, toItem: self.buttonStackView, attribute: .width, multiplier: 1, constant: 0)
            widthConstraint.isActive = true
            self.buttonStackView.addConstraint(widthConstraint)
            
            counter += 1
        }
    }
    
    ///removes all buttons from the stackview
    func removeAllButtons() {
        //disable and fade out
        setAllUserInteraction(enabled: false)
        
        //disable the buttons
        for button in currentButtons {
            button.isEnabled = false
        }
        
        //fade out the stack
        //        UIView.animate(withDuration: 1.4, animations: {
        //            self.buttonStackView.alpha = 0.0
        //        })
        
        for button in currentButtons {
            guard buttonStackView.arrangedSubviews.index(of: button) != nil else {
                //TODO: Handle index not found
                return
            }
            
            buttonStackView.removeArrangedSubview(button)
            
            //remove button from heirarchy
            button.removeFromSuperview()
        }
        
        
        //remove all buttons from the local list
        currentButtons.removeAll()
    }
    
    func reloadButtons() {
        loadRandomPhrase()
        
        //2. load the buttons
        removeAndReloadButtons(from: currentPhrase)
    }
    
    /// creates a new button with the color indicated by the given Slot
    func createButton(from slot: Slot) -> UIButton {
        let newButton = UIButton(type: .system)
        newButton.backgroundColor = slot.color
        newButton.setTitle("", for: .normal)
        newButton.addTarget(self, action: #selector(buttonPress), for: .touchUpInside)
        return newButton
    }
    
    ///sets all buttons, except store button, to disabled or enabled
    func setAllUserInteraction(enabled: Bool) {
        
        characterInteractionEnabled = enabled
        
        for button in currentButtons {
            button.isEnabled = enabled
        }
        
        objectiveFeedbackView.isUserInteractionEnabled = enabled
        
    }
    
    /******************************************************/
    /*******************///MARK: Phrases
    /******************************************************/

    func loadRandomPhrase() {
        //1. get a random phrase from the character
        currentPhrase = dataObject.selectRandomPhrase()
        guard currentPhrase != nil  else {
            //TODO: handle nil returned for random phrase
            print("Nil phrase returned")
            return
        }
    }
}
