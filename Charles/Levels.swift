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
    static let Game: [Int:Level] = [1 : Level(level: 1,
                                              levelDescription: "newbie",
                                              xPRequired: 5,
                                              successThreshold: 0.5, punishThreshold: 0.0, canBeLost: false, eligiblePredefinedObjectives: [ColorLibrary.Fundamental], eligibleRandomColorPrecision: nil),
                                    2 : Level(level: 2, levelDescription: "noobie", xPRequired: 5, successThreshold: 0.5, punishThreshold: 0.05, canBeLost: false, eligiblePredefinedObjectives: [ColorLibrary.Fundamental], eligibleRandomColorPrecision: nil),
                                    3 : Level(level: 3, levelDescription: "n00b", xPRequired: 7, successThreshold: 0.55, punishThreshold: 0.10, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Fundamental], eligibleRandomColorPrecision: nil),
                                    4 : Level(level: 4, levelDescription: "nubian", xPRequired: 7, successThreshold: 0.55, punishThreshold: 0.15, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy], eligibleRandomColorPrecision: nil),
                                    5 : Level(level: 5, levelDescription: "knower of n00bs", xPRequired: 9, successThreshold: 0.55, punishThreshold: 0.20, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy], eligibleRandomColorPrecision: nil),
                                    6 : Level(level: 6, levelDescription: "teacher of n00bs", xPRequired: 9, successThreshold: 0.55, punishThreshold: 0.25, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy], eligibleRandomColorPrecision: nil),
                                    7 : Level(level: 7, levelDescription: "leader of n00bs", xPRequired: 10, successThreshold: 0.55, punishThreshold: 0.25, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy], eligibleRandomColorPrecision: nil),
                                    8 : Level(level: 8, levelDescription: "apprentice", xPRequired: 10, successThreshold: 0.55, punishThreshold: 0.25, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: nil),
                                    9 : Level(level: 9, levelDescription: "practiced apprentice", xPRequired: 11, successThreshold: 0.57, punishThreshold: 0.25, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: nil),
                                    10 : Level(level: 10, levelDescription: "studied apprentice", xPRequired: 11, successThreshold: 0.58, punishThreshold: 0.25, canBeLost: false, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: nil),
                                    11 : Level(level: 11, levelDescription: "amateur", xPRequired: 11, successThreshold: 0.59, punishThreshold: 0.25, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: nil),
                                    12 : Level(level: 12, levelDescription: "hobbyist", xPRequired: 11, successThreshold: 0.6, punishThreshold: 0.25, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: nil),
                                    13 : Level(level: 13, levelDescription: "hobbyist the greater", xPRequired: 11, successThreshold: 0.60, punishThreshold: 0.25, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: 1),
                                    14 : Level(level: 14, levelDescription: "enthusiest", xPRequired: 11, successThreshold: 0.60, punishThreshold: 0.25, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: 1),
                                    15 : Level(level: 15, levelDescription: "enthusiastic enthusiest", xPRequired: 11, successThreshold: 0.61, punishThreshold: 0.25, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: 1),
                                    16 : Level(level: 16, levelDescription: "skeptical disciple", xPRequired: 11, successThreshold: 0.62, punishThreshold: 0.27, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: 1),
                                    17 : Level(level: 17, levelDescription: "disciple", xPRequired: 11, successThreshold: 0.63, punishThreshold: 0.30, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: 1),
                                    18 : Level(level: 18, levelDescription: "learned disciple", xPRequired: 11, successThreshold: 0.64, punishThreshold: 0.33, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: 1),
                                    19 : Level(level: 19, levelDescription: "seeing disciple", xPRequired: 11, successThreshold: 0.65, punishThreshold: 0.34, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: 2),
                                    20 : Level(level: 20, levelDescription: "believing disciple", xPRequired: 11, successThreshold: 0.65, punishThreshold: 0.35, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: 2),
                                    21 : Level(level: 21, levelDescription: "belieber", xPRequired: 11, successThreshold: 0.65, punishThreshold: 0.35, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: 2),
                                    22 : Level(level: 22, levelDescription: "apprentice missionary", xPRequired: 11, successThreshold: 0.70, punishThreshold: 0.35, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Fundamental, ColorLibrary.Medium], eligibleRandomColorPrecision: 2),
                                    23 : Level(level: 23, levelDescription: "missionary", xPRequired: 11, successThreshold: 0.70, punishThreshold: 0.35, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Fundamental, ColorLibrary.Medium], eligibleRandomColorPrecision: 2),
                                    24 : Level(level: 24, levelDescription: "devoted missionary", xPRequired: 11, successThreshold: 0.70, punishThreshold: 0.35, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Fundamental, ColorLibrary.Medium], eligibleRandomColorPrecision: 3),
                                    25 : Level(level: 25, levelDescription: "emissary", xPRequired: 11, successThreshold: 0.70, punishThreshold: 0.35, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Fundamental, ColorLibrary.Medium], eligibleRandomColorPrecision: 2),
                                    26 : Level(level: 26, levelDescription: "leading emissary", xPRequired: 11, successThreshold: 0.70, punishThreshold: 0.35, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Fundamental], eligibleRandomColorPrecision: 2),
                                    27 : Level(level: 27, levelDescription: "emissary emeritus", xPRequired: 11, successThreshold: 0.70, punishThreshold: 0.36, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Fundamental], eligibleRandomColorPrecision: 2),
                                    28 : Level(level: 28, levelDescription: "liberator", xPRequired: 11, successThreshold: 0.70, punishThreshold: 0.37, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Fundamental], eligibleRandomColorPrecision: 2),
                                    29 : Level(level: 29, levelDescription: "hero", xPRequired: 11, successThreshold: 0.72, punishThreshold: 0.40, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Fundamental], eligibleRandomColorPrecision: 2),
                                    30 : Level(level: 30, levelDescription: "tycoon", xPRequired: 11, successThreshold: 0.75, punishThreshold: 0.40, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Primary], eligibleRandomColorPrecision: 2),
                                    31 : Level(level: 31, levelDescription: "yogi of mind", xPRequired: 11, successThreshold: 0.80, punishThreshold: 0.50, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Fundamental], eligibleRandomColorPrecision: nil),
                                    32 : Level(level: 32, levelDescription: "yogi of body", xPRequired: 11, successThreshold: 0.80, punishThreshold: 0.50, canBeLost: true, eligiblePredefinedObjectives: [[]], eligibleRandomColorPrecision: 2),
                                    33 : Level(level: 33, levelDescription: "yogi of production", xPRequired: 11, successThreshold: 0.85, punishThreshold: 0.60, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Fundamental], eligibleRandomColorPrecision: 3),
                                    34 : Level(level: 34, levelDescription: "producer", xPRequired: 11, successThreshold: 0.85, punishThreshold: 0.60, canBeLost: true, eligiblePredefinedObjectives: [[]], eligibleRandomColorPrecision: 3),
                                    35 : Level(level: 35, levelDescription: "producer in stride", xPRequired: 11, successThreshold: 0.85, punishThreshold: 0.65, canBeLost: true, eligiblePredefinedObjectives: [[]], eligibleRandomColorPrecision: 3),
                                    36 : Level(level: 36, levelDescription: "aggressive producer", xPRequired: 11, successThreshold: 0.87, punishThreshold: 0.70, canBeLost: true, eligiblePredefinedObjectives: [[]], eligibleRandomColorPrecision: 3),
                                    37 : Level(level: 37, levelDescription: "avid producer", xPRequired: 11, successThreshold: 0.90, punishThreshold: 0.75, canBeLost: true, eligiblePredefinedObjectives: [[]], eligibleRandomColorPrecision: 3),
                                    38 : Level(level: 38, levelDescription: "undisputed producer", xPRequired: 11, successThreshold: 0.92, punishThreshold: 0.80, canBeLost: true, eligiblePredefinedObjectives: [[]], eligibleRandomColorPrecision: 3),
                                    39 : Level(level: 39, levelDescription: "enlightened producer", xPRequired: 11, successThreshold: 0.93, punishThreshold: 0.85, canBeLost: true, eligiblePredefinedObjectives: [[]], eligibleRandomColorPrecision: 3),
                                    40 : Level(level: 40, levelDescription: "human.", xPRequired: 10, successThreshold: 0.95, punishThreshold: 0.90, canBeLost: false, eligiblePredefinedObjectives: [[]], eligibleRandomColorPrecision: 3)]  //can't fall back once you get to 40!
    
    //given an amount of XP the player has, return the level the player is on. (currentLevel, xp towards this level) Returns nil if the player's level is off the charts
    static func getLevelAndProgress(from xp: Int) -> (Level?, Int?) {
        
        var level = 1
        var xPRemaining = xp
        //let currentLevel: Int
        //count up each level until xp number is exceeded
        while level <= Levels.Game.count {
            let xpRequired = Levels.Game[level]?.xPRequired
            if xPRemaining < xpRequired! {
                return (Levels.Game[level], xPRemaining)
            }
            
            xPRemaining = xPRemaining - (Levels.Game[level]?.xPRequired)!
            level = level + 1
        }
        
        //no level found by now, player either has max xp or xp above the standard levels
        //for now, return level 39 with highest progress
        return (Levels.Game[39], 11)
    }
    
}
