//
//  StoreCollectionViewController+Perks.swift
//  Charles
//
//  Created by Jacob Foster Davis on 6/25/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation
import UIKit

extension StoreCollectionViewController {
    
    /******************************************************/
    /*******************///MARK: Perks
    /******************************************************/
    
    func lockAllExpiredPerks() {
        let expiredPerks = getExpiredPerks()
        
        /******************************************************/
        /*******************///MARK: PERK INVESTMENT
        /******************************************************/
        //if the big payoff investment has expired, player will lose 50% of all money plus 5% for all active (and expiring) investment perks.  Then lock all perks.
        //let vC = self.storyboard!.instantiateViewController(withIdentifier: "DataViewController") as! DataViewController
        //add to the points earned
        let applicableInvestmentPerks = parentVC.getAllPerks(ofType: .investment, withStatus: .unlocked)
        
        if !applicableInvestmentPerks.isEmpty {
            //there are active investment perks
            var foundExpiringBigPayoff = false
            for (perk, unlockedPerk) in applicableInvestmentPerks {
                //check to see if the big payoff is among the expired perks
                if perk === Perks.Investment5 {  //the big payoff is Investment5
                    //the big payoff is active
                    
                    for expiredPerk in expiredPerks {
                        if expiredPerk === unlockedPerk {
                            ///the big payoff is one of the expired perks
                            print("The big payoff is expiring.")
                            foundExpiringBigPayoff = true
                        }
                    }
                }
            }
            
            if foundExpiringBigPayoff {
                parentVC.investmentCrash(activeInvestmentPerks: applicableInvestmentPerks)
            } else {
                //normal locking routine
                for perk in expiredPerks {
                    lockPerk(unlockedPerk: perk)
                }
            }
            /******************************************************/
            /*******************///MARK: END PERK INVESTMENT
            /******************************************************/
        } else {
            
            
            //normal locking routine
            for perk in expiredPerks {
                lockPerk(unlockedPerk: perk)
            }
        }
    }
    
    ///returns an array of all characters that are expired
    func getExpiredPerks() -> [UnlockedPerk] {
        
        let unlockedPerks = getAllUnlockedPerks()
        var expiredPerks = [UnlockedPerk]()
        
        for perk in unlockedPerks {
            //check each perk's date.  If it is in the past, add it to the array of expired characters
            let now = Date()
            let expiryDate = perk.datetimeExpires as Date
            
            if expiryDate < now {
                expiredPerks.append(perk)
            }
        }
        print("\(expiredPerks.count) perks have expired")
        return expiredPerks
    }
    
    func getAllUnlockedPerks() -> [UnlockedPerk] {
        
        var fc = frcDict[keyUnlockedPerk]
        
        if fc == nil {
            //try to load it again since this can be called by outside
            _ = setupFetchedResultsController(frcKey: keyUnlockedPerk, entityName: "UnlockedPerk", sortDescriptors: [],  predicate: nil)
            
            fc = frcDict[keyUnlockedPerk]
            
            //but if still not loaded
            guard fc != nil else {
                fatalError("Can't find a fc with the key named \(keyUnlockedPerk)")
            }
            
        }
        
        guard (fc!.fetchedObjects as? [UnlockedPerk]) != nil else {
            
            fatalError("fc.fetchedObjects array didn't return an array of UnlockedPerk.")
        }
        
        let unlockedPerks = fc!.fetchedObjects as! [UnlockedPerk]
        
        return unlockedPerks
    }
    
    
    
    
    
    //TODO: Go through all these functions and make them handle all types instead of repeatig them
    //locks character by deleting the entity in the unlocked characters model
    func lockPerk(unlockedPerk: UnlockedPerk) {
        
        //check to see if this character is unlocked
        if let isUnlocked = try? checkForUnlockFeature(featureKey: keyUnlockedPerk, featureId: unlockedPerk.name) {
            
            if isUnlocked {
                //it is unlocked, so lock it by deleting
                let perkToDelete = getUnlockedPerk(named: unlockedPerk.name)
                
                if perkToDelete != nil {
                    // Get the stack
                    let delegate = UIApplication.shared.delegate as! AppDelegate
                    self.stack = delegate.stack
                    
                    if let context = self.frcDict[keyUnlockedPerk]?.managedObjectContext {
                        
                        context.delete(perkToDelete!)
                        
                    }
                }
                
            }
        }
        
    }
    
    /**
     returns the UnlockedCharacter object from the CoreData.  Perhaps to be deleted (thereby removing it).
     */
    
    /******************************************************/
    /*******************///MARK: NEED THIS OVERRIDE
    /******************************************************/
    
