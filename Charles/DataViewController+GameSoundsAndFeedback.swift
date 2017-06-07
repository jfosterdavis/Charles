//
//  DataViewController+GameSoundsAndFeedback.swift
//  Charles
//
//  Created by Jacob Foster Davis on 5/29/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit
/******************************************************/
/*******************///MARK: Extension for non-character game sounds and other feedback to user
/******************************************************/


extension DataViewController {
    
    enum ProgressSituation {
        case increaseLevel
        case decreaseLevel
        case increaseProgress
        case decreaseProgress
        case wonGame
    }
    
    /******************************************************/
    /*******************///MARK: Game Audio
    /******************************************************/
    
    
    func resetAudioEngineAndPlayer() {
        //audioPlayer.stop()
        audioEngine.stop()
        audioPlayerNode.stop()
        
        audioEngine.disconnectNodeOutput(audioPlayerNode)
        audioEngine.disconnectNodeOutput(synesthesiaDistortion)
        audioEngine.disconnectNodeOutput(synesthesiaReverb)
        //audioEngine.reset()
    }
    
    func resetAudioEngineAndPlayerGameSounds() {
        audioEngineGameSounds.stop()
        audioPlayerNodeGameSounds.stop()
    }
    
    func speak(subphrase: Subphrase){
        
        
        textUtterance = AVSpeechUtterance(string: subphrase.words)
        textUtterance.rate = 0.3
        //textUtterance.pitchMultiplier = toneToSpeak
        
        //speak
        synth.speak(textUtterance)
    }
    
    
    /******************************************************/
    /*******************///MARK: Sounds
    /******************************************************/

    
    ///plays appropriate game sound for the given situation
    func playGameSound(forProgressSituation : ProgressSituation) {
        
        var audioFilePath: String?
        var gameSoundPitchModifier: Float
        
        switch forProgressSituation {
        case .increaseLevel:
            audioFilePath = Bundle.main.path(forResource: "LevelUp", ofType: "m4a", inDirectory: "Audio/GameSounds")
            gameSoundPitchModifier = 300
        case .decreaseLevel:
            audioFilePath = Bundle.main.path(forResource: "LevelDown", ofType: "m4a", inDirectory: "Audio/GameSounds")
            gameSoundPitchModifier = -350
        case .increaseProgress:
            audioFilePath = Bundle.main.path(forResource: "ProgressUp", ofType: "m4a", inDirectory: "Audio/GameSounds")
            gameSoundPitchModifier = 180
        case .decreaseProgress:
            audioFilePath = Bundle.main.path(forResource: "ProgressDown", ofType: "m4a", inDirectory: "Audio/GameSounds")
            gameSoundPitchModifier = -300
        case .wonGame:
            audioFilePath = Bundle.main.path(forResource: "LevelUp", ofType: "m4a", inDirectory: "Audio/GameSounds")
            gameSoundPitchModifier = 500
//        default:
//            audioFilePath = nil
        }
        
        if let audioFilePath = audioFilePath {
        
            do{
                let url = URL(fileURLWithPath: audioFilePath)
                try audioPlayerGameSounds = AVAudioPlayer(contentsOf: url)
                audioPlayerGameSounds.enableRate = true
                
                resetAudioEngineAndPlayerGameSounds()
                
                //                try audioPlayer = AVAudioPlayer(contentsOf: url)
                let audioFile = try AVAudioFile(forReading: url)
                
                changePitchEffectGameSounds.pitch = gameSoundPitchModifier
                
                audioPlayerNodeGameSounds.scheduleFile(audioFile, at: nil, completionHandler: nil)
                
                try audioEngineGameSounds.start()
                audioPlayerNodeGameSounds.play()
            } catch {
                print("Error when attempting to play audio file.")
            }
        } else {
            print ("Could not play audio file.  file not found")
        }
        
        
    }
    
    
    ///checks baselines and plays sounds if appropriate
    func compareLevelAndProgressAndPlaySounds(given currentLevelAndProgress: (Level, Int)) {
        
            
        let currentLevel = currentLevelAndProgress.0
        
        //get all the stuff you need to determine if the player won
        let userXP = calculateUserXP()
        let userLevelAndProgress = Levels.getLevelAndProgress(from: userXP)
        let userCurrentProgress = userLevelAndProgress.1
        let didPlayerProgressToGetHere = didPlayer(magnitudeDirection: .increase, in: .progress, byAchieving: userCurrentProgress)
        if isPlayerAtHighestLevelAndProgress() &&  didPlayerProgressToGetHere {  //player has won so play the final sounds
            playGameSound(forProgressSituation: .wonGame)
        } else {  //player did not win the game yet
            
            //determine if the player just increased in level
            let didProgressInLevel = didPlayer(magnitudeDirection: .increase, in: .level, byAchieving: currentLevel.level)
            let didDecreaseInLevel = didPlayer(magnitudeDirection: .decrease, in: .level, byAchieving: currentLevel.level)
            
            if didProgressInLevel {
                //the user progressed in level, play appropriate sound
                playGameSound(forProgressSituation: .increaseLevel)
                
            } else if didDecreaseInLevel {
                //the user decreased in level, play appropriate sound
                playGameSound(forProgressSituation: .decreaseLevel)
                
            } else { //didn't progress in level, check baseline progress
                
                let currentProgress = currentLevelAndProgress.1
                
                //determine if the player just increased in progress
                let didProgressInProgress = didPlayer(magnitudeDirection: .increase, in: .progress, byAchieving: currentProgress)
                let didDecreaseInProgress = didPlayer(magnitudeDirection: .decrease, in: .progress, byAchieving: currentProgress)
                
                if didProgressInProgress {
                    playGameSound(forProgressSituation: .increaseProgress)
                } else if didDecreaseInProgress {
                    playGameSound(forProgressSituation: .decreaseProgress)
                }
                //if none of the above triggered, there is no sound to play
                
            }
        }
        
    }
    
