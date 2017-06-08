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
        
        //present a series of Departing and Expired VCs depending on what is expired
        switch (departingCharacters, expiredPerks) {
        case let x where x.0 != nil && x.1 == nil: //Characters have expired
            //present the view to the player to let them know
            let departingVC = self.storyboard!.instantiateViewController(withIdentifier: "DepartingCharacters") as! DepartingCharactersViewController
            departingVC.departingCharacters = departingCharacters!
            departingVC.score = getCurrentScore()
            departingVC.parentVC = self
            topVC.present(departingVC, animated: true, completion: nil)
            
        case let x where x.0 == nil && x.1 != nil: //Perks have expired
            //present the view to the player to let them know
            let departingVC = self.storyboard!.instantiateViewController(withIdentifier: "DepartingPerks") as! DepartingPerksViewController
            departingVC.departingPerks = expiredPerks!
            departingVC.score = getCurrentScore()
            departingVC.parentVC = self
            topVC.present(departingVC, animated: true, completion: nil)
            
        case let x where x.0 != nil && x.1 != nil: //Both Characters and Perks have expired
            //create the Characters VC
            let departingCharactersVC = self.storyboard!.instantiateViewController(withIdentifier: "DepartingCharacters") as! DepartingCharactersViewController
            departingCharactersVC.score = getCurrentScore()
            departingCharactersVC.departingCharacters = departingCharacters!
            departingCharactersVC.parentVC = self
            
            //create the Perks VC
            let departingPerksVC = self.storyboard!.instantiateViewController(withIdentifier: "DepartingPerks") as! DepartingPerksViewController
            departingPerksVC.departingPerks = expiredPerks!
            departingPerksVC.parentVC = self
            
            //Present the perks, then have that VC present the characters
            //That way when characters expire, the player knows in the next screen why their perks are missing character requirements
            //when characters closes pass the new score to the perks VC
            
            topVC.present(departingCharactersVC, animated: true, completion: {
                departingPerksVC.score = self.getCurrentScore()
                topVC.present(departingPerksVC, animated: true, completion: nil)
            })
            
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
        var taxRate:Double = 0
        let maxTaxRate:Double = 0.25
        
        //if the phase is return to darkness then tax applies
        if phase == .returnToDarkness {
            taxRate = maxTaxRate * progress //tax rate is 25% times the progress in returnToDarkness
            
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
