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
    static let Lineup: [Int : Clue] = [2 : ClueNatureOfLight,
                                       3 : ClueNatureOfColors,
                                       4 : ClueNatureOfMan,
                                       6: ClueNatureOfSoul, //5
                                       9: ClueJourney1, //8
                                        14: ClueJourney2, //13
                                       22: Mathematics1, //21
                                        35: Mathematics2, //34
                                        56: Mathematics3, //55
                                        90: Truth //89
    
    
    ]
    
    
    static let ClueNatureOfLight = Clue(clueTitle: "Light",
                            part1: "The absence of light is darkness.  The absence of color is Black.",
                            part1Image: #imageLiteral(resourceName: "WhiteOppositeBlack"),
                            part2: "Zero is Black.  Maximum is White.",
                            part2Image: #imageLiteral(resourceName: "BlackOppositeWhite"),
                            part3: "Do not confuse light with pigment.",
                            part3Image: nil)
    
    static let ClueNatureOfColors = Clue(clueTitle: "Color",
                            part1: "Light is a composite of three primary colors: Red, Green, and Blue.",
                            part1Image: nil,
                            part2: "The absence of all primary color is: zero.  Zero is Black.",
                            part2Image: nil,
                            part3: "The presence of the maximum amount of the primaries is: maximum.  Maximum is White.",
                            part3Image: nil)
    
    static let ClueNatureOfMan = Clue(clueTitle: "Man",
                            part1: "Above is our aspiration.",
                            part1Image: #imageLiteral(resourceName: "ObjectiveCurve"),
                            part2: "Below is our reality.",
                            part2Image: #imageLiteral(resourceName: "StatusCurve"),
                            part3: "Between, we must obtain or reject.",
                            part3Image: #imageLiteral(resourceName: "DifferenceCurve"))
    
    static let ClueNatureOfSoul = Clue(clueTitle: "Soul",
                            part1: "The soul is a fickle thing.",
                            part1Image: nil,
                            part2: "When below, we absorb.",
                            part2Image: #imageLiteral(resourceName: "StatusCurve"),
                            part3: "When above, we shed.",
                            part3Image: #imageLiteral(resourceName: "WhenAbove"))
                            
    
    static let ClueJourney1 = Clue(clueTitle: "Journey",
                           part1: "Every soul must take a journey.",
                           part1Image: #imageLiteral(resourceName: "BeginningOfJourney"),
                           part2: "Achieve: lack nothing.",
                           part2Image: nil,
                            part3: "Nothing is zero.  Zero is Black.  The circle is complete.",
                            part3Image: #imageLiteral(resourceName: "WeLackNothing"))
    
    static let ClueJourney2 = Clue(clueTitle: "Journey",
                                                 part1: "Like all things, a journey is constrained by truth.",
                                                 part1Image: #imageLiteral(resourceName: "BeginningOfJourney"),
                                                 part2: "Completely fail: lack everything.",
                                                 part2Image: nil,
                                                 part3: "Everything is maximum.  Maximum is White.  The circle is broken.",
                                                 part3Image: #imageLiteral(resourceName: "OppositesIcon"))
    
    static let Mathematics1 = Clue(clueTitle: "White",
                           part1: "White is maximum, the ultimate, which cannot be exceeded.",
                           part1Image: nil,
                           part2: "Any color which absorbs White will always become White.",
                           part2Image: nil,
                           part3: "Any color which sheds White will always become Black.",
                           part3Image: nil)
    
    static let Mathematics2 = Clue(clueTitle: "Black",
                                   part1: "Black is zero, nothing, which cannot be reduced.",
                                   part1Image: nil,
                                   part2: "Any color shedding or absorbing Black will remain unchanged.",
                                   part2Image: nil,
                                   part3: "Something cannot be impacted by nothing.",
                                   part3Image: nil)
    
    static let Mathematics3 = Clue(clueTitle: "Primaries",
                                   part1: "A color absorbing a primary will always become (or remain) a color with the maximum of this primary.",
                                   part1Image: nil,
                                   part2: "A color shedding a primary will always become void of this primary.",
                                   part2Image: nil,
                                   part3: nil,
                                   part3Image: nil)
    
    static let Truth = Clue(clueTitle: "Truth",
                                   part1: "Truth is not negotiable.",
                                   part1Image: nil,
                                   part2: "You will either achieve your goal, or you will not. Green and Blue cannot ever be Black.",
                                   part2Image: nil,
                                   part3: "You can choose to ignore the truth, but you will always be subject to the truth.",
                                   part3Image: nil)
    
}
