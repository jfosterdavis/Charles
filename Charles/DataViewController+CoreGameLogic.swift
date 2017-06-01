//
//  DataViewController+CoreGameLogic.swift
//  Charles
//
//  Created by Jacob Foster Davis on 5/29/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
import CoreData

extension DataViewController {
    
    
    /******************************************************/
    /*******************///MARK: Core Game
    /******************************************************/
    
    
    @IBAction func buttonPress(_ sender: UIButton) {
        //2. Play the current subphrase with the tone of the pressed button.
        
        //if the audio is already playing, don't do anything:
        //        guard audioPlayer.isPlaying == false else {
        //            return
        //        }
        
        //don't do anything if character is not enabled
        guard characterInteractionEnabled else {
            return
        }
        
        var sendingButton: UIButton?
        
        //prepare the subphrase.  if it is gone too far, reset
        if currentSubphraseIndex >= currentPhrase.subphrases!.count {
            currentSubphraseIndex = 0
            
        }
        
        //find the button that was pressed
        for button in currentButtons {
            if sender == button {
                sendingButton = button
            }
        }
        
        guard sendingButton != nil else {
            //TODO: handle nil
            return
        }
        
        //prepare to speak
        
        let subphraseToSound = currentPhrase.subphrases![currentSubphraseIndex]
        
        ///******************************************************/
        /*******************///MARK: Perk Implimentation: musicalVoices Synesthesia
        /******************************************************/

        let applicableUnlockedMusicalVoicesPerks = getAllPerks(ofType: .musicalVoices, withStatus: .unlocked)
        
        
        if applicableUnlockedMusicalVoicesPerks.isEmpty {  //no perks active
            //determine if there is a valid .m4a file to play, otherwise speak the word
            if subphraseToSound.audioFilePath != nil {
                //try to find file
                let url = URL(fileURLWithPath: subphraseToSound.audioFilePath!)
                
                
                do {
                    try audioPlayer = AVAudioPlayer(contentsOf: url)
                    audioPlayer.enableRate = true
                    
                    resetAudioEngineAndPlayer()
                    
                    //                try audioPlayer = AVAudioPlayer(contentsOf: url)
                    let audioFile = try AVAudioFile(forReading: url)
                    
                    changePitchEffect.pitch = currentPhrase.slots![currentButtons.index(of: sendingButton!)!].tone
                    
                    audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
                    audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
                    
                    audioPlayerNode.scheduleFile(audioFile, at: nil, completionHandler: nil)
                    
                    try audioEngine.start()
                    audioPlayerNode.play()
                    
                    //audioPlayer.play()
                } catch {
                    //there was an error, so speak it instead
                    speak(subphrase: currentPhrase.subphrases![currentSubphraseIndex])
                }
                
            } else {
                speak(subphrase: currentPhrase.subphrases![currentSubphraseIndex])
            }
        } else {  //perks are active
            //assume there is only one active perk
            //there should be 3 audiofile paths in the perk, each is a different whistle
            let perk = applicableUnlockedMusicalVoicesPerks[0].0
            
            let url1 = URL(fileURLWithPath: perk.meta1 as! String)
            let url2 = URL(fileURLWithPath: perk.meta2 as! String)
            let url3 = URL(fileURLWithPath: perk.meta3 as! String)
            
            let urls = [url1, url2, url3]
            //select a random URL to play
            let selectedUrl = urls[Utilities.random(range: 0...(urls.count - 1))]
            
            
            do {
                try audioPlayer = AVAudioPlayer(contentsOf: selectedUrl)
                audioPlayer.enableRate = true
                
                resetAudioEngineAndPlayer()
                
                //                try audioPlayer = AVAudioPlayer(contentsOf: url)
                let audioFile = try AVAudioFile(forReading: selectedUrl)
                
                //Synesthesia produces nice sounds, so compress the tone range.
                let rawTone = currentPhrase.slots![currentButtons.index(of: sendingButton!)!].tone
                var newTone = rawTone!
//                if newTone > 150.0 {
//                    newTone = 150.0
//                } else if newTone < -150.0 {
//                    newTone = -150.0
//                }
                //now reduce the tone to make it soothing
                newTone -= 1200
                
                changePitchEffect.pitch = newTone
                
                audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
                audioEngine.connect(changePitchEffect, to: synesthesiaReverb, format: nil)
                audioEngine.connect(synesthesiaReverb, to: synesthesiaDistortion, format: nil)
                audioEngine.connect(synesthesiaDistortion, to: audioEngine.outputNode, format: nil)
                
                audioPlayerNode.scheduleFile(audioFile, at: nil, completionHandler: nil)
                
                
                
                try audioEngine.start()
                audioPlayerNode.play()
                
                //you are about to do Synesthesia so give player visual feedback
                let intensity = abs(newTone)/2500.0
                print("intensity is \(intensity)")
                perkSynesthesiaFireBackgroundBlinker(intensity: intensity)
            } catch {
                //there was an error, so speak it instead
                speak(subphrase: currentPhrase.subphrases![currentSubphraseIndex])
            }
        }
        
        var addThisColor: UIColor
        if let c = sendingButton!.backgroundColor {
            if c == UIColor.clear {
                addThisColor = UIColor.black
            } else {
                addThisColor = c
            }
        } else {
            
            addThisColor = UIColor.black
        }
        
        //check the orientation of the objectiveFeedbackView.  If it is normal, add, if not, subtract the color
        if objectiveFeedbackView.orientationUp {
            //add the color of the button pressed to the color indicator
            objectiveFeedbackView.addColorToProgress(color: addThisColor)
        } else {
            //subtract the color of the button pressed to the color indicator
            objectiveFeedbackView.subtractColorToProgress(color: addThisColor)
        }
        
        //iterate the subphrase
        
        currentSubphraseIndex += 1
        
        //reload another phrase if this was the last word
        if currentSubphraseIndex >= currentPhrase.subphrases!.count {
            currentSubphraseIndex = 0
            
            //if the user doesn't ahve enough points to go after objectives, make the transition quicker
            var delay = 1000
            if getCurrentScore() <= minimumScoreToUnlockObjective && objectiveFeedbackView.alpha < 1.0 {
                delay = 300
            }
            
            
            var pointsJustScored = 0
            
            //don't let the user do anything while we show them feedback and reload
            setAllUserInteraction(enabled: false)
            
            
            //if the user is working on an objective, give xp points if they met minimum score threshold for that level
            if objectiveFeedbackView.alpha > 0 {
                let scoreResults = calculateColorMatchPointsEarned()
                pointsJustScored = calculateBaseScore(phrase: currentPhrase) + scoreResults.0
                
                let level = getUserCurrentLevel()
                //compare to match performance
                if let level = level {
                    if scoreResults.2 >= level.successThreshold {
                        
                        //check to see if an xp-related perk is active. ask the perk store
                        /******************************************************/
                        /*******************///MARK: Perk Implimentation: increasedXP
                        /******************************************************/

                        let applicablePerksAndUnlockedPerkObjects = getAllPerks(ofType: .increasedXP, withStatus: .unlocked)
                        
//                        let perkStore = self.storyboard!.instantiateViewController(withIdentifier: "PerkStore") as! PerkStoreCollectionViewController
//                        let unlockedPerks = perkStore.getAllUnlockedPerks()
//                        print("The following perks are unlocked: \(unlockedPerks)")
//                        //go through all unlockable perks and get an array of all xp related ones
//                        
//                        let applicablePerkObjects: [Perk] = Perks.ValidPerks.filter{$0.type == PerkType.increasedXP}
//                        
//                        var foundUnlockedApplicablePerks = [Perk]()
//                        
//                        for perk in unlockedPerks {
//                            //check to see if this perk.name is also in the applicable perks
//                            for applicablePerk in applicablePerkObjects {
//                                if perk.name == applicablePerk.name {
//                                    foundUnlockedApplicablePerks.append(applicablePerk)
//                                }
//                            }
//                        }
                        
                        //now should have an array of perks that apply to this situation.
                        //for now assume that if there are any just take the first one and apply it
                        
                        if applicablePerksAndUnlockedPerkObjects.isEmpty {
                            //its empty so there are no applicable perks.  Give the normal amount of XP.
                            giveXP(level: level.level, score: pointsJustScored, time: 0, toggles: 0)
                        } else {
                            //there is a modifier.  This is located in meta1
                            var mult = 0
                            
                            //sum the value of all increasedXP perks
                            for perk in applicablePerksAndUnlockedPerkObjects {
                                if let multiplier = perk.0.meta1 as! Int? {
                                    mult += multiplier
                                }
                            }
                            if mult == 0 {
                                mult = 1
                            }
                            // award xp
                            giveXP(value: 1 * mult, level: level.level, score: pointsJustScored, time: 0, toggles: 0)
                            
                        }
                        
                        //if they got a perfect score, double the points earned
                        if scoreResults.2 == 1 {
                            pointsJustScored = pointsJustScored * 2
                        }
                        
                        //award points
                        setCurrentScore(newScore: getCurrentScore() + pointsJustScored)
                        
                        if let scoreMessage = scoreResults.1{
                            presentJustScoredMessageFeedback(message: scoreMessage)
                        }
                        
                    } else if scoreResults.2 <= level.punishThreshold {  //if the score was so low that use must lose XP
                        giveXP(value: -1, level: level.level, score: pointsJustScored, time: 0, toggles: 0)
                        
                        //penalty points!
                        //penalty is negative the amount you would have scored
                        pointsJustScored = -1 * pointsJustScored
                        
                        //if they got a 0% score, triple the points lost
                        if scoreResults.2 == 0 {
                            pointsJustScored = pointsJustScored * 3
                        }
                        
                        setCurrentScore(newScore: getCurrentScore() + pointsJustScored)
                        
                        //give them a message so they know how bad they did
                        if let scoreMessage = scoreResults.1{
                            presentJustScoredMessageFeedback(message: scoreMessage, isGoodMessage: false)
                        }
                    } else {
                        //no XP given here, but points still given
                        
                        //award points
                        setCurrentScore(newScore: getCurrentScore() + pointsJustScored)
                        
                        if let scoreMessage = scoreResults.1{
                            presentJustScoredMessageFeedback(message: scoreMessage)
                        }
                    }
                }
                
                
            } else { //when not working on an objective, everyone is a winner!
                //give them some points for finishing a phrase
                
                pointsJustScored = calculateBaseScore(phrase: currentPhrase)
                
                setCurrentScore(newScore: getCurrentScore() + pointsJustScored)
                
            }
            
            //animate the justScored feedback
            presentJustScoredFeedback(justScored: pointsJustScored)
            
            //update the score
            refreshScore()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(delay), execute: {
                self.reloadGame()
            })
            
            
        }
        
    }
    
    /******************************************************/
    /*******************///MARK: Scoring
    /******************************************************/
    
    
    
    ///updates the UI with the current score.  Also controls alphas of the store buttons
    func refreshScore() {
        let currentScore = getCurrentScore()
        
        let newAlpha: CGFloat = CGFloat(Float(currentScore) / Float(minimumScoreToUnlockStore + 500))
        var scoreAlpha = newAlpha
        
        //set the alpha of the label to be the equivalent of the score /1000
        //alpha of the store icon will be such that 500 is the minimum score to start showing.  Lowest priced item will be 500.
        if currentScore >= minimumScoreToUnlockStore + 500 {
            scoreAlpha = 1.0
            //scoreLabel.alpha = scoreAlpha
            //storeButton.alpha = 1.0
            //self.storeButton.isEnabled = true
            
        } else if currentScore <= minimumScoreToUnlockObjective {
            //before the player can use objectives, the alpha of the store button is controled by the player's score
            
            let storeAlpha = 2*newAlpha - 1  //this makes store button visible at 500 and solid at 1000. y=mx+b
            
            //fade in or out the store
            //this should auto disable if it goes to 0, and vice versa
            self.storeButton.fade(.inOrOut,
                                  resultAlpha: storeAlpha,
                                 withDuration: 0.3,
                                 delay: 0.6)
            
//            
//            UIView.animate(withDuration: 0.3,
//                           delay: 0.6,
//                animations: {
//                
//                self.storeButton.alpha = 2*newAlpha - 1 //this makes store button visible at 500 and solid at 1000. y=mx+b
//                if self.storeButton.alpha == 0 {
//                    self.storeButton.isEnabled = false
//                } else {
//                    self.storeButton.isEnabled = true
//                }
//            }, completion: nil)
            
        }
        
        //fade out and in the score
        self.scoreLabel.fade(.out,
                             withDuration: 0.2,
                             completion: { (finished:Bool) in
                                //set score
                                self.scoreLabel.text = String(describing: currentScore)
                                self.scoreLabel.fade(.inOrOut,
                                                     resultAlpha: scoreAlpha,
                                                     withDuration: 0.3)
        })
        
        
        
        //fading in and out the perk store. based on user's level
        if let userLevel = getUserCurrentLevel() {
            //store will fade in over 5 levels
            if userLevel.level >= minimumLevelToUnlockPerkStore && userLevel.level <= (minimumLevelToUnlockPerkStore + 5) {
                //slowly introduce the perk store over 5 levels.  Above this the function loadAndFadeInFeedbackObjective manages the perk store
                
                
                let newAlpha: CGFloat = CGFloat(Float(userLevel.level) / Float(userLevel.level + 5))
                
                //fade in the perk store
                //this should automatically disable if it fades to 0 or enable if it is > 0
                self.perkStoreButton.fade(.inOrOut,
                                          resultAlpha: newAlpha,
                                          withDuration: 0.3,
                                          delay: 0.6)
                //only disable if it is invisible
//                if self.perkStoreButton.alpha == 0 {
//                    self.perkStoreButton.isEnabled = false
//                } else {
//                    self.perkStoreButton.isEnabled = true
//                }
//                UIView.animate(withDuration: 0.3,
//                               delay: 0.6,
//                               animations: {
//                                
//                                self.perkStoreButton.alpha = newAlpha
//                                if self.perkStoreButton.alpha == 0 {
//                                    self.perkStoreButton.isEnabled = false
//                                } else {
//                                    self.perkStoreButton.isEnabled = true
//                                }
//                }, completion: nil)
                
            } else  if currentScore <= minimumScoreToUnlockObjective {
                //fade to zero
                //fade in the perk store
                
                self.perkStoreButton.fade(.out,
                                          withDuration: 0.3,
                                          delay: 0.6)
                
//                UIView.animate(withDuration: 0.3,
//                               delay: 0.6,
//                               animations: {
//                                
//                                self.perkStoreButton.alpha = 0
//                                    self.perkStoreButton.isEnabled = false
//                }, completion: nil)
            }
        } else {
            //something is not right
            fatalError("Can't get the user's level")
        }
    
        //score housekeeping.
        //if the score is below the thresholds where the user would see an objective, make sure the timer penalty is low enough to allow them to recover.  But once it is high enough, increase the penalty to make it more challenging once objectives are in play.
        //if the score is below the objective
        if getCurrentScore() < minimumScoreToUnlockObjective / 2 {
            //set the penalty lower
            pointsToLoseEachCycle = 10
        } else if getCurrentScore() < minimumScoreToUnlockObjective {
            pointsToLoseEachCycle = 20
        } else if getCurrentScore() < minimumScoreToUnlockObjective * 2 {
            pointsToLoseEachCycle = 30
        } else if getCurrentScore() < minimumScoreToUnlockObjective * 6 {
            pointsToLoseEachCycle = 35
        } else {
            //the player has found stride, and has good opportunities to earn points, so penalize taking too much time
            pointsToLoseEachCycle = 50
        }
        
    }
    
    ///a fader for 
    
    /// calculates the base score, which is 100 - the liklihood of the phrase just completed
    func calculateBaseScore(phrase: Phrase) -> Int {
        return (100 - phrase.likelihood) * 8
    }

    
    
    ///calculates the points earned from a given color, a color which represents the deviation between the goal and the progress
    func calculateColorMatchPointsEarned() -> (Int, String?, Float) {
        
        //really this is just the main color, but just in case that changes this way is more solid
        let deviationColor = objectiveFeedbackView.calculateColorDeviation(color1: objectiveFeedbackView.objectiveRingColor, color2: objectiveFeedbackView.progressRingColor)
        let magnitude: CGFloat = 22.0
        var deviationRGBA = [CGFloat](repeating: 0.0, count: 4)
        
        deviationColor.getRed(&deviationRGBA[0], green: &deviationRGBA[1], blue: &deviationRGBA[2], alpha: &deviationRGBA[3])
        let redRaw = Int(magnitude - deviationRGBA[0] * magnitude)
        let greenRaw = Int(magnitude - deviationRGBA[1] * magnitude)
        let blueRaw = Int(magnitude - deviationRGBA[2] * magnitude)
        
        let unadjustedScore =  redRaw + greenRaw + blueRaw
        let multiplier: CGFloat = 4.0
        let scoreToAward = CGFloat(unadjustedScore) * multiplier
        print("Awarding \(scoreToAward) points for matching")
        
        
        let maxScore = magnitude * 3.0 * multiplier
        var pointMessage: String? = nil
        let scorePercent = Int(scoreToAward/maxScore*100.0)
        
        switch scorePercent {
        case 100:
            pointMessage = "perfect!"
        case let x where x > 90:
            pointMessage = "\(scorePercent)% superb!"
        case let x where x > 80:
            pointMessage = "\(scorePercent)% great!"
        default:
            pointMessage = "\(scorePercent)% match"
        }
        return (Int(scoreToAward), pointMessage, Float(Float(scorePercent)/100.0))
    }
    

    
    /******************************************************/
    /*******************///MARK: Core Data functions
    /******************************************************/
    
    /**
     get the current score, if there is not a score record, make one at 0
     */
    func getCurrentScore() -> Int {
        guard let fc = frcDict[keyCurrentScore] else {
            return -1
            
        }
        
        guard let currentScores = fc.fetchedObjects as? [CurrentScore] else {
            
            return -1
        }
        
        if (currentScores.count) == 0 {
            
            print("No CurrentScore exists.  Creating.")
            let newScore = CurrentScore(entity: NSEntityDescription.entity(forEntityName: "CurrentScore", in: stack.context)!, insertInto: fc.managedObjectContext)
            
            return Int(newScore.value)
        } else {
            
            //print(currentScores[0].value)
            let score = Int(currentScores[0].value)
            
            //if didn't find at end of loop, must not be an entry, so level 0
            return score
        }
        
        
    }
    
    /// sets the current score, returns the newly set score
    func setCurrentScore(newScore: Int) {
        guard let fc = frcDict[keyCurrentScore] else {
            fatalError("Could not get frcDict")
            
        }
        
        guard let currentScores = fc.fetchedObjects as? [CurrentScore] else {
            fatalError("Could not get array of currentScores")
        }
        
        if (currentScores.count) == 0  {
            print("No CurrentScore exists.  Creating.")
            let currentScore = CurrentScore(entity: NSEntityDescription.entity(forEntityName: "CurrentScore", in: stack.context)!, insertInto: fc.managedObjectContext)
            currentScore.value = Int64(newScore)
            
            return
        } else {
            
            switch newScore {
            //TODO: if the score is already 0 don't set it again.
            case let x where x < 0:
                currentScores[0].value = Int64(0)
                return
            default:
                //set score for the first element
                currentScores[0].value = Int64(newScore)
                //print("There are \(currentScores.count) score entries in the database.")
                return
            }
            
            
        }
        
    }

   
    /******************************************************/
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

    /******************************************************/
    /*******************///MARK: Store Buttons
    /******************************************************/

    //simple and quick way to fade someting in then back out after a given time in secods
    func fadeViewInThenOut(view: UIView, fadeInAfterSeconds: TimeInterval) {
        
        //fade in
        view.fade(.in)
        
        let seconds = Int(fadeInAfterSeconds)
        let milliseconds = Int((fadeInAfterSeconds - Double(seconds)) * 1000)
        
        //fade out
        let deadline = DispatchTime.now() + DispatchTimeInterval.seconds(seconds) + DispatchTimeInterval.milliseconds(milliseconds)
        DispatchQueue.main.asyncAfter(deadline: deadline, execute: {
            view.fade(.out, delay: 0)
        })
    }
    
}
