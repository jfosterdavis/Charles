//
//  DataViewController+LevelProgress.swift
//  Charles
//
//  Created by Jacob Foster Davis on 5/29/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation
import UIKit
import CoreData

/******************************************************/
/*******************///MARK: Extension for all level progress logic and presentation
/******************************************************/


extension DataViewController {
    
    /******************************************************/
    /*******************///MARK: Level Progress
    /******************************************************/
    
    func refreshLevelProgress() {
        
        //figure out what level the player is on
        let userXP = calculateUserXP()
        let currentLevelAndProgress = Levels.getLevelAndProgress(from: userXP)
        
        //if the player isn't working on objectives, hide this progress bar
        if getCurrentScore() < minimumScoreToUnlockObjective {
            levelProgressView.isHidden = true
            thisLevelLabel.alpha = 0.0
            nextLevelLabel.alpha = 0
            levelDescriptionLabel.alpha = 0
            
            //play sounds if needed
            compareLevelAndProgressAndPlaySounds(given: currentLevelAndProgress)
        } else {
           
            //show the level progress
            levelProgressView.isHidden = false
            
            //play sounds if needed
            compareLevelAndProgressAndPlaySounds(given: currentLevelAndProgress)
            
            if let progress = calculateProgressValue() {
                
                var thisLevelColor: UIColor
                var nextLevelColor: UIColor
                
                //there are 10 sections of the progress bar and the width of each label is 1/10 of the progress bar
                switch progress {
                case let x where x < 0.1:
                    thisLevelColor = UIColor.darkGray
                    nextLevelColor = UIColor.darkGray
                case let x where x >= 0.9:
                    thisLevelColor = progressViewLightTextColor.textColor
                    nextLevelColor = progressViewLightTextColor.textColor
                default:
                    thisLevelColor = progressViewLightTextColor.textColor
                    nextLevelColor = UIColor.darkGray
                }
                
                //only animate if the user is progressing on the same level or degressing on same level.  don't animate if user just lost a level or if the view just loaded.
                var shouldAnimate = true
                if let currentLevel = currentLevelAndProgress.0 {
                    shouldAnimate = !didPlayer(magnitudeDirection: .decrease, in: .level, byAchieving: currentLevel.level)
                }
                
                
                
                
                UIView.animate(withDuration: 0.8,
                               delay: 0.8,
                               options: [.curveEaseInOut],
                               animations: {
                                
                                if let currentLevel = currentLevelAndProgress.0 {
                                    self.thisLevelLabel.alpha = 1
                                    self.thisLevelLabel.text = String(describing: currentLevel.level!)
                                    self.thisLevelLabel.textColor = thisLevelColor
                                    //print(" text of this level label: \(self.thisLevelLabel.text)")
                                    
                                    self.nextLevelLabel.alpha = 1
                                    self.nextLevelLabel.text = String(describing: (currentLevel.level + 1))
                                    self.nextLevelLabel.textColor = nextLevelColor
                                    
                                    //level label
                                    self.levelDescriptionLabel.alpha = 1
                                    self.levelDescriptionLabel.text = currentLevel.levelDescription
                                }
                                
                                
                }, completion: { (finished:Bool) in
                    
                    //if progress is going to 1, then animate to 1 then continue
                    
                    self.levelProgressView.setProgress(progress, animated: shouldAnimate)
                })
                
                
            } else {
                levelProgressView.setProgress(0.0, animated: true)
            }
            
        }
        
        
    }
    
    //calculates the progress value for the progress meter based on the user's level and XP.  returns Float
    func calculateProgressValue() -> Float? {
        //get user's level and progress
        let userXP = calculateUserXP()
        let currentLevelAndProgress = Levels.getLevelAndProgress(from: userXP)
        
        guard currentLevelAndProgress.0 != nil && currentLevelAndProgress.1 != nil else {
            //this may mean the user is too high of a level
            return nil
        }
        
        let usersProgressOnCurrentLevel = currentLevelAndProgress.1!
        let usersCurrentLevel = currentLevelAndProgress.0!
        
        let progress: Float = Float(usersProgressOnCurrentLevel) / (Float(usersCurrentLevel.xPRequired) - 1)
        
        return progress
        
    }
    
