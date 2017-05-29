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
        
        checkForAndRemoveExpiredCharacters()
        
        objectiveFeedbackView.alpha = 0.0
        if getCurrentScore() >= minimumScoreToUnlockObjective {
            
            
            loadObjective()
            
            
        }
    }
    
    /// reloads all UI elements neccessary to play the game after a phrase has been completed.  Reloads the buttons and the color feedback
    func reloadGame() {
        //load the buttons
        reloadButtons()
        
        refreshLevelProgress()
        
        checkForAndRemoveExpiredCharacters()
        
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
