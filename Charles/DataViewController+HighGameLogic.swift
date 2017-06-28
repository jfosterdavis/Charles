//
//  DataViewController+HighGameLogic.swift
//  Charles
//
//  Created by Jacob Foster Davis on 5/29/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation
import UIKit

/******************************************************/
/*******************///MARK: Higher Game functionality showing the flow of the game
/******************************************************/


extension DataViewController {
    
    /******************************************************/
    /*******************///MARK: Creating main display/interface
    /******************************************************/
    
    //loads the game for the first time since the user turned or looked at this page
    func initialLoadGame() {
        
        
        
        loadRandomPhrase()
        
        initialButtonLoad(from: currentPhrase)
        
        setUserLevelAndProgressBaselines()
        
        //initialize status of the progressbar.  initializing it will prevent animation
        if let progress = calculateProgressValue() {
            self.levelProgressView.setProgress(progress, animated: false)
        }
        refreshLevelProgress()
        
        //checkForAndRemoveExpiredCharacters()
        
        //checkForAndRemoveExpiredPerks()
        
        objectiveFeedbackView.alpha = 0.0
        if getCurrentScore() >= minimumScoreToUnlockObjective {
            
            
            loadObjective()
            
            
        }
        
        //reduce player score.  Like ante to play.
        reduceScoreByPeriodicValue()
    }
    
    /// reloads all UI elements neccessary to play the game after a phrase has been completed.  Reloads the buttons and the color feedback
    func reloadGame() {
        
        
        //load the buttons
        reloadButtons()
        
        refreshLevelProgress()
        
        let departingCharacters = checkForAndRemoveExpiredCharacters()
        
        let expiredPerks = checkForAndRemoveExpiredPerks()
        
        let topVC = topMostController()
        print("The top VC is \(topVC)")
        
        //TODO: remove redundancy fromthis section
        //present a series of Departing and Expired VCs depending on what is expired
        switch (departingCharacters, expiredPerks) {
        case let x where x.0 != nil && x.1 == nil: //Characters have expired
            //present the view to the player to let them know
            let departingVC = self.storyboard!.instantiateViewController(withIdentifier: "DepartingItems") as! DepartingItemsViewController
            departingVC.departingCharacters = departingCharacters!
            departingVC.score = getCurrentScore()
            departingVC.parentVC = self
            topVC.present(departingVC, animated: true, completion: nil)
            
        case let x where x.0 == nil && x.1 != nil: //Perks have expired
            //present the view to the player to let them know
            let departingVC = self.storyboard!.instantiateViewController(withIdentifier: "DepartingItems") as! DepartingItemsViewController
            departingVC.departingPerks = expiredPerks!
            departingVC.score = getCurrentScore()
            departingVC.parentVC = self
            topVC.present(departingVC, animated: true, completion: nil)
            
        case let x where x.0 != nil && x.1 != nil: //Both Characters and Perks have expired
            //create the Characters VC
            let departingVC = self.storyboard!.instantiateViewController(withIdentifier: "DepartingItems") as! DepartingItemsViewController
            departingVC.score = getCurrentScore()
            departingVC.departingCharacters = departingCharacters!
            departingVC.parentVC = self
            
            //add the Perks VC
            departingVC.departingPerks = expiredPerks!
            
            topVC.present(departingVC, animated: true, completion: nil)
            
        default: //none are expired, do nothing
            break
        }
        
        if getCurrentScore() >= minimumScoreToUnlockObjective || objectiveFeedbackView.alpha > 0.0 {
            
            //pick a random color to load
            
            let userLevel = getUserCurrentLevel()
            let gameColor = getGameColor(usingLevel: userLevel)
            
            //set the baselines, then reload the objective
            setUserLevelAndProgressBaselines()
            
            reloadObjective(using: gameColor)
            
        }
    }
    
    //does everything needed to assess the palyer's taxes based on the level they are on.  Will deduct score accordingly and show user how much was taken.
    func assessAndCollectTaxesAndShowFeedback() {
        
        let userCurrentLevel = getUserCurrentLevel()
        let phaseProgress = Levels.getLevelPhaseAndProgress(level: userCurrentLevel)
        let phase: GamePhase = phaseProgress.0
        let progress = phaseProgress.1
        
        
        
        //if the phase is return to darkness then tax applies
        if phase == .returnToDarkness {
            var taxRate:Double = 0
            var chanceToBeTaxed:Double = 0
            let maxTaxRate:Double = 0.40
            let baselineChanceToBeTaxed:Double = 0.20
            
            chanceToBeTaxed = baselineChanceToBeTaxed * progress
            let chanceTicket = Int(chanceToBeTaxed * 100) // get a number between 1 and 100 based on the user's chance to be taxed
            let randomTicket = Utilities.random(range: 0...100)
            
            if randomTicket < chanceTicket { //if the chance ticket is more, then the user lost the lottery and must pay tax
            
                taxRate = maxTaxRate * progress //tax rate is 35% times the progress in returnToDarkness
                
                let currentScore = getCurrentScore()
                let taxAmount = Int(Double(currentScore) * taxRate)
                let newScore = currentScore - taxAmount
                
                //set the new score and inform the userCurrentLevel
                setCurrentScore(newScore: newScore)
                
                presentTaxFeedback(taxAmount: taxAmount)
                
                refreshScore()
            }
        }

        
    }

    
}