    ///sets the playerLevelBaseline and playerProgerssBaseline for comparisonlater.  should be called before the player starts an objective
    func setUserLevelAndProgressBaselines() {
        
        let userXP = calculateUserXP()
        
        let userLevelAndProgress = Levels.getLevelAndProgress(from: userXP)
        
        //record the current level for comparison at score time
        if let userLevel = userLevelAndProgress.0 {
            playerLevelBaseline = userLevel.level
        } else {
            playerLevelBaseline = 0
        }
        
        if let userProgress = userLevelAndProgress.1 {
            playerProgressBaseline = userProgress
        } else {
            playerProgressBaseline = 0
        }
    }
    
    
    //a test to see if the user progressed, degressed, or remained same in a Baseline compared to the given level
    func didPlayer(magnitudeDirection: MagnitudeComparison, in baseline: Baseline, byAchieving newValue: Int) -> Bool {
        
        //figure out what type of comparison to make
        var comparisonOperator: (Int, Int) -> Bool
        switch magnitudeDirection {
        case .increase:
            comparisonOperator = (>)
        case .decrease:
            comparisonOperator = (<)
        default:
            comparisonOperator = (==)
        }
        
        if baseline == .level {
            
            if comparisonOperator(newValue, playerLevelBaseline) {
                return true
            } else {
                return false
            }
        } else {  //must be referring to a progress not a level
            if comparisonOperator(newValue, playerProgressBaseline) {
                return true
            } else {
                return false
            }
        }
    }
    
    /******************************************************/
    /*******************///MARK: XP and Levels
    /******************************************************/
    
    /// sets the current score, returns the newly set score
    func giveXP(value: Int = 1, earnedDatetime: Date = Date(), level: Int, score: Int, time: Int, toggles: Int, metaInt1: Int? = nil, metaInt2: Int? = nil, metaString1: String? = nil, metaString2: String? = nil) {
        guard let fc = frcDict[keyXP] else {
            return
            
        }
        
        guard (fc.fetchedObjects as? [XP]) != nil else {
            return
        }
        
        //create a new score object
        let newXP = XP(entity: NSEntityDescription.entity(forEntityName: "XP", in: stack.context)!, insertInto: fc.managedObjectContext)
        newXP.value = Int64(value)
        newXP.earnedDatetime = earnedDatetime as NSDate
        newXP.level = Int64(level)
        newXP.score = Int64(score)
        newXP.time = Int64(time)
        newXP.toggles = Int64(toggles)
        if let int1 = metaInt1 {
            newXP.metaInt1 = Int64(int1)
        }
        if let int2 = metaInt1 {
            newXP.metaInt2 = Int64(int2)
        }
        
        newXP.metaString1 = metaString1
        newXP.metaString2 = metaString2
        
    }
    
    ///returns the total amount of user XP
    func calculateUserXP() -> Int {
        guard let fc = frcDict[keyXP] else {
            fatalError("Counldn't get frcDict")
            
        }
        
        guard let xps = fc.fetchedObjects as? [XP] else {
            fatalError("Counldn't get XP")
        }
        
        var sum = 0
        for xp in xps {
            sum = sum + Int(xp.value)
        }
        
        return sum
    }
    
    ///returns the user's current level determine programmatically.  returns nil if user's level is off the charts high
    func getUserCurrentLevel() -> Level? {
        let userXP = calculateUserXP()
        let userLevel = Levels.getLevelAndProgress(from: userXP)
        
        //userLevel is a tuple (player level, xp towards that level)
        
        if let lvl = userLevel.0 {
            return lvl
        } else {
            return nil
        }
    }
    
    
}
