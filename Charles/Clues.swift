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
                                       8: ClueNatureOfYoungSoul, //8
                                       13: ClueNatureOfAdolescentSoul, //13
                                       21: Mathematics1, //21
                                        34: Mathematics2, //34
                                        55: Mathematics3 //55
    
    
    ]
    
    
    static let ClueNatureOfLight = Clue(clueTitle: "Light",
                            part1: "The absence of light is darkness.  The absence of color is Black.",
                            part1Image: #imageLiteral(resourceName: "WhiteOppositeBlack"),
                            part2: "Zero is Black.  Maximum is White.",
                            part2Image: #imageLiteral(resourceName: "BlackOppositeWhite"),
                            part3: "Light is not pigment. There, opposite rules apply.",
                            part3Image: nil)
    
    static let ClueNatureOfColors = Clue(clueTitle: "Color",
                            part1: "All light is a composite of three primary colors: Red, Green, and Blue.",
                            part1Image: nil,
                            part2: "The absence of all primary color - Red, Green, and Blue - is: zero.  Zero is Black.",
                            part2Image: nil,
                            part3: "The presence of the maximum amount of Red, Green, and Blue is: maximum.  Maximum is White.",
                            part3Image: nil)
    
    static let ClueNatureOfMan = Clue(clueTitle: "Man",
                            part1: "Above is what we aspire to be.",
                            part1Image: #imageLiteral(resourceName: "ObjectiveCurve"),
                            part2: "Below is what we are.",
                            part2Image: #imageLiteral(resourceName: "StatusCurve"),
                            part3: "Between is what we must obtain or reject.",
                            part3Image: #imageLiteral(resourceName: "DifferenceCurve"))
    
    static let ClueNatureOfYoungSoul = Clue(clueTitle: "Soul",
                            part1: "The soul is a fickle thing.  Perspective determines the impact of actions.",
                            part1Image: nil,
                            part2: "When below, we absorb.  We catch that which acts upon us.",
                            part2Image: #imageLiteral(resourceName: "StatusCurve"),
                            part3: "When above, we shed.  We discard that which acts upon us.",
                            part3Image: #imageLiteral(resourceName: "WhenAbove"))
                            
    
    static let ClueNatureOfAdolescentSoul = Clue(clueTitle: "Soul",
                           part1: "Every soul must take a journey.  To achieve, it must know the aspiration and the obstacle.",
                           part1Image: #imageLiteral(resourceName: "BeginningOfJourney"),
                           part2: "Achieve, and lack nothing.  Nothing is zero.  Zero is Black.  The circle is complete.",
                           part2Image: #imageLiteral(resourceName: "WeLackNothing"),
                            part3: "Completely fail, and lack everything.  Everything is maximum.  Maximum is White.  The circle is broken.",
                            part3Image: #imageLiteral(resourceName: "OppositesIcon"))
    
    static let Mathematics1 = Clue(clueTitle: "White",
                           part1: "White is maximum, the ultimate, which cannot be exceeded.",
                           part1Image: nil,
                           part2: "Any color which absorbs White will always become White.",
                           part2Image: nil,
                           part3: "Any color which sheds White will always become Black.",
                           part3Image: nil)
    
    static let Mathematics2 = Clue(clueTitle: "Black",
                                   part1: "Black is zero, nothingness, which cannot be reduced.",
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
    
}
