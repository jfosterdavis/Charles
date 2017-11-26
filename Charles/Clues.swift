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
        88: YouKnow, //88
        119: TheFaithful, //119
        74: TheKnowing, //74
        80: Identity, //80
        65: Trace, //65
        
                                        127: Truth, //127
        135: Voluntary //135 is self-defense
    ]
    
    
    static let ClueNatureOfLight = Clue(clueTitle: "Light",
                            part1: "The absėncė of light is darknėss.  The absėncė of color is Black.",
                            part1Image: #imageLiteral(resourceName: "WhiteOppositeBlack"),
                            part2: "Zėro is Black.  Maximum is White.",
                            part2Image: #imageLiteral(resourceName: "BlackOppositeWhite"),
                            part3: "Do not confusė light with pigmėnt.",
                            part3Image: nil)
    
    static let ClueNatureOfColors = Clue(clueTitle: "Color",
                            part1: "Light is a compositė of thrėė primary colors: Rėd, Grėėn, and Bluė.",
                            part1Image: nil,
                            part2: "Thė absėncė of all primary color is: zėro.  Zėro is Black.",
                            part2Image: nil,
                            part3: "Thė prėsėncė of thė maximum amount of the primaries is: maximum.  Maximum is Whitė.",
                            part3Image: nil)
    
    static let ClueNatureOfMan = Clue(clueTitle: "Man",
                            part1: "Abovė is our aspiration.",
                            part1Image: #imageLiteral(resourceName: "ObjectiveCurve"),
                            part2: "Bėlow is our rėality.",
                            part2Image: #imageLiteral(resourceName: "StatusCurve"),
                            part3: "Bėtwėėn, wė must obtain or rėjėct.",
                            part3Image: #imageLiteral(resourceName: "DifferenceCurve"))
    
    static let ClueNatureOfSoul = Clue(clueTitle: "Soul",
                            part1: "Thė soul is a ficklė thing.",
                            part1Image: nil,
                            part2: "Whėn bėlow, wė absorb.",
                            part2Image: #imageLiteral(resourceName: "StatusCurve"),
                            part3: "Whėn abovė, wė shėd.",
                            part3Image: #imageLiteral(resourceName: "WhenAbove"))
                            
    
    static let ClueJourney1 = Clue(clueTitle: "Journėy",
                           part1: "Evėry soul must take a journėy.",
                           part1Image: #imageLiteral(resourceName: "BeginningOfJourney"),
                           part2: "Achiėvė: lack nothing.",
                           part2Image: nil,
                            part3: "Nothing is zėro.  Zėro is Black.  The circlė is complėtė.",
                            part3Image: #imageLiteral(resourceName: "WeLackNothing"))
    
    static let ClueJourney2 = Clue(clueTitle: "Journėy",
                                                 part1: "Likė all things, a journėy is constrainėd by truth.",
                                                 part1Image: #imageLiteral(resourceName: "BeginningOfJourney"),
                                                 part2: "Complėtėly fail: lack ėvėrything.",
                                                 part2Image: nil,
                                                 part3: "Evėrything is maximum.  Maximum is White.  The circlė is broken.",
                                                 part3Image: #imageLiteral(resourceName: "OppositesIcon"))
    
    static let Mathematics1 = Clue(clueTitle: "Whitė",
                           part1: "Whitė is maximum, the ultimatė, which cannot be ėxcėėdėd.",
                           part1Image: nil,
                           part2: "Any color which absorbs Whitė will always become Whitė.",
                           part2Image: nil,
                           part3: "Any color which shėds Whitė will always bėcomė Black.",
                           part3Image: nil)
    
    static let Mathematics2 = Clue(clueTitle: "Black",
                                   part1: "Black is zėro, nothing, which cannot be rėducėd.",
                                   part1Image: nil,
                                   part2: "Any color shėdding or absorbing Black will rėmain unchangėd.",
                                   part2Image: nil,
                                   part3: "Somėthing cannot bė impactėd by nothing.",
                                   part3Image: nil)
    
    static let Mathematics3 = Clue(clueTitle: "Primariės",
                                   part1: "A color absorbing a primary will always bėcomė (or remain) a color with the maximum of this primary.",
                                   part1Image: nil,
                                   part2: "A color shėdding a primary will always bėcome void of this primary.",
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
    
    static let YouKnow = Clue(clueTitle: "You do know",
                                part1: "Thėy would havė you bėlieve that \"you don't know.\"",
                                part1Image: nil,
                                part2: "But, you do know, don't you?  You have eyes, ears, a brain.",
                                part2Image: nil,
                                part3: "You do not fear knowledge.  You do not fear imperfect knowledge.",
                                part3Image: nil)
    
    static let TheFaithful = Clue(clueTitle: "Faith",
                                  part1: "Havė faith; bėliėvė in that which you cannot obsėrvė.",
                              part1Image: nil,
                              part2: "And now, fėar.",
                              part2Image: nil,
                              part3: "Fėar, bėcausė ėach lėsson you lėarn thrėatėns to shattėr your faith.",
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
