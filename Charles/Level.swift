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
 - levelDescription: a string describing the level
 - xPRequired: amount of XP required to complete the level
 - canBeLost: Bool if the level can be lost if the user looses too much XP from higher levels
 */
class Level: NSObject {
    
    var levelDescription: String!
    var xPRequired: Int! //an array of phrase objects
    var canBeLost: Bool! //radius of the corners on top
    
    // MARK: Initializers
    init(levelDescription: String, xPRequired: Int, canBeLost: Bool) {
        super.init()
        
        self.levelDescription = levelDescription
        self.xPRequired = xPRequired
        self.canBeLost = canBeLost
    }
}
