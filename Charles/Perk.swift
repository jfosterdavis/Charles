//
//  Perk.swift
//  Charles
//
//  Created by Jacob Foster Davis on 5/29/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation
import UIKit

/******************************************************/
/*******************///MARK: Perks are things the player can unlock and get bonuses in the game.  e.g. double points.  They are unlocked for an amount of time.
/******************************************************/

enum PerkType {
    case increasedXP
    case increasedScore
    case visualizeColorValues
    case musicalVoices
    case precisionAdjustment
    case investment
    case adaptClothing
}

class Perk: NSObject {
    
    var name: String
    var gameDescription: String
    var type: PerkType //types are strings that the game will look for when determining how to behave
    var price: Int
    var meta1: Any?
    var meta2: Any?
    var meta3: Any?
    var minutesUnlocked: Int
    var icon: UIImage
    var displayColor: UIColor
    var levelEligibleAt: Int? //nil if there is no level requirement
    var requiredPartyMembers: [Character]!
    
    
    // MARK: Initializers
    init(name: String!,
        gameDescription: String!,
        type: PerkType!, //types are strings that the game will look for when determining how to behave
        price: Int!,
        meta1: Any?,
        meta2: Any?,
        meta3: Any?,
        minutesUnlocked: Int!,
        icon: UIImage!,
        displayColor: UIColor!,
        levelEligibleAt: Int?,
        requiredPartyMembers: [Character]) {
        
        
        
        self.name = name
        self.gameDescription = gameDescription
        self.type = type
        self.price = price
        self.meta1 = meta1
        self.meta2 = meta2
        self.meta3 = meta3
        self.minutesUnlocked = minutesUnlocked
        self.icon = icon
        self.displayColor = displayColor
        self.levelEligibleAt = levelEligibleAt
        self.requiredPartyMembers = requiredPartyMembers
        
        super.init()
    }
    
    
    /******************************************************/
    /*******************///MARK: Functions
    /******************************************************/

    
}
