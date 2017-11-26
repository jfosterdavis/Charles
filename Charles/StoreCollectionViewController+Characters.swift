//
//  StoreCollectionViewController+Characters.swift
//  Charles
//
//  Created by Jacob Foster Davis on 6/25/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation
import UIKit

extension StoreCollectionViewController {
    
    
    func isCharacterAffordable(character: Character) -> Bool {
        
        let price = character.price
        
        if price > score {
            //print ("You cannot afford this item")
            return false
        } else {
            return true
        }
    }
    
    /**
     unlocks the given character and either returns that UnlockedCharacter object or returns nil if the character is already unlocked
     */
    func unlockCharacter(named characterName: String) -> UnlockedCharacter? {
        //check to see if the character is already unlocked
        
        if let isUnlocked = try? checkForUnlockFeature(featureKey: keyUnlockedCharacter, featureId: characterName) {
            
            //            guard let fc = frcDict[keyUnlockedCharacter] else {
            //                fatalError("Can't find a fc with the key named \(keyUnlockedCharacter)")
            //            }
            //
            //            guard (fc.fetchedObjects as? [UnlockedCharacter]) != nil else {
            //
            //                fatalError("fc.fetchedObjects array didn't return an array of UnlockedCharacter.")
            //            }
            
            if isUnlocked {
                //it is already unlocked, so return nil
                return nil
            } else {
                //get the amount of time this character will be hired for.
                let character = Characters.UnlockableCharacters.filter { $0.name == characterName }[0]
                
                // Get the stack
                let delegate = UIApplication.shared.delegate as! AppDelegate
                self.stack = delegate.stack
                
                let newCharacter = UnlockedCharacter(name: characterName, expiresHours: character.hoursUnlocked, context: stack.context)
                //newCharacter.name = characterName
                print("Unlocked a new character named \(String(describing: newCharacter.name))")
                return newCharacter
                
            }
        }
        
        //got an error when checking for the feature, return nil
        return nil
        
        
    }
    
    
    ///locks all characters that are unlockable and have exceeded the expiration date.
    func lockAllExpiredCharacters() {
        let expiredCharacters = getExpiredCharacters()
        
        for character in expiredCharacters {
            lockCharacter(unlockedCharacter: character)
        }
    }
    
    ///returns an array of all characters that are expired
    func getExpiredCharacters() -> [UnlockedCharacter] {
        
        let unlockedCharacters = getAllUnlockedCharacters()
        var expiredCharacters = [UnlockedCharacter]()
        
        for character in unlockedCharacters {
            //check each character's date.  If it is in the past, add it to the array of expired characters
            let now = Date()
            let expiryDate = character.datetimeExpires as Date
            
            if expiryDate < now {
                expiredCharacters.append(character)
            }
        }
        print("\(expiredCharacters.count) characters have expired")
        return expiredCharacters
    }
    
    func getAllUnlockedCharacters() -> [UnlockedCharacter] {
        
        var fc = frcDict[keyUnlockedCharacter]
        
        if fc == nil {
            //try to load it again since this can be called by outside
            _ = setupFetchedResultsController(frcKey: keyUnlockedCharacter, entityName: "UnlockedCharacter", sortDescriptors: [],  predicate: nil)
            
            fc = frcDict[keyUnlockedCharacter]
            
            //but if still not loaded
            guard fc != nil else {
                fatalError("Can't find a fc with the key named \(keyUnlockedCharacter)")
            }
            
        }
        
        guard (fc!.fetchedObjects as? [UnlockedCharacter]) != nil else {
            
            fatalError("fc.fetchedObjects array didn't return an array of UnlockedCharacter.")
        }
        
        let unlockedCharacters = fc!.fetchedObjects as! [UnlockedCharacter]
        
        return unlockedCharacters
    }
    
    
    //locks character by deleting the entity in the unlocked characters model
    func lockCharacter(unlockedCharacter: UnlockedCharacter) {
        
        //check to see if this character is unlocked
        if let isUnlocked = try? checkForUnlockFeature(featureKey: keyUnlockedCharacter, featureId: unlockedCharacter.name) {
            
            if isUnlocked {
                //it is unlocked, so lock it by deleting
                let characterToDelete = getUnlockedCharacter(named: unlockedCharacter.name)
                
                if characterToDelete != nil {
                    // Get the stack
                    let delegate = UIApplication.shared.delegate as! AppDelegate
                    self.stack = delegate.stack
                    
                    if let context = self.frcDict[keyUnlockedCharacter]?.managedObjectContext {
                        
                        context.delete(characterToDelete!)
                        //self.stack.save()
                        
                    }
                }
                
            }
        }
        
    }
    
