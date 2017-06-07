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
        fadeViewInThenOut(view: self.storeButton, fadeOutAfterSeconds: 10.3)
        
        //only control the perk store if the player level is above minimum + 2
        if self.getUserCurrentLevel().level > (self.minimumLevelToUnlockPerkStore + 2) {
            fadeViewInThenOut(view: self.perkStoreButton, fadeOutAfterSeconds: 10.3)
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
        perkStickViewDeviation.fade(.out,
                                    withDuration: 0.5,
                                    delay: 0.2)
        
    }
    
    func loadAndFadeInFeedbackObjective(using color: UIColor) {
        //remove rotation and reset orientation flag
        self.objectiveFeedbackView.resetOrientation()
        
        
        self.objectiveFeedbackView.objectiveRingColor = color
        self.objectiveFeedbackView.setNeedsDisplay()
        let objectiveBackDelay = 1.8
        
        /******************************************************/
        /*******************///MARK: PERK VISUALIZECOLORVALUES
        /******************************************************/

        //if an increasedScore perk is active, add all bonuses and multiply that multiply the pointsJustScored
        let applicableVisualizeColroValuesPerks = getAllPerks(ofType: .visualizeColorValues, withStatus: .unlocked)
        if !applicableVisualizeColroValuesPerks.isEmpty {
            //calculate the percent of red, green, blue in the objective ring color
            var colorRGBA = [CGFloat](repeating: 0.0, count: 4)
            objectiveFeedbackView.calculateColorDeviation(color1: color, color2: objectiveFeedbackView.progressRingColor).getRed(&colorRGBA[0], green: &colorRGBA[1], blue: &colorRGBA[2], alpha: &colorRGBA[3])
            
            //check the level of the perk
            var highestPerkValue = 1
            for perk in applicableVisualizeColroValuesPerks {
                let perkValue = perk.0.meta1 as! Int
                if  perkValue > highestPerkValue {
                    highestPerkValue = perkValue
                }
            }
            
            switch highestPerkValue {
            case 1:
                perkStickViewDeviation.drawSticks(redPercent: colorRGBA[0], greenPercent: colorRGBA[1], bluePercent: colorRGBA[2], showColors: false)
            case 2:
                perkStickViewDeviation.drawSticks(redPercent: colorRGBA[0], greenPercent: colorRGBA[1], bluePercent: colorRGBA[2])
            case 3:
                let deviation = CGFloat(calculateColorMatchPointsEarned().2)
                perkStickViewDeviation.drawSticks(redPercent: colorRGBA[0], greenPercent: colorRGBA[1], bluePercent: colorRGBA[2], deviation: deviation)
            default:
                perkStickViewDeviation.drawSticks(redPercent: colorRGBA[0], greenPercent: colorRGBA[1], bluePercent: colorRGBA[2], showColors: false)
            }
            
            
            
            
            perkStickViewDeviation.fade(.in,
                                        withDuration: 0.5,
                                        delay: objectiveBackDelay + 0.5)
        }
        
        /******************************************************/
        /*******************///MARK: END PERK VISUALIZECOLORVALUES
        /******************************************************/

        
        
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
        let predeterminedColors = playerLevel.eligiblePredefinedObjectives
        let randomColorPrecision = playerLevel.eligibleRandomColorPrecision
        
        //if for some reason both are nil or empty, just return a random color of default precision
        guard randomColorPrecision != nil || predeterminedColors != nil else {
            return ColorLibrary.totallyRandomColor()
        }
        
        if randomColorPrecision == nil && predeterminedColors != nil{  //if we won't be generating a random color
            //pick a random set and then a random color from that set
            var randomIndex = Int(arc4random_uniform(UInt32(predeterminedColors!.count)))
            let randomSet = predeterminedColors![randomIndex]
            
            //now from that set pick a color
            randomIndex = Int(arc4random_uniform(UInt32(randomSet.count)))
            let randomColorFromSet = randomSet[randomIndex]
            
            return randomColorFromSet
            
        } else if predeterminedColors == nil {  //if there are no predetermined colors then just return a random one
            return ColorLibrary.totallyRandomColor(precision: randomColorPrecision!)
        } else if predeterminedColors!.isEmpty { //predetermined colors is nil and randomcolorprecision is not nil.  Do same as if was empty as above
            return ColorLibrary.totallyRandomColor(precision: randomColorPrecision!)
        } else { //color precision is defined, and there are also colors in the predetermined sets.  neither is nil
            //randomly pick to go with a predetermined set or with a random color.
            
            //pick a random set and then a random color from that set
            var randomIndex = Int(arc4random_uniform(UInt32(2)))
            
            if randomIndex == 1 {  //1 means that a color from the set was chosen, so randomly pick one and return
                //pick a random set and then a random color from that set
                randomIndex = Int(arc4random_uniform(UInt32(predeterminedColors!.count)))
                let randomSet = predeterminedColors![randomIndex]
                
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
        let userLevel = getUserCurrentLevel()
        let gameColor = getGameColor(usingLevel: userLevel)
        loadAndFadeInFeedbackObjective(using: gameColor)
        
        setAllUserInteraction(enabled: true)
    }
    
}
