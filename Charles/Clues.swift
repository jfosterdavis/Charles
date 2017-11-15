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
                                       5: ClueNatureOfSoul, //5
                                       6: ClueJourney1, //8
                                        7: ClueJourney2, //13
                                       8: Mathematics1, //21
                                        9: Mathematics2, //34
                                        10: Mathematics3, //55
        25: TheFaithful, //25
        35: YouKnow, //35
        45: TheKnowing, //45
        55: Identity, //55
        75: Trace, //75
        
                                        90: Truth, //89
        120: Voluntary //120
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
    
    
    /******************************************************/
    /*******************///MARK: Advaced clues
    /******************************************************/

    static let Truth = Clue(clueTitle: "Truth",
                                   part1: "Truth is not negotiable.",
                                   part1Image: nil,
                                   part2: "You will either achieve your goal, or you will not. Green and Blue cannot ever be Black.",
                                   part2Image: nil,
                                   part3: "You can choose to ignore the truth, but you will always be subject to the truth.",
                                   part3Image: nil)
    
    static let Voluntary = Clue(clueTitle: "Only the Voluntary",
                            part1: "If I do not consent, I am forced.  I am right to defend myself.",
                            part1Image: nil,
                            part2: "If you do not consent, you are forced.  You should defend yourself.",
                            part2Image: nil,
                            part3: "If we both consent, we must defend ourselves from those who would prevent our cooperation.",
                            part3Image: nil)
    
    static let YouKnow = Clue(clueTitle: "You do know.",
                                part1: "They would have you believe that \"you don't know\"",
                                part1Image: nil,
                                part2: "But, you do know, don't you?  You have eyes, ears, a brain.",
                                part2Image: nil,
                                part3: "You do not fear knowledge.  You do not fear imperfect knowledge.",
                                part3Image: nil)
    
    static let TheFaithful = Clue(clueTitle: "Faith",
                                  part1: "Have faith; believe in that which you cannot observe.",
                              part1Image: nil,
                              part2: "And now, fear.",
                              part2Image: nil,
                              part3: "Fear, because each lesson you learn threatens to shatter your faith.",
                              part3Image: nil)
    
    static let TheKnowing = Clue(clueTitle: "Observe",
                                  part1: "Seek truth; believe only that which you can observe.",
                                  part1Image: nil,
                                  part2: "And now, be fearless.",
                                  part2Image: nil,
                                  part3: "Be fearless, because each lesson you learn refines your understanding of the whole.",
                                  part3Image: nil)
    
    static let Trace = Clue(clueTitle: "Trace",
                                 part1: "Each lesson builds upon the other, or refutes another.",
                                 part1Image: nil,
                                 part2: "Trace each lesson back to fundamental truths.",
                                 part2Image: nil,
                                 part3: "If it cannot be traced or cannot hold true, discard.",
                                 part3Image: nil)
    
    static let Identity = Clue(clueTitle: "Identity",
                            part1: "It is the thing you must face and you cannot avoid.",
                            part1Image: nil,
                            part2: "It is not to be feared; not to be ignored. It is only to be embraced.",
                            part2Image: nil,
                            part3: "Existence exists.  Facts are facts.  A is A.",
                            part3Image: nil)
    
}