    //TODO: Change all of this returning a string crap into passing actual objects
    func getUnlockedPerk(named perkName:String) -> UnlockedPerk? {
        
        let perkExists = try? checkForUnlockFeature(featureKey: keyUnlockedPerk, featureId: perkName)
        
        if perkExists == false || perkExists == nil {
            return nil
        } else {
            //the perk does exist, so get and return the UnlockedPerk
            guard let fc = frcDict[keyUnlockedPerk] else {
                fatalError("Can't find a fc with the key named \(keyUnlockedPerk)")
            }
            
            guard let perks = fc.fetchedObjects as? [UnlockedPerk] else {
                
                fatalError("fc.fetchedObjects array didn't return an array of UnlockedPerk.")
            }
            
            for perk in perks {
                if perk.name == perkName {
                    return perk
                }
            }
            
            //no perk found
            return nil
        }
    }
    
    ///returns array of all valid characters that are not unlocked
    func getAllLockedPerks() -> [Perk] {
        
        let unlockablePerks = Perks.UnlockablePerks
        var allLockedPerks: [Perk] = []
        
        //add the perk that have not been unlocked
        for perk in unlockablePerks {
            //if the perk is already unlocked, remove from the array
            
            let isUnlocked = try! checkForUnlockFeature(featureKey: keyUnlockedPerk, featureId: perk.name)
            
            if !isUnlocked {
                allLockedPerks.append(perk)
            }
        }
        
        return allLockedPerks
        
    }
    
    
    /******************************************************/
    /*******************///MARK: NEED THIS OVERRIDE
    /******************************************************/
    
    func getAllPerksDisplayableInStore() -> [Perk] {
        
        //only show perks avialable based on the user's current level
        if enforcePerkLevel {
            var applicablePerks = [Perk]()
            
            let userLevel = parentVC.getUserCurrentLevel()
            
            for perk in Perks.ValidPerks {
                //only perks with a level to be enforced are non-optional
                if let perkLevel = perk.levelEligibleAt {
                    if perkLevel <= userLevel.level {
                        applicablePerks.append(perk)
                    }
                } else { //no enforcement neccessary, add to store
                    applicablePerks.append(perk)
                }
            }
            return applicablePerks
        } else {
            return Perks.ValidPerks
        }
    }
    
    
    //TODO: consolidate this function with parent
    ///determines the number of hours until the character expires and the number of total hours the character is scheduled to be unlocked.  returns nil both value if the character is not unlocked (hoursUntilExpiry, minutesUntilExpiry, totalHours)
    func getHoursOfExpiry(forPerk unlockedPerk: UnlockedPerk) -> (Int?, Int?, Int?) {
        
        //validate the character is unlocked
        let isUnlocked = try! checkForUnlockFeature(featureKey: keyUnlockedPerk, featureId: unlockedPerk.name)
        
        if isUnlocked {
            let startDate = unlockedPerk.datetimeUnlocked as Date
            let endDate = unlockedPerk.datetimeExpires as Date
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

    
    
    func isPerkAffordable(perk: Perk) -> Bool {
        
        let price = perk.price!
        
        if price > score {
            //print ("You cannot afford this item")
            return false
        } else {
            return true
        }
    }
    
    func isPerkRequiredCharacterPresent(perk: Perk) -> Bool {
        
        if perk.requiredPartyMembers.isEmpty {
            return true
        } else {
            //ask the store if they are unlocked
            let store = self.storyboard!.instantiateViewController(withIdentifier: "Store") as! StoreCollectionViewController
            let unlockedCharacters = store.getAllUnlockedCharacters()
            
            for unlockedCharacter in unlockedCharacters {
                //check for any of the required party members
                for perkPartyMember in perk.requiredPartyMembers {
                    if unlockedCharacter.name == perkPartyMember.name {
                        return true
                    }
                }
            }
            //nobody required was found
            return false
        }
        
    }
    
    func unlockPerk(named perkName: String) -> UnlockedPerk? {
        //check to see if the character is already unlocked
        
        if let isUnlocked = try? checkForUnlockFeature(featureKey: keyUnlockedPerk, featureId: perkName) {
            
            if isUnlocked {
                //it is already unlocked, so return nil
                return nil
            } else {
                //it is not unlocked, so unlock it and return the character
                //get the actual perk object to find amount of time to unlock
                var thePerk: Perk? = nil
                for perk in Perks.UnlockablePerks {
                    if perk.name == perkName {
                        thePerk = perk
                    }
                }
                
                var minutesToUnlock = 30
                if let thePerk = thePerk {
                    minutesToUnlock = thePerk.minutesUnlocked
                }
                
                // Get the stack
                let delegate = UIApplication.shared.delegate as! AppDelegate
                self.stack = delegate.stack
                
                let newPerk = UnlockedPerk(name: perkName, expiresMinutes: minutesToUnlock, context: stack.context)
                
                print("Unlocked a new Perk named \(String(describing: newPerk.name))")
                return newPerk
                
            }
        }
        
        //got an error when checking for the feature, return nil
        return nil
        
        
    }

    
}
