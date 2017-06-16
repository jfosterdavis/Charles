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
                                       4 : ClueNatureOfColors,
                                       6 : ClueNatureOfMan,
                                       10: ClueNatureOfSoul,
                                       16: ClueNatureOfMathematics
    
    
    ]
    
    
    static let ClueNatureOfLight = Clue(clueTitle: "The Nature of Light",
                            part1: "The absence of light is darkness.",
                            part1Image: #imageLiteral(resourceName: "WhiteOppositeBlack"),
                            part2: "The opposite of Black is White.",
                            part2Image: #imageLiteral(resourceName: "BlackOppositeWhite"),
                            part3: "Do not confuse light with pigment, where opposite rules apply.",
                            part3Image: nil)
    
    static let ClueNatureOfColors = Clue(clueTitle: "The Nature of Color",
                            part1: "All light is a composite of three primary colors: Red, Green, and Blue.",
                            part1Image: nil,
                            part2: "The absence of all Red, Green, and Blue is black.",
                            part2Image: nil,
                            part3: "The presence of the most Red, most Green, and most Blue is White.",
                            part3Image: nil)
    
    static let ClueNatureOfMan = Clue(clueTitle: "The Nature of Man",
                            part1: "Above is what we aspire to be.",
                            part1Image: #imageLiteral(resourceName: "ObjectiveCurve"),
                            part2: "Below is what we are.",
                            part2Image: #imageLiteral(resourceName: "StatusCurve"),
                            part3: "Between is what we must achieve or reject.",
                            part3Image: #imageLiteral(resourceName: "DifferenceCurve"))
    
    static let ClueNatureOfSoul = Clue(clueTitle: "The Nature of Soul",
                            part1: "When below, we absorb our actions.",
                            part1Image: #imageLiteral(resourceName: "StatusCurve"),
                            part2: "When above, we shed our actions.",
                            part2Image: #imageLiteral(resourceName: "WhenAbove"),
                            part3: "When we achieve our aspiration, we lack nothing.  Nothing is zero.  Zero is black.",
                            part3Image: #imageLiteral(resourceName: "WeLackNothing"))
    
    static let ClueNatureOfMathematics = Clue(clueTitle: "The Nature of Mathematics",
                                       part1: "White is maximum, the ultimate, which cannot be exceeded.  White, plus any color, will always be White.",
                                       part1Image: nil,
                                       part2: "Black is zero, nothingness, which cannot be reduced.  Any color, plus or minus Black, will remain unchanged.",
                                       part2Image: nil,
                                       part3: "When White is removed from any color, the result will always be Black.",
                                       part3Image: nil)
    
}
