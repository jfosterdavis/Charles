//
//  Levels.swift
//  Charles
//
//  Created by Jacob Foster Davis on 5/27/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation


///Holds all of the Levels

struct Levels {
    
    //static let valid: [Level] = []
    ///All levels in the order for the game
    static let Game: [Int:Level] = [1 : Level(level: 1, levelDescription: "newbie", xPRequired: 3, successThreshold: 0.5, punishThreshold: 0.0, canBeLost: false),
                                    2 : Level(level: 2, levelDescription: "n00b", xPRequired: 4, successThreshold: 0.5, punishThreshold: 0.05, canBeLost: false),
                                    3 : Level(level: 3, levelDescription: "noobie", xPRequired: 4, successThreshold: 0.5, punishThreshold: 0.06, canBeLost: false),
                                    4 : Level(level: 4, levelDescription: "nubian", xPRequired: 4, successThreshold: 0.5, punishThreshold: 0.07, canBeLost: true),
                                    5 : Level(level: 5, levelDescription: "knower of n00bs", xPRequired: 5, successThreshold: 0.5, punishThreshold: 0.10, canBeLost: true),
                                    6 : Level(level: 6, levelDescription: "leader of n00bs", xPRequired: 5, successThreshold: 0.5, punishThreshold: 0.10, canBeLost: true),
                                    7 : Level(level: 7, levelDescription: "teacher of n00bs", xPRequired: 5, successThreshold: 0.6, punishThreshold: 0.10, canBeLost: true),
                                    8 : Level(level: 8, levelDescription: "apprentice", xPRequired: 6, successThreshold: 0.6, punishThreshold: 0.15, canBeLost: true),
                                    9 : Level(level: 9, levelDescription: "practiced apprentice", xPRequired: 6, successThreshold: 0.6, punishThreshold: 0.15, canBeLost: true),
                                    10 : Level(level: 10, levelDescription: "studied apprentice", xPRequired: 6, successThreshold: 0.6, punishThreshold: 0.15, canBeLost: false),
                                    11 : Level(level: 11, levelDescription: "amateur", xPRequired: 6, successThreshold: 0.6, punishThreshold: 0.20, canBeLost: true),
                                    12 : Level(level: 12, levelDescription: "hobbyist", xPRequired: 7, successThreshold: 0.6, punishThreshold: 0.20, canBeLost: true),
                                    13 : Level(level: 13, levelDescription: "hobbyist the greater", xPRequired: 7, successThreshold: 0.65, punishThreshold: 0.20, canBeLost: true),
                                    14 : Level(level: 14, levelDescription: "enthusiest", xPRequired: 7, successThreshold: 0.65, punishThreshold: 0.25, canBeLost: true),
                                    15 : Level(level: 15, levelDescription: "enthusiastic enthusiest", xPRequired: 7, successThreshold: 0.65, punishThreshold: 0.25, canBeLost: true),
                                    16 : Level(level: 16, levelDescription: "skeptical disciple", xPRequired: 8, successThreshold: 0.70, punishThreshold: 0.25, canBeLost: true),
                                    17 : Level(level: 17, levelDescription: "disciple", xPRequired: 8, successThreshold: 0.70, punishThreshold: 0.30, canBeLost: true),
                                    18 : Level(level: 18, levelDescription: "learned disciple", xPRequired: 8, successThreshold: 0.70, punishThreshold: 0.30, canBeLost: true),
                                    19 : Level(level: 19, levelDescription: "seeing disciple", xPRequired: 8, successThreshold: 0.70, punishThreshold: 0.30, canBeLost: true),
                                    20 : Level(level: 20, levelDescription: "believing disciple", xPRequired: 9, successThreshold: 0.70, punishThreshold: 0.35, canBeLost: true),
                                    21 : Level(level: 21, levelDescription: "belieber", xPRequired: 9, successThreshold: 0.75, punishThreshold: 0.35, canBeLost: true),
                                    22 : Level(level: 22, levelDescription: "apprentice missionary", xPRequired: 9, successThreshold: 0.75, punishThreshold: 0.35, canBeLost: true),
                                    23 : Level(level: 23, levelDescription: "missionary", xPRequired: 9, successThreshold: 0.75, punishThreshold: 0.35, canBeLost: true),
                                    24 : Level(level: 24, levelDescription: "devoted missionary", xPRequired: 10, successThreshold: 0.75, punishThreshold: 0.35, canBeLost: true),
                                    25 : Level(level: 25, levelDescription: "emissary", xPRequired: 10, successThreshold: 0.75, punishThreshold: 0.35, canBeLost: true),
                                    26 : Level(level: 26, levelDescription: "leading emissary", xPRequired: 10, successThreshold: 0.85, punishThreshold: 0.37, canBeLost: true),
                                    27 : Level(level: 27, levelDescription: "emissary emeritus", xPRequired: 10, successThreshold: 0.85, punishThreshold: 0.37, canBeLost: true),
                                    28 : Level(level: 28, levelDescription: "chief", xPRequired: 10, successThreshold: 0.85, punishThreshold: 0.37, canBeLost: true),
                                    29 : Level(level: 29, levelDescription: "liberator", xPRequired: 10, successThreshold: 0.85, punishThreshold: 0.40, canBeLost: true),
                                    30 : Level(level: 30, levelDescription: "tycoon", xPRequired: 10, successThreshold: 0.85, punishThreshold: 0.40, canBeLost: true),
                                    31 : Level(level: 31, levelDescription: "yogi of mind", xPRequired: 10, successThreshold: 0.90, punishThreshold: 0.50, canBeLost: true),
                                    32 : Level(level: 32, levelDescription: "yogi of body", xPRequired: 10, successThreshold: 0.90, punishThreshold: 0.55, canBeLost: true),
                                    33 : Level(level: 33, levelDescription: "yogi of production", xPRequired: 10, successThreshold: 0.95, punishThreshold: 0.60, canBeLost: true),
                                    34 : Level(level: 34, levelDescription: "producer", xPRequired: 10, successThreshold: 0.95, punishThreshold: 0.65, canBeLost: true),
                                    35 : Level(level: 35, levelDescription: "producer in stride", xPRequired: 10, successThreshold: 1, punishThreshold: 0.70, canBeLost: true),
                                    36 : Level(level: 36, levelDescription: "aggressive producer", xPRequired: 10, successThreshold: 1, punishThreshold: 0.80, canBeLost: true),
                                    37 : Level(level: 37, levelDescription: "avid producer", xPRequired: 10, successThreshold: 1, punishThreshold: 0.90, canBeLost: true),
                                    38 : Level(level: 38, levelDescription: "undisputed producer", xPRequired: 10, successThreshold: 1, punishThreshold: 0.95, canBeLost: true),
                                    39 : Level(level: 39, levelDescription: "enlightened producer", xPRequired: 10, successThreshold: 1, punishThreshold: 1, canBeLost: true),
                                    40 : Level(level: 40, levelDescription: "human.", xPRequired: 10, successThreshold: 1, punishThreshold: 1, canBeLost: false)]  //can't fall back once you get to 40!
    
    //given an amount of XP the player has, return the level the player is on.  Returns nil if the player's level is off the charts
    static func getLevel(from xp: Int) -> Level? {
        
        var level = 1
        var xPRemaining = xp
        //let currentLevel: Int
        //count up each level until xp number is exceeded
        while level <= Levels.Game.count {
            let xpRequired = Levels.Game[level]?.xPRequired
            if xPRemaining < xpRequired! {
                return Levels.Game[level]
            }
            
            xPRemaining = xPRemaining - (Levels.Game[level]?.xPRequired)!
            level = level + 1
        }
        
        //no level found by now, player either has max xp or xp above the standard levels
        return nil
    }
    
}
