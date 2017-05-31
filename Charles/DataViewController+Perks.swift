//
//  DataViewController+Perks.swift
//  Charles
//
//  Created by Jacob Foster Davis on 5/30/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation

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
    
}
