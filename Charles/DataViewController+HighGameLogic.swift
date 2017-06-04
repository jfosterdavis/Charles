//
//  DataViewController+HighGameLogic.swift
//  Charles
//
//  Created by Jacob Foster Davis on 5/29/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation

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
            topVC.present(departingVC, animated: true, completion: nil)
            
        case let x where x.0 == nil && x.1 != nil: //Perks have expired
            //present the view to the player to let them know
            let departingVC = self.storyboard!.instantiateViewController(withIdentifier: "DepartingPerks") as! DepartingPerksViewController
            departingVC.departingPerks = expiredPerks!
            departingVC.score = getCurrentScore()
            topVC.present(departingVC, animated: true, completion: nil)
            
        case let x where x.0 != nil && x.1 != nil: //Both Characters and Perks have expired
            //create the Characters VC
            let departingCharactersVC = self.storyboard!.instantiateViewController(withIdentifier: "DepartingCharacters") as! DepartingCharactersViewController
            departingCharactersVC.score = getCurrentScore()
            departingCharactersVC.departingCharacters = departingCharacters!
            
            //create the Perks VC
            let departingPerksVC = self.storyboard!.instantiateViewController(withIdentifier: "DepartingPerks") as! DepartingPerksViewController
            departingPerksVC.departingPerks = expiredPerks!
            
            //Present the perks, then have that VC present the characters
            //That way when characters expire, the player knows in the next screen why their perks are missing character requirements
            //when characters closes pass the new score to the perks VC
            topVC.present(departingPerksVC, animated: true, completion: nil)
            departingPerksVC.present(departingCharactersVC, animated: true, completion: {departingPerksVC.score = self.getCurrentScore()})
            
        default: //none are expired, do nothing
            break
        }
        
        
        
        
        
        
        
        if getCurrentScore() >= minimumScoreToUnlockObjective || objectiveFeedbackView.alpha > 0.0 {
            
            //pick a random color to load
            guard let userLevel = getUserCurrentLevel() else {
                //users level may be too high and this is where advanced levels can be loaded
                //TODO: Load advanced levels
                fatalError("User may be at adanvced level but this hasn't been programmed yet!!!!")
            }
            
            let gameColor = getGameColor(usingLevel: userLevel)
            
            //set the baselines, then reload the objective
            setUserLevelAndProgressBaselines()
            
            reloadObjective(using: gameColor)
            
        }
    }
    
}
