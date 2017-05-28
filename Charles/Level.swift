//
//  Level.swift
//  Charles
//
//  Created by Jacob Foster Davis on 5/27/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation

/**
 A Level object contains information about a certain level of difficulty
 
 - Objects:
 - level: an int of the level this is in the game
 - levelDescription: a string describing the level
 - xPRequired: amount of XP required to complete the level
 - successThreshold: Float between 0 and 1 denoting percent of a perfect score that must be achieved to earn XP in this level
 - punishThreshold: float between 0 and 1 denoting the percent of a perfect score below or at which the user is penalized XP
 - canBeLost: Bool if the level can be lost if the user looses too much XP from higher levels
 */
class Level: NSObject {
    
    var level: Int!
    var levelDescription: String!
    var xPRequired: Int! //an array of phrase objects
    var successThreshold: Float!
    var punishThreshold: Float!
    var canBeLost: Bool! //radius of the corners on top
    
    // MARK: Initializers
    init(level: Int, levelDescription: String, xPRequired: Int, successThreshold: Float, punishThreshold: Float, canBeLost: Bool) {
        super.init()
        
        self.level = level
        self.levelDescription = levelDescription
        self.xPRequired = xPRequired
        self.successThreshold = successThreshold
        self.punishThreshold = punishThreshold
        self.canBeLost = canBeLost
    }
}
