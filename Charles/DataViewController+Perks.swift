//
//  DataViewController+Perks.swift
//  Charles
//
//  Created by Jacob Foster Davis on 5/30/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation
import UIKit

/******************************************************/
/*******************///MARK: Perks
/******************************************************/

enum UnlockableFeatureStatus {
    ///test
    case unlocked //perk is actively purchased by the user and should be active
    case locked //perk can be purchased but has not
    //case notAvailable //cannot be purchased by the player due to restrictions other than insufficient funds
}

extension DataViewController {
    
    
    ///Checks for the given perk and the given status and returns an empty array (meaning there are no perks matching the given criteria) or an array of the (Perk, UnlockedPerk?) objects.  Main method of finding out if a perk is active or not.  for quick checks you can see if it is not nil, and for more specific needs you can access the returned Perks and UnlockedPerks directly
    func getAllPerks(ofType type: PerkType, withStatus status: UnlockableFeatureStatus) -> [(Perk, UnlockedPerk?)] {
        
        //The perkstore has all the info we need.
        let perkStore = self.storyboard!.instantiateViewController(withIdentifier: "PerkStore") as! PerkStoreCollectionViewController
        
        switch status {
        case .unlocked:
            let unlockedPerks = perkStore.getAllUnlockedPerks()
            if unlockedPerks.isEmpty {
                //no unlocked perks
                return [(Perk, UnlockedPerk?)]()
            } else {
                //for each UnlockedPerk in the array, check for the given PerkType
                var returnablePerkSet = [(Perk, UnlockedPerk?)]()
                let applicablePerkObjects: [Perk] = Perks.UnlockablePerks.filter{$0.type == type}
                for unlockedPerk in unlockedPerks {
                    for perk in applicablePerkObjects {
                        
                        if perk.name == unlockedPerk.name {
                            returnablePerkSet.append((perk, unlockedPerk))
                        }
                        
                    }
                }
                return returnablePerkSet
            }
        case .locked:
            let lockedPerks = perkStore.getAllLockedPerks()
            if lockedPerks.isEmpty {
                //no locked perks
                return [(Perk, UnlockedPerk?)]()
            } else {
                //for each UnlockedPerk in the array, check for the given PerkType
                var returnablePerkSet = [(Perk, UnlockedPerk?)]()
                for perk in lockedPerks {
                    returnablePerkSet.append((perk, nil))
                    return returnablePerkSet
                }
            }
        }
        
        //if you got this far then it must be no results
        return [(Perk, UnlockedPerk?)]()
    }
    
    /******************************************************/
    /*******************///MARK: Synesthesia
    /******************************************************/

    //quickly flashes the background from transparent to not when a button is pressed
    func perkSynesthesiaFireBackgroundBlinker(intensity: Float, fadeInOverSeconds: TimeInterval = 2.0) {
        
        //intensity should be between .1 and 1
        var newIntensity = CGFloat(intensity)
        if intensity > 1 {
            newIntensity = 1
        } else if intensity < 0.1 {
            newIntensity = 0.1
        }
        
        //now half that intensity
        //newIntensity = newIntensity / 2
        //newIntensity = 1
        //if the alpha is already non-zero
        
        //fade in
        self.synesthesiaBackgroundBlinker.fade(.inOrOut,
                       resultAlpha: newIntensity,
                  withDuration: 0.2,
                  delay: 0
                  )
        self.synesthesiaBackgroundBlinkerImageView.fade(.inOrOut,
                                               resultAlpha: newIntensity,
                                               withDuration: 0.2,
                                               delay: 0
        )
        
        let milliseconds = 200
        
        //fade out
        let deadline = DispatchTime.now() + DispatchTimeInterval.milliseconds(milliseconds)
        DispatchQueue.main.asyncAfter(deadline: deadline, execute: {
            self.synesthesiaBackgroundBlinker.fade(.out,
                           withDuration: fadeInOverSeconds,
                           delay: 0
                           )
            
            self.synesthesiaBackgroundBlinkerImageView.fade(.out,
                                                   withDuration: fadeInOverSeconds,
                                                   delay: 0
            )
        })
    }
    
    ///checks the store for expired characters.  If found they are removed and the storeClosed() function is called. Returns true if expired characters were found, false otherwise
    func checkForAndRemoveExpiredPerks() -> [Perk]? {
        
        //create a store object to use its functions for checking if perks have expired
        let perkStoreVC = self.storyboard!.instantiateViewController(withIdentifier: "PerkStore") as! PerkStoreCollectionViewController
        let expiredPerks: [UnlockedPerk] = perkStoreVC.getExpiredPerks()
        
        if !expiredPerks.isEmpty {
            
            //prepare the data for the VC
            var departingPerks = [Perk]()
            for unlockedPerk in expiredPerks {
                for perk in Perks.ValidPerks {
                    if unlockedPerk.name == perk.name {
                        departingPerks.append(perk)
                    }
                }
            }
            
            //there are expired perks.  lock them and reload the modelController
            perkStoreVC.parentVC = self
            perkStoreVC.lockAllExpiredPerks()
            
            
            self.parentVC.storeClosed()
            
            return departingPerks
            
            //open the perk store
            //perkStoreButtonPressed(self)
            
            //invoke the function to mimic functionality as though the store had just closed
            //self.storeClosed()
            
        } else {
            return nil
        }
    }
    
    
    /******************************************************/
    /*******************///MARK: Investment
    /******************************************************/

    ///called when user needs to reap consequences of the Big Payoff expiring.  Will lose 50% of money plus 5% for all other active perks. Will be sent back to level 22.  All Active perks will be expire (locked).
    func investmentCrash(activeInvestmentPerks: [(Perk, UnlockedPerk?)]) {
        
        //tell the player
        // Create a new view controller and pass suitable data.
        let investmentVC = self.storyboard!.instantiateViewController(withIdentifier: "InvestmentCrash") as! InvestmentCrashViewController
        
        present(investmentVC, animated: true, completion: nil)
        
        //take away score
        var fractionToLose: Double = 0.60
        fractionToLose += Double(activeInvestmentPerks.count) * 0.05
        print ("User will lose \(fractionToLose) of all score.")
        let currentScore = getCurrentScore()
        let newScore = currentScore - Int(Double(currentScore) * fractionToLose)
        setCurrentScore(newScore: newScore)
        
        //lock all perks
        //create a store object to use its functions for checking if perks have expired
        let perkStoreVC = self.storyboard!.instantiateViewController(withIdentifier: "PerkStore") as! PerkStoreCollectionViewController
        let activePerks = perkStoreVC.getAllUnlockedPerks()
        for activePerk in activePerks {
            perkStoreVC.lockPerk(unlockedPerk: activePerk)
        }
        
        //reset player level to 22 (looter)
        reducePlayerLevel(to: 22)
        
    }
    
    
    
}