    /******************************************************/
    /*******************///MARK: User Feedback
    /******************************************************/

    ///flashes the amount of points the user just scored to the screen
    func presentJustScoredFeedback(justScored: Int) {
        
        //make invisible in case in the middle of a feedback
        justScoredLabel.alpha = 0
        var scoreModifier = "+"
        var presentableScoreValue = justScored
        
        //check if the score is negative to appropriate color
        if justScored < 0 {
            scoreModifier = "-"
            justScoredLabel.textColor = UIColor.red
            presentableScoreValue = presentableScoreValue * -1
        } else {
            justScoredLabel.textColor = feedbackColorMoss.textColor
        }
        
        justScoredLabel.text = "\(scoreModifier)\(String(describing: presentableScoreValue))"
        self.justScoredLabel.isHidden = false
        UIView.animate(withDuration: 0.2, animations: {
            
            self.justScoredLabel.alpha = 1.0
        }, completion: { (finished:Bool) in
            
            //now fade away again
            UIView.animate(withDuration: 2.7, animations: {
                self.justScoredLabel.alpha = 0.0
            }, completion: { (finished:Bool) in
                //self.justScoredLabel.isHidden = true
            })
        })
    }
    
    ///flashes the a message about the score the screen
    func presentJustScoredMessageFeedback(message: String, isGoodMessage: Bool = true) {
        
        //make invisible in case in the middle of a feedback
        justScoredMessageLabel.alpha = 0
        
        //color the message based on good or bad
        if isGoodMessage {
            justScoredMessageLabel.textColor = feedbackColorMoss.textColor
        } else { //color if the message is bad!
            justScoredMessageLabel.textColor = UIColor.red
        }
        
        justScoredMessageLabel.text = "\(message)"
        self.justScoredMessageLabel.isHidden = false
        UIView.animate(withDuration: 0.4,
                       delay: 0.0,
                       animations: {
                        
                        self.justScoredMessageLabel.alpha = 1.0
        }, completion: { (finished:Bool) in
            
            //now fade away again
            UIView.animate(withDuration: 2.0,
                           delay: 0.5,
                           animations: {
                            self.justScoredMessageLabel.alpha = 0.0
            }, completion: { (finished:Bool) in
                //self.justScoredLabel.isHidden = true
            })
        })
    }
}
