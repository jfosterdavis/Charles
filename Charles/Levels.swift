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
    static let Game: [Int:Level] = [1 : Level(levelDescription: "one", xPRequired: 3, canBeLost: false),
                                    2 : Level(levelDescription: "two", xPRequired: 4, canBeLost: false),
                                    3 : Level(levelDescription: "three", xPRequired: 5, canBeLost: false),
                                    4 : Level(levelDescription: "four", xPRequired: 6, canBeLost: true),
                                    5 : Level(levelDescription: "five", xPRequired: 7, canBeLost: true),
                                    6 : Level(levelDescription: "six", xPRequired: 8, canBeLost: true),
                                    7 : Level(levelDescription: "seven", xPRequired: 9, canBeLost: true),
                                    8 : Level(levelDescription: "eight", xPRequired: 10, canBeLost: true),
                                    9 : Level(levelDescription: "nine", xPRequired: 10, canBeLost: true),
                                    10 : Level(levelDescription: "ten", xPRequired: 10, canBeLost: true)]
    
    //given an amount of XP the player has, return the level the player is on.  Returns nil if the player's level is off the charts
    func getLevel(from xp: Int) -> Level? {
        
        var level = 1
        var xPRemaining = xp
        let currentLevel: Int
        //count up each level until xp number is exceeded
        while level <= Levels.Game.count {
            let xpRequired = Levels.Game[level]?.xPRequired
            if xPRemaining < xpRequired! {
                return Levels.Game[level]
            }
            
            xPRemaining = xPRemaining - (Levels.Game[level]?.xPRequired)!
        }
        
        //no level found by now, player either has max xp or xp above the standard levels
        return nil
    }
    
}
