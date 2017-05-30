//
//  Perks.swift
//  Charles
//
//  Created by Jacob Foster Davis on 5/29/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation
import UIKit

/******************************************************/
/*******************///MARK: Defines and holds all perks in the game
/******************************************************/


struct Perks {
    
    static let ValidPerks:[Perk] = [Insight]
    static let UnlockablePerks:[Perk] = [Insight]
    
    static let Insight = Perk(     name: "Insight",
                                    gameDescription: "Earn twice as much XP each engagement.",
                                    type: .increasedXP, //types are strings that the game will look for when determining how to behave
                                    price: 9000,
                                    meta1: 2,
                                    meta2: nil,
                                    meta3: nil,
                                    minutesUnlocked: 60,
                                    icon: #imageLiteral(resourceName: "PerkInsight"),
                                    displayColor: .cyan,
                                    levelEligibleAt: 5,
                                    requiredPartyMembers: []
    )
    
    
    
    
    
}