    /**
     returns the UnlockedCharacter object from the CoreData.  Perhaps to be deleted (thereby removing it).
     */
    func getUnlockedCharacter(named characterName:String) -> UnlockedCharacter? {
        
        let characterExists = try? checkForUnlockFeature(featureKey: keyUnlockedCharacter, featureId: characterName)
        
        if characterExists == false || characterExists == nil {
            return nil
        } else {
            //the character does exist, so get and return the UnlockedCharacter
            guard let fc = frcDict[keyUnlockedCharacter] else {
                fatalError("Can't find a fc with the key named \(keyUnlockedCharacter)")
            }
            
            guard let characters = fc.fetchedObjects as? [UnlockedCharacter] else {
                
                fatalError("fc.fetchedObjects array didn't return an array of UnlockedCharacter.")
            }
            
            for character in characters {
                if character.name == characterName {
                    return character
                }
            }
            
            //no character found
            return nil
        }
    }
    
    ///returns array of all valid characters that are not unlocked
    func getAllLockedCharacters() -> [Character] {
        
        let unlockableCharacters = Characters.UnlockableCharacters
        var allLockedCharacters: [Character] = []
        
        //add the characters that have not been unlocked
        for character in unlockableCharacters {
            //if the character is already unlocked, remove from the array
            
            let isUnlocked = try! checkForUnlockFeature(featureKey: keyUnlockedCharacter, featureId: character.name)
            
            if !isUnlocked {
                allLockedCharacters.append(character)
            }
        }
        
        return allLockedCharacters
        
    }
    
    func getAllCharactersDisplayableInStore() -> [Character] {
        
        if enforceCharacterLevel {
            var applicableCharacters = [Character]()
            
            let userLevel = parentVC.getUserCurrentLevel()
            
            
            
            for character in Characters.ValidCharacters {
                //only characters with a level to be enforced are non-optional
                //also show characters that are unlocked (for when user beats game some things may still be unlocked like R0berte)
                if let characterLevel = character.levelEligibleAt {
                    if characterLevel <= userLevel.level {
                        applicableCharacters.append(character)
                    }
                } else { //no enforcement neccessary, add to store
                    applicableCharacters.append(character)
                }
            }
            
            //find any characters that are unlocked and store them in array to ensure will display
            let unlockedCharacterObjects = getAllUnlockedCharacters()
            //get the Character object for these UnlockedCharacter objects
            for unlockedCharacterObject in unlockedCharacterObjects {
                //get the character object from the list of valid characters and put it into the array of those to make sure will display
                for character in Characters.ValidCharacters {
                    //only add the character if it is unlocked and the character is not already in the applicable characters
                    if character.name == unlockedCharacterObject.name && !applicableCharacters.contains(character) {
                        applicableCharacters.append(character)
                    }
                    
                }
            }
            
            return applicableCharacters
        } else {
            return Characters.ValidCharacters
        }
        
        
        
    }
    
    
    ///determines the number of hours until the character expires and the number of total hours the character is scheduled to be unlocked.  returns nil both value if the character is not unlocked (hoursUntilExpiry, minutesUntilExpiry, totalHours)
    func getHoursOfExpiry(forCharacter unlockedCharater: UnlockedCharacter) -> (Int?, Int?, Int?) {
        
        //validate the character is unlocked
        let isUnlocked = try! checkForUnlockFeature(featureKey: keyUnlockedCharacter, featureId: unlockedCharater.name)
        
        if isUnlocked {
            let startDate = unlockedCharater.datetimeUnlocked as Date
            let endDate = unlockedCharater.datetimeExpires as Date
            let now = Date()
            
            let totalHours = endDate.hours(from: startDate)
            let hoursUntilExpiry = endDate.hours(from: now) + 1
            let minutesUntilExpiry = endDate.minutes(from: now) + 1  //add one to include the present minute
            
            //let percentOfPieToFill = Float(hoursUntilExpiry) / Float(totalHours)
            return (hoursUntilExpiry, minutesUntilExpiry, totalHours )
            
        } else {
            return (nil, nil, nil)
        }
    }
    
    ///is the player a high enough level
    func isPlayerLevelRequirementMet(character: Character) -> Bool {
        //get player level
        //figure out what level the player is on
        let userXP = parentVC.calculateUserXP()
        let currentLevelAndProgress = Levels.getLevelAndProgress(from: userXP)
        let playerLevel = currentLevelAndProgress.0.level
        
        if let characterLevel = character.levelEligibleAt, enforceCharacterLevel {
            if playerLevel >= characterLevel {
                return true
            } else {
                return false
            }
        } else {
            return true
        }
        
        
    }
}
