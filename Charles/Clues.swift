//
//  Clues.swift
//  Charles
//
//  Created by Jacob Foster Davis on 6/16/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation
import UIKit

/******************************************************/
/*******************///MARK: holds all of the clues
/******************************************************/


struct Clues {
    
    ///the lineup is an array of dictionaries, where the key is the level at which the user should be presented with the associated clue.
    static let Lineup: [Int : Clue] = [16 : Clue1
    
    
    ]
    
    
    static let Clue1 = Clue(clueTitle: "The Nature of Light",
                            part1: "The absence of light is darkness",
                            part1Image: #imageLiteral(resourceName: "coin_100000Icon"),
                            part2: "All light is a composite of three primary colors: Red, Green, and Blue.",
                            part2Image: #imageLiteral(resourceName: "coin_1MIcon"),
                            part3: "All colors can be descriged by the amount of each of the primary colors they contain.",
                            part3Image: #imageLiteral(resourceName: "coin_1500Icon"))
    
}
