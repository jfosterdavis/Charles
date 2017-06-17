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
                                       5 : ClueNatureOfMan,
                                       8: ClueNatureOfYoungSoul,
                                       13: ClueNatureOfAdolescentSoul,
                                       21: ClueNatureOfMathematics
    
    
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
                            part2: "The absence of all primary color - Red, Green, and Blue - is: zero.  Zero is Black.",
                            part2Image: nil,
                            part3: "The presence of the maximum amount of Red, Green, and Blue is: maximum.  Maximum is White.",
                            part3Image: nil)
    
    static let ClueNatureOfMan = Clue(clueTitle: "The Nature of Man",
                            part1: "Above is what we aspire to be.",
                            part1Image: #imageLiteral(resourceName: "ObjectiveCurve"),
                            part2: "Below is what we are.",
                            part2Image: #imageLiteral(resourceName: "StatusCurve"),
                            part3: "Between is what we must achieve or reject.",
                            part3Image: #imageLiteral(resourceName: "DifferenceCurve"))
    
    static let ClueNatureOfYoungSoul = Clue(clueTitle: "The Nature of Young Soul",
                            part1: "The soul is a fickle thing.  It's perspective determines the impact of our actions.",
                            part1Image: nil,
                            part2: "When below, we absorb.  We catch that which acts upon us.",
                            part2Image: #imageLiteral(resourceName: "StatusCurve"),
                            part3: "When above, we shed.  We discard that which acts upon us.",
                            part3Image: #imageLiteral(resourceName: "WhenAbove"))
                            
    
    static let ClueNatureOfAdolescentSoul = Clue(clueTitle: "The Nature of Adolescent Soul",
                           part1: "Every soul must take a journey.  To succeed, it must know the aspiration and the obstacle.",
                           part1Image: #imageLiteral(resourceName: "BeginningOfJourney"),
                           part2: "When we achieve that which we aspire to achieve, we lack nothing.  Nothing is zero.  Zero is Black.  The circle is complete.",
                           part2Image: #imageLiteral(resourceName: "WeLackNothing"),
                            part3: "When we completely fail to achieve what we must achieve, we lack everything.  Everything is maximum.  Maximum is White.  The circle is broken; the White light burns through our core as a testiment of the everything we lack.",
                            part3Image: #imageLiteral(resourceName: "OppositesIcon"))
    
    static let ClueNatureOfMathematics = Clue(clueTitle: "The Nature of Mathematics",
                           part1: "White is maximum, the ultimate, which cannot be exceeded.  Any color which absorbs White will always become White.  Any color which sheds White will always become Black.",
                           part1Image: nil,
                           part2: "Black is zero, nothingness, which cannot be reduced.  Any color shedding or absorbing Black will remain unchanged - for something cannot be impacted by nothing.",
                           part2Image: nil,
                           part3: "A color absorbing any primary will always become (or remain) a color with the maximum of this primary.  A color shedding any primary will always become void of all traces of this primary.",
                           part3Image: nil)
    
}
