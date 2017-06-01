//
//  DataViewController+GameObjective.swift
//  Charles
//
//  Created by Jacob Foster Davis on 5/29/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation
import UIKit
/******************************************************/
/*******************///MARK: Extension for everything to do with the objective thingy
/******************************************************/


extension DataViewController {
  
    /******************************************************/
    /*******************///MARK: The Color Feedback Thingy
    /******************************************************/
    
    /// removes all orientation, resets the orientation flag, and gives the color indicator the given color as the objective, and animates its presentation
    func reloadObjective(using color: UIColor) {
        
        if !self.objectiveFeedbackView.orientationUp {
            self.objectiveFeedbackView.toggleOrientationAndAnimate()
        }
        
        //allow user to access the stores for a few seconds
        fadeViewInThenOut(view: self.storeButton, fadeInAfterSeconds: 6.3)
        
        //only control the perk store if the player level is above minimum + 2
        if self.getUserCurrentLevel()!.level > (self.minimumLevelToUnlockPerkStore + 2) {
            fadeViewInThenOut(view: self.perkStoreButton, fadeInAfterSeconds: 6.3)
        }
        
        //fade out the objective
        objectiveFeedbackView.fade(.out,
                                   withDuration: 0.5,
                                   delay: 0.6,
                                   completion: { (finished:Bool) in
        
                                    //if user has a score high enough, load another objective
                                    if self.getCurrentScore() >= self.minimumScoreToUnlockObjective {
                                        self.loadAndFadeInFeedbackObjective(using: color)
                                    }
        })
        
    }
    
    func loadAndFadeInFeedbackObjective(using color: UIColor) {
        //remove rotation and reset orientation flag
        self.objectiveFeedbackView.resetOrientation()
        
        
        self.objectiveFeedbackView.objectiveRingColor = color
        self.objectiveFeedbackView.setNeedsDisplay()
        
        let objectiveBackDelay = 2.3
        
        self.objectiveFeedbackView.fade(.in,
                                        withDuration: 0.5,
                                        delay: objectiveBackDelay)
    
    }
    
    
    /// Allow the color feedback view to register when it is touched and call colorFeedbackTouched
    func registerTouchRecognizerColorFeedback() {
        // 3. add action to myView
        let gesture = UITapGestureRecognizer(target: self, action: #selector(DataViewController.colorFeedbackTouched(_:)))
        
        self.objectiveFeedbackView.addGestureRecognizer(gesture)
    }
    
    func colorFeedbackTouched(_ sender:UITapGestureRecognizer) {
        self.objectiveFeedbackView.toggleOrientationAndAnimate()
    }
    
    ///Consider's the player's level and returns a color for the objective
    func getGameColor(usingLevel playerLevel: Level) -> UIColor {
        
        //The level describes if predetermined sets are eligible, if a random color is elibigle, or both
        let predeterminedColors = playerLevel.eligiblePredefinedObjectives!
        let randomColorPrecision = playerLevel.eligibleRandomColorPrecision
        
        //if for some reason both are nil or empty, just return a random color of default precision
        if randomColorPrecision == nil && predeterminedColors.isEmpty {
            return ColorLibrary.totallyRandomColor()
        }
        
        if randomColorPrecision == nil {  //if we won't be generating a random color
            //pick a random set and then a random color from that set
            var randomIndex = Int(arc4random_uniform(UInt32(predeterminedColors.count)))
            let randomSet = predeterminedColors[randomIndex]
            
            //now from that set pick a color
            randomIndex = Int(arc4random_uniform(UInt32(randomSet.count)))
            let randomColorFromSet = randomSet[randomIndex]
            
            return randomColorFromSet
            
        } else if predeterminedColors.isEmpty {  //if there are no predetermined colors then just return a random one
            return ColorLibrary.totallyRandomColor(precision: randomColorPrecision!)
        } else { //color precision is defined, and there are also colors in the predetermined sets
            //randomly pick to go with a predetermined set or with a random color
            
            //pick a random set and then a random color from that set
            var randomIndex = Int(arc4random_uniform(UInt32(2)))
            
            if randomIndex == 1 {  //1 means that a color from the set was chosen, so randomly pick one and return
                //pick a random set and then a random color from that set
                randomIndex = Int(arc4random_uniform(UInt32(predeterminedColors.count)))
                let randomSet = predeterminedColors[randomIndex]
                
                //now from that set pick a color
                randomIndex = Int(arc4random_uniform(UInt32(randomSet.count)))
                let randomColorFromSet = randomSet[randomIndex]
                
                return randomColorFromSet
                
            } else {  //randomly decided to pick a random color so pick one and return
                return ColorLibrary.totallyRandomColor(precision: randomColorPrecision!)
            }
        }
        
    }
    
    
    
    ///Loads the objective user visual
    func loadObjective(){
        //load the objective
        
        //pick a random color to load
        guard let userLevel = getUserCurrentLevel() else {
            //users level may be too high and this is where advanced levels can be loaded
            //TODO: Load advanced levels
            fatalError("User may be at adanvced level but this hasn't been programmed yet!!!!")
        }
        let gameColor = getGameColor(usingLevel: userLevel)
        loadAndFadeInFeedbackObjective(using: gameColor)
        
        setAllUserInteraction(enabled: true)
    }
    
}
