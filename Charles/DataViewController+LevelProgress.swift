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
    
    func refreshLevelProgress(_ justAnimatedPlayerFinishingLevel: Bool = false) {
        
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
            
            //if just got done animating player to a full bar, set the progressbar progress to zero so it can finish animating to current progress
            if justAnimatedPlayerFinishingLevel {
                levelProgressView.setProgress(0, animated: false)
            }
            
            if let progress = calculateProgressValue() {
                
                var thisLevelColor: UIColor
                var nextLevelColor: UIColor
                
                //there are 11 sections of the progress bar and the width of each label is 1/11 of the progress bar. 1/11 = 0.0909090909
                switch progress {
                case let x where x < 0.091:
                    thisLevelColor = UIColor.darkGray
                    nextLevelColor = UIColor.darkGray
                case let x where x >= 0.91:
                    thisLevelColor = progressViewLightTextColor.textColor
                    nextLevelColor = progressViewLightTextColor.textColor
                default:
                    thisLevelColor = progressViewLightTextColor.textColor
                    nextLevelColor = UIColor.darkGray
                }
                
                /******************************************************/
                /*******************///MARK: PERK INCREASED XP
                /******************************************************/
                
                //if an increased XP perk is active, change the color of the progressview
                let xpPerks = getAllPerks(ofType: .increasedXP, withStatus: .unlocked)
                if xpPerks.isEmpty {
                    //no perks are active, set to normal color
                    levelProgressView.progressTintColor = progressViewProgressTintColorDefault
                    
                } else { //a perk is active so put the special color on
                    //TODO: flash the bar to the perk color then back
                    self.levelProgressView.progressTintColor = self.progressViewProgressTintColorXPPerkActive
                    
                }
                
                //only animate if the user is progressing on the same level or degressing on same level.  don't animate if user just lost a level or if the view just loaded.
                var shouldAnimate = false
                var playerLeveledUpWithXPPerkActive = false
                let currentLevel = currentLevelAndProgress.0
                shouldAnimate = didPlayer(magnitudeDirection: .noChange, in: .level, byAchieving: currentLevel.level)
                
                //determine if the player leveled up while the XP perk was active, or by earning more than 1 xp
                //this would occur if progress > 0 and the player increased in level
                let playerIncreasedLevel = didPlayer(magnitudeDirection: .increase, in: .level, byAchieving: currentLevel.level)
                if playerIncreasedLevel && !xpPerks.isEmpty {
                    playerLeveledUpWithXPPerkActive = true
                }
                
                
                
                /******************************************************/
                /*******************///MARK: END PERK INCREASED XP
                /******************************************************/

                
                if playerLeveledUpWithXPPerkActive && progress < 1.0 {
                    
                    //TODO: fix this so it works
                    
                    
                    //flash user feedback for increased xp
                    
                    //the player leveled up by earning more than 1 XP, so progress bar should animate to full, then reset to the current level and progress
                    //0. update labels
                    //trick the label to think it will end up light
                    thisLevelColor = progressViewLightTextColor.textColor
                    nextLevelColor = progressViewLightTextColor.textColor
                    let currentLevel = currentLevelAndProgress.0
                    let previousLevel = (Levels.Game[currentLevel.level - 1])!
                
                
                    UIView.animate(withDuration: 0.8,
                               delay: 0.8,
                               animations: {
                                
                                
                                self.thisLevelLabel.alpha = 1
                                self.thisLevelLabel.text = String(describing: previousLevel.level)
                                self.thisLevelLabel.textColor = thisLevelColor
                                //print(" text of this level label: \(self.thisLevelLabel.text)")
                                
                                self.nextLevelLabel.alpha = 1
                                self.nextLevelLabel.text = String(describing: (previousLevel.level + 1))
                                self.nextLevelLabel.textColor = nextLevelColor
                                
                                //level label
                                self.levelDescriptionLabel.alpha = 1
                                self.levelDescriptionLabel.text = previousLevel.levelDescription
                                
                    })
                    
                    
                    //1. animate the progress bar to full
                    //to do this need to animate it to 1
                    self.levelProgressView.setProgress(1, animated: true)
                    
                    //2. wait then call this refresh function again
                    let seconds = 2
                    let deadline = DispatchTime.now() + DispatchTimeInterval.seconds(seconds)
                    DispatchQueue.main.asyncAfter(deadline: deadline, execute: {
                        self.refreshLevelProgress(true)
                    })
                    
                    
                } else {
                    
                    UIView.animate(withDuration: 0.8,
                                   delay: 0.8,
                                   animations: {
                                    
                                let currentLevel = currentLevelAndProgress.0
                                    self.thisLevelLabel.alpha = 1
                                    self.thisLevelLabel.text = String(describing: currentLevel.level)
                                    self.thisLevelLabel.textColor = thisLevelColor
                                    //print(" text of this level label: \(self.thisLevelLabel.text)")
                                    
                                    self.nextLevelLabel.alpha = 1
                                    self.nextLevelLabel.text = String(describing: (currentLevel.level + 1))
                                    self.nextLevelLabel.textColor = nextLevelColor
                                    
                                    
                                    
                                    
                                    
                    }, completion: { (finished:Bool) in
                        
                        //if progress is going to 1, then animate to 1 then continue
                        
                        
                        self.levelProgressView.setProgress(progress, animated: shouldAnimate)
                        
                        //level label
                        self.levelDescriptionLabel.alpha = 1
                        
                        self.levelDescriptionLabel.text = currentLevel.levelDescription
                    })
                    
                    
                }
               
                
            } else {
                //no progress value returned (some sort of problem)
                levelProgressView.setProgress(0.0, animated: true)
                //TODO: log problem
            }
            
            //play sounds if needed
            compareLevelAndProgressAndPlaySounds(given: currentLevelAndProgress)
            
        }
        
        
        checkIfMapShouldBePresentedAndPresent()
        
        checkIfClueShouldBePresentedAndPresent()
    }
    
    ///determines if the map should be presented
    func checkIfMapShouldBePresentedAndPresent() {
        let userXP = calculateUserXP()
        let userLevelAndProgress = Levels.getLevelAndProgress(from: userXP)
        let userCurrentLevel = userLevelAndProgress.0.level
        let didPlayerProgressToGetHere = didPlayer(magnitudeDirection: .increase, in: .level, byAchieving: userCurrentLevel)
        
        if didPlayerProgressToGetHere && userCurrentLevel >= 11 {
            let topVC = topMostController()
            let mapVC = self.storyboard!.instantiateViewController(withIdentifier: "MapCollectionViewController") as! MapCollectionViewController
            mapVC.initialLevelToScrollTo = userCurrentLevel - 1 //initial level is the one just passed
            topVC.present(mapVC, animated: true, completion: nil)
        }
    }
    
    ///checks if the user's new level warrants the presentation of a clue, and presents that clue
    func checkIfClueShouldBePresentedAndPresent() {
        let userXP = calculateUserXP()
        let userLevelAndProgress = Levels.getLevelAndProgress(from: userXP)
        let userCurrentLevel = userLevelAndProgress.0.level
        let didPlayerProgressToGetHere = didPlayer(magnitudeDirection: .increase, in: .level, byAchieving: userCurrentLevel)
        
        //if the user progressed to get to here (as opposed to lost a level) and there is a clue for this new level
        if let clue = Clues.Lineup[userCurrentLevel], didPlayerProgressToGetHere  {
            //there is a clue, so present this clue
            let topVC = topMostController()
            let clueVC = self.storyboard!.instantiateViewController(withIdentifier: "BasicClueViewController") as! BasicClueViewController
            clueVC.clue = clue
            topVC.present(clueVC, animated: true, completion: nil)
        }

    }
    
    ///calculates the progress value for the progress meter based on the user's level and XP.  returns Float
    func calculateProgressValue() -> Float? {
        //get user's level and progress
        let userXP = calculateUserXP()
        let currentLevelAndProgress = Levels.getLevelAndProgress(from: userXP)
                
        let usersProgressOnCurrentLevel = currentLevelAndProgress.1
        let usersCurrentLevel = currentLevelAndProgress.0
        
        let progress: Float = Float(usersProgressOnCurrentLevel) / (Float(usersCurrentLevel.xPRequired) - 1)
        
        return progress
        
    }
    
    ///sets the playerLevelBaseline and playerProgerssBaseline for comparisonlater.  should be called before the player starts an objective
    func setUserLevelAndProgressBaselines() {
        
        let userXP = calculateUserXP()
        
        let userLevelAndProgress = Levels.getLevelAndProgress(from: userXP)
        
        //record the current level for comparison at score time
        let userLevel = userLevelAndProgress.0
            playerLevelBaseline = userLevel.level
        
        
        let userProgress = userLevelAndProgress.1
            playerProgressBaseline = userProgress
        
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
    func giveXP(value: Int = 1, earnedDatetime: Date = Date(), level: Int, score: Int, successScore: Float, time: Int, toggles: Int, metaInt1: Int? = nil, metaInt2: Int? = nil, metaString1: String? = nil, metaString2: String? = nil, consolidatedRecords: Int? = nil, dontExceedHighestLevel: Bool = true) {
        guard let fc = frcDict[keyXP] else {
            return
            
        }
        
        guard (fc.fetchedObjects as? [XP]) != nil else {
            return
        }
        
        guard successScore >= 0 && successScore <= 1 else {
            //TODO: log error
            return
        }
        
        var xpToAward = value
        
        if let excessXP = howMuchWouldPlayerExceedHighestLevel(ifPlayerGained: value), dontExceedHighestLevel { //if the player is at the highest level of the game and this function should not exceed that
            xpToAward -= excessXP
            
        }
        
        //create a new score object
        let newXP = XP(entity: NSEntityDescription.entity(forEntityName: "XP", in: stack.context)!, insertInto: fc.managedObjectContext)
        newXP.value = Int64(xpToAward)
        newXP.successScore = successScore
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
        
        if let records = consolidatedRecords {
            newXP.consolidatedRecords = Int64(records)
        }
        
        //save this right away
        stack.save()
        
        
    }
    
    
    ///checks to see how many XP records there are.  If above the given number, will combine them all into a single record for each level.  This to prevent big O problems
    func checkXPAndConsolidateIfNeccessary(consolidateAt numRecords: Int) {
        guard let fc = frcDict[keyXP] else {
            fatalError("Counldn't get frcDict")
            
        }
        
        guard let xps = fc.fetchedObjects as? [XP] else {
            fatalError("Counldn't get XP")
        }
        
        if xps.count >= numRecords {
            //go thru each level
            for (levelKey, _) in Levels.Game {
                var resultantValue:Int64 = 0
                var resultantScore:Int64 = 0
                var resultantRecordsCount: Int64 = 0
                var rawSuccessScores: [Float] = [Float]()
                var found = false
                var numFound = 0
                
                //and check each xp record's level
                for xp in xps {
                    if Int(xp.level) == levelKey {
                        //this xp record matches the level
                        resultantValue += xp.value
                        resultantScore += xp.score
                        resultantRecordsCount += xp.consolidatedRecords //consolidatedRecords holds records counts
                        
                        if resultantRecordsCount == 0 {
                            //this is a single record so weigh it as 1
                            rawSuccessScores.append(xp.successScore) //weight of 1
                        } else {
                            //this is a consolidated record so weigh it
                            rawSuccessScores.append(xp.successScore * Float(xp.consolidatedRecords)) //weighted scores
                        }
                        
                        found = true
                        numFound += 1
                        
                        //now delete the record you just found
                        let delegate = UIApplication.shared.delegate as! AppDelegate
                        self.stack = delegate.stack
                        
                        if let context = self.frcDict[keyXP]?.managedObjectContext {
                            context.delete(xp)
                        }
                    }
                }
                
                //if an applicable XP record was found, then consolidate and create a new XP
                if found {
                    //create a new score object
                    let newXP = XP(entity: NSEntityDescription.entity(forEntityName: "XP", in: stack.context)!, insertInto: fc.managedObjectContext)
                    newXP.value = Int64(resultantValue)
                    newXP.earnedDatetime = Date() as NSDate
                    newXP.level = Int64(levelKey)
                    newXP.score = Int64(resultantScore)
                    
                    //calculate the average success
                    var sumOfSuccessScores: Float = 0
                    for successScore in rawSuccessScores {
                        sumOfSuccessScores += successScore
                    }
                    
                    let averageSuccessScore = sumOfSuccessScores / Float(resultantRecordsCount)
                    
                    newXP.successScore = averageSuccessScore
                    
                    newXP.consolidatedRecords = resultantRecordsCount + Int64(numFound) //add the number of records consolidating to the count
                    print("Consolidated \(numFound) XP objects at level \(levelKey).  Resulting XP sum for this level is \(resultantValue).")
                }
            }
        }
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
    func getUserCurrentLevel() -> Level {
        let userXP = calculateUserXP()
        let userLevel = Levels.getLevelAndProgress(from: userXP)
        
        //userLevel is a tuple (player level, xp towards that level)
        
        return userLevel.0
        
    }
    
    ///determines if the user just reached the highest progress of the highest level
    func didPlayerBeatGame() -> Bool {
        let userCurrentLevel = getUserCurrentLevel().level
        if isPlayerAtHighestLevelAndProgress() {  //looks like the user is at the highest level with the highest progress
            //check that the player just arrived at this level
            let didJustReach = didPlayer(magnitudeDirection: .increase, in: .level, byAchieving: userCurrentLevel)
            
            //if the player just reached this level, then show the "you won" sequence
            if didJustReach {
                return true
            }
        }
     
        return false
    }
    
    ///determines if the user is at the highest level and progress values allowed
    func isPlayerAtHighestLevelAndProgress() -> Bool {
        let highestLevel = (Levels.HighestLevel.level)
        let highestProgressRequiredOnHighestLevel = Levels.Game[(highestLevel)]?.xPRequired
        let userXP = calculateUserXP()
        let userLevelAndProgress = Levels.getLevelAndProgress(from: userXP)
        let requiredProgressValue = highestProgressRequiredOnHighestLevel! - 1 //The user must get up to 1 fewer than the highest XP of the highest level to win the game
        
        if userLevelAndProgress.0.level == highestLevel &&  userLevelAndProgress.1 ==  requiredProgressValue {
            return true
        } else {
            return false
        }
    }
    
    ///determines if the user is at the highest level and progress values allowed
    func howMuchWouldPlayerExceedHighestLevel(ifPlayerGained XP: Int) -> Int? {
        let highestLevel = Levels.HighestLevel
        let userXP = calculateUserXP()
        let userXPAndHypotheticalXP = userXP + XP
        let userLevelAndProgress = Levels.getLevelAndProgress(from: userXPAndHypotheticalXP)
        
        if (userLevelAndProgress.0.level) > (highestLevel.level) {
            var maxXP = 0
            var level = 1
            while level <= (Levels.HighestLevel.level) {
                maxXP += (Levels.Game[level]?.xPRequired)!
                level += 1
            }
            //maxXP now holds the total number of XP required to win
            let xpDeviation = abs(userXPAndHypotheticalXP - maxXP) + 1 //if the user level is higher than the highest level the deviation will be the entire higher levels plus one.
            
            return xpDeviation
        } else {
            return nil
        }
    }
    
    ///shows the wining sequence
    func showWinningSequence() {
        let topVC = topMostController()
        let youWonVC = self.storyboard!.instantiateViewController(withIdentifier: "GameWinner") as! GameWinnerViewController
        
        let userXP = calculateUserXP()
        let userLevelAndProgress = Levels.getLevelAndProgress(from: userXP)
        let userLevel = userLevelAndProgress.0.level
        
        youWonVC.parentVC = self
        youWonVC.userLevel = userLevel
        topVC.present(youWonVC, animated: true, completion: nil)
    }
    
    //modifies the user's real XP data to send them back to the given level
    func reducePlayerLevel(to level: Int = 22) {
        //destroy all XP earned after the player reached given level
        guard let fc = frcDict[keyXP] else {
            fatalError("Counldn't get frcDict")
            
        }
        
        guard let xps = fc.fetchedObjects as? [XP] else {
            fatalError("Counldn't get XP")
        }
        
        //delete any xp object earnedon the given level or higher
        let delegate = UIApplication.shared.delegate as! AppDelegate
        self.stack = delegate.stack
        for xp in xps {
            
            if Int(xp.level) >= level {
                if let context = self.frcDict[keyXP]?.managedObjectContext {
                    print("Deleting XP for level \(xp.level)")
                    context.delete(xp)
                    
                }
            }
        }
        stack.save()
        
        //now check that player is back to given level
        let newActualLevel = getUserCurrentLevel().level
        if newActualLevel > level {
            fatalError("Something went wrong when trying to put player back to level \(level).  Current level being reported as \(String(describing: newActualLevel))")
        }
    }
    
}
