//
//  DataViewController+GameSounds.swift
//  Charles
//
//  Created by Jacob Foster Davis on 5/29/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation
import AVFoundation
/******************************************************/
/*******************///MARK: Extension for non-character game sounds
/******************************************************/


extension DataViewController {
    
    enum ProgressSituation {
        case increaseLevel
        case decreaseLevel
        case increaseProgress
        case decreaseProgress
    }
    
    ///plays appropriate game sound for the given situation
    func playGameSound(forProgressSituation : ProgressSituation) {
        
        var audioFilePath: String?
        
        switch forProgressSituation {
        case .increaseLevel:
            audioFilePath = Bundle.main.path(forResource: "LevelUp", ofType: "m4a", inDirectory: "Audio/GameSounds")
        case .decreaseLevel:
            audioFilePath = Bundle.main.path(forResource: "LevelDown", ofType: "m4a", inDirectory: "Audio/GameSounds")
        case .increaseProgress:
            audioFilePath = Bundle.main.path(forResource: "ProgressUp", ofType: "m4a", inDirectory: "Audio/GameSounds")
        case .decreaseProgress:
            audioFilePath = Bundle.main.path(forResource: "ProgressDown", ofType: "m4a", inDirectory: "Audio/GameSounds")
        default:
            audioFilePath = nil
        }
        
        if let audioFilePath = audioFilePath {
        
            do{
                let url = URL(fileURLWithPath: audioFilePath)
                try audioPlayer = AVAudioPlayer(contentsOf: url)
                //audioPlayer.enableRate = true
                
                resetAudioEngineAndPlayer()
                
                //                try audioPlayer = AVAudioPlayer(contentsOf: url)
                let audioFile = try AVAudioFile(forReading: url)
                
                //changePitchEffect.pitch = currentPhrase.slots![currentButtons.index(of: sendingButton!)!].tone
                
                audioPlayerNode.scheduleFile(audioFile, at: nil, completionHandler: nil)
                
                try audioEngine.start()
                audioPlayerNode.play()
            } catch {
                print("Error when attempting to play audio file.")
            }
        } else {
            print ("Could not play audio file.  file not found")
        }
        
        
    }
    
    
    ///checks baselines and plays sounds if appropriate
    func compareLevelAndProgressAndPlaySounds(given currentLevelAndProgress: (Level?, Int?)) {
        if currentLevelAndProgress.0 != nil && currentLevelAndProgress.1 != nil {
            
            let currentLevel = currentLevelAndProgress.0!
            
            
            
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
                
                let currentProgress = currentLevelAndProgress.1!
                
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
}
