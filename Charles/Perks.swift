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
    
    static let ValidPerks:[Perk] = [Insight, Quickstudy, Synesthesia, Synesthesia2]
    static let UnlockablePerks:[Perk] = [Insight, Quickstudy, Synesthesia, Synesthesia2]
    
    static let Insight = Perk(     name: "Insight",
                                    gameDescription: "You see things others might not.",
                                    type: .visualizeColorValues, //types are strings that the game will look for when determining how to behave
                                    price: 5000,
                                    meta1: 2,
                                    meta2: nil,
                                    meta3: nil,
                                    minutesUnlocked: 120,
                                    icon: #imageLiteral(resourceName: "PerkInsight"),
                                    displayColor: UIColor(red: 0/255.0, green: 134/255.0, blue: 237/255.0, alpha: 1),
                                    levelEligibleAt: 5,
                                    requiredPartyMembers: []
    )
    
    static let Quickstudy = Perk(     name: "Quick Study",
                                   gameDescription: "You get more out of each encounter.",
                                   type: .increasedXP, //types are strings that the game will look for when determining how to behave
                                    price: 100000,
                                    meta1: 2,
                                    meta2: nil,
                                    meta3: nil,
                                    minutesUnlocked: 40,
                                    icon: #imageLiteral(resourceName: "PerkQuickstudy"),
                                    displayColor: UIColor(red: 114/255.0, green: 42/255.0, blue: 183/255.0, alpha: 1),
                                    levelEligibleAt: 5,
                                    requiredPartyMembers: []
    )
    
    
    static let Synesthesia = Perk(     name: "Synesthesia",
                                      gameDescription: "When others hear words, you hear music.",
                                      type: .musicalVoices, //types are strings that the game will look for when determining how to behave
                                        price: 200,
                                        meta1: 2,
                                        meta2: nil,
                                        meta3: nil,
                                        minutesUnlocked: 90,
                                        icon: #imageLiteral(resourceName: "PerkSynesthesia"),
                                        displayColor: UIColor(red: 255/255.0, green: 111/255.0, blue: 207/255.0, alpha: 1),
                                        levelEligibleAt: 5,
                                        requiredPartyMembers: [Characters.Laura]
    )
    
    static let Synesthesia2 = Perk(     name: "Synesthesia 2",
                                       gameDescription: "When others hear words, you hear music.",
                                       type: .musicalVoices, //types are strings that the game will look for when determining how to behave
        price: 2000231,
        meta1: 2,
        meta2: nil,
        meta3: nil,
        minutesUnlocked: 90,
        icon: #imageLiteral(resourceName: "PerkSynesthesia"),
        displayColor: UIColor(red: 255/255.0, green: 111/255.0, blue: 207/255.0, alpha: 1),
        levelEligibleAt: 5,
        requiredPartyMembers: [Characters.Laura]
    )
    
    
    
    
    
}
