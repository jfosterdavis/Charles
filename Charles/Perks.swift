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
    
    static let ValidPerks:[Perk] = [Stacks,  Insight, Quickstudy, Synesthesia, Closeenough, Studybuddy, Doublestacks, Justabout, Triplestacks, Intheballpark]
    static let UnlockablePerks:[Perk] = [Stacks, Insight, Quickstudy, Synesthesia, Closeenough,   Studybuddy, Doublestacks, Justabout,  Triplestacks, Intheballpark]
    
    static let Insight = Perk(     name: "Insight",
                                    gameDescription: "You see things others might not.",
                                    type: .visualizeColorValues, //types are strings that the game will look for when determining how to behave
                                    price: 5000,
                                    meta1: 2,
                                    meta2: nil,
                                    meta3: nil,
                                    minutesUnlocked: 30,
                                    icon: #imageLiteral(resourceName: "lightbulb"),
                                    displayColor: UIColor(red: 0/255.0, green: 134/255.0, blue: 237/255.0, alpha: 1),
                                    levelEligibleAt: 5,
                                    requiredPartyMembers: []
    )
    
    static let Quickstudy = Perk(     name: "Quick Study",
                                   gameDescription: "You get more out of each encounter.",
                                   type: .increasedXP, //types are strings that the game will look for when determining how to behave
                                    price: 50000,
                                    meta1: 2,
                                    meta2: nil,
                                    meta3: nil,
                                    minutesUnlocked: 20,
                                    icon: #imageLiteral(resourceName: "pencil"),
                                    displayColor: UIColor(red: 114/255.0, green: 42/255.0, blue: 183/255.0, alpha: 1),
                                    levelEligibleAt: 5,
                                    requiredPartyMembers: []
    )
    
    
    static let Synesthesia = Perk(     name: "Synesthesia",
                                      gameDescription: "When others hear words, you hear music.",
                                      type: .musicalVoices, //types are strings that the game will look for when determining how to behave
                                        price: 750,
                                        meta1: Bundle.main.path(forResource: "1c", ofType: "m4a", inDirectory: "Audio/PerkSynesthesia"),
                                        meta2: Bundle.main.path(forResource: "2c", ofType: "m4a", inDirectory: "Audio/PerkSynesthesia"),
                                        meta3: Bundle.main.path(forResource: "Finala", ofType: "m4a", inDirectory: "Audio/PerkSynesthesia"),
                                        minutesUnlocked: 90,
                                        icon: #imageLiteral(resourceName: "musicNote"),
                                        displayColor: UIColor(red: 255/255.0, green: 111/255.0, blue: 207/255.0, alpha: 0.75),
                                        levelEligibleAt: 5,
                                        requiredPartyMembers: [Characters.Laura]
    )
    
    static let Studybuddy = Perk(     name: "Study Buddy",
                                      gameDescription: "You get more out of each encounter with the help of a friend.",
                                      type: .increasedXP, //types are strings that the game will look for when determining how to behave
                                    price: 55000,
                                    meta1: 2,
                                    meta2: nil,
                                    meta3: nil,
                                    minutesUnlocked: 25,
                                    icon: #imageLiteral(resourceName: "pencil"),
                                    displayColor: UIColor(red: 114/255.0, green: 42/255.0, blue: 183/255.0, alpha: 1),
                                    levelEligibleAt: 5,
                                    requiredPartyMembers: [Characters.Fred]
    )
    
    static let Stacks = Perk(     name: "Stacks",
                                      gameDescription: "You find a way to walk away with more from each encounter.",
                                      type: .increasedScore, //types are strings that the game will look for when determining how to behave
                                        price: 10000,
                                        meta1: 2,
                                        meta2: nil,
                                        meta3: nil,
                                        minutesUnlocked: 15,
                                        icon: #imageLiteral(resourceName: "coin"),
                                        displayColor: UIColor(red: 249/255.0, green: 219/255.0, blue: 0/255.0, alpha: 1),
                                        levelEligibleAt: 5,
                                        requiredPartyMembers: []
    )
    
    static let Doublestacks = Perk(     name: "Double Stacks",
                                      gameDescription: "You find a way to walk away with more from each encounter with the help of a friend.",
                                      type: .increasedScore, //types are strings that the game will look for when determining how to behave
                                        price: 20000,
                                        meta1: 2,
                                        meta2: nil,
                                        meta3: nil,
                                        minutesUnlocked: 30,
                                        icon: #imageLiteral(resourceName: "coin"),
                                        displayColor: UIColor(red: 249/255.0, green: 219/255.0, blue: 0/255.0, alpha: 1),
                                        levelEligibleAt: 5,
                                        requiredPartyMembers: [Characters.Charles]
    )
    
    static let Triplestacks = Perk(     name: "Triple Stacks",
                                        gameDescription: "You find a way to walk away with much more from each encounter with the help of a friend.",
                                        type: .increasedScore, //types are strings that the game will look for when determining how to behave
                                            price: 60000,
                                            meta1: 3,
                                            meta2: nil,
                                            meta3: nil,
                                            minutesUnlocked: 30,
                                            icon: #imageLiteral(resourceName: "coin"),
                                            displayColor: UIColor(red: 249/255.0, green: 219/255.0, blue: 0/255.0, alpha: 1),
                                            levelEligibleAt: 5,
                                            requiredPartyMembers: [Characters.Fred]
    )
    
    static let Closeenough = Perk(     name: "Close Enough",
                                        gameDescription: "You are able to squeak by where others would fail.",
                                        type: .precisionAdjustment, //types are strings that the game will look for when determining how to behave
                                        price: 10000,
                                        meta1: -0.01,
                                        meta2: nil,
                                        meta3: nil,
                                        minutesUnlocked: 10,
                                        icon: #imageLiteral(resourceName: "bullseye"),
                                        displayColor: UIColor(red: 25/255.0, green: 25/255.0, blue: 25/255.0, alpha: 1),
                                        levelEligibleAt: 5,
                                        requiredPartyMembers: [Characters.Matthew]
    )
    
    static let Justabout = Perk(     name: "Just About",
                                       gameDescription: "You are able to get by where others would fail.",
                                       type: .precisionAdjustment, //types are strings that the game will look for when determining how to behave
                                        price: 50000,
                                        meta1: -0.025,
                                        meta2: nil,
                                        meta3: nil,
                                        minutesUnlocked: 10,
                                        icon: #imageLiteral(resourceName: "bullseye"),
                                        displayColor: UIColor(red: 25/255.0, green: 25/255.0, blue: 25/255.0, alpha: 1),
                                        levelEligibleAt: 5,
                                        requiredPartyMembers: [Characters.Matthew]
    )
    
    static let Intheballpark = Perk(     name: "In The Ballpark",
                                     gameDescription: "You are able to squeak by where others would fail.",
                                     type: .precisionAdjustment, //types are strings that the game will look for when determining how to behave
        price: 150000,
        meta1: -0.05,
        meta2: nil,
        meta3: nil,
        minutesUnlocked: 10,
        icon: #imageLiteral(resourceName: "bullseye"),
        displayColor: UIColor(red: 25/255.0, green: 25/255.0, blue: 25/255.0, alpha: 1),
        levelEligibleAt: 5,
        requiredPartyMembers: [Characters.Matthew]
    )
    
    
    
    
    
}
