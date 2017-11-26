//
//  Perks.swift
//  Charles
//
//  Created by Jacob Foster Davis on 5/29/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation
import UIKit

/******************************************************/
/*******************///MARK: Defines and holds all perks in the game
/******************************************************/


struct Perks {
    
    /******************************************************/
    /*******************///MARK: Patterns and trends
    //Roberte can unlock almost every perk, except for the highest level perks, of those s/he imitates.  This makes Roberte very handy.
    //John is the only one who can unlock Emeritus. He can also unlock highest level of insight. This makes John possibly the only one who can allow player to win the game.
    //Laura and John only can unlock Synesthesia
    //Charles and Fred are same price and level, need both (unless Roberte) to unlock all Stacks perks
    //Stanly and Jr. are required to get most out of Insight (unless Roberte)
    //Matthew and Charles are only that can get In the Ballpark
    //
    //Synesthesia designed to be low cost and last long enough to not annoy the user.  This is really for users that hate the annoying voices!  Higher levels give much longer duration.
    //Insight allows player to see the stickView which shows colors in a physical form.  Colorblind users may like this.  Designed to be not to expensive and easy to obtain. higher levels get up to 1 week
    //Study increases XP gained from each successful match.  Expensive and slow to obtain.  They stack additively, so a user that has all unlocked could get +6 (=7) xp each time they succeed.  Highest level very expensive and hard to obtain.  Highest level only unlockable at high character level because it requires John
    //Stacks gives multiplicative bonuses to score, which stack. Player could get up to 12X score each time.  Short duration.  Lowe levels easy to obtain, higher levels not as easy.
    //Closeenough reduces the precision requirements to progress in a level.  Higher levels require so much precision they will be near impossible without this perk.  lower levels easy to obtain and have a mild duration.  Higher levels very expensive and short duration.
    /******************************************************/

    
    static let ValidPerks:[Perk] = [
                                    Stacks,
                                    Synesthesia,
                                    Study,
                                    Insight,
                                    Closeenough,
                                    Adaptation,
                                    Synesthesia2,
                                    Adaptation2,
                                    Insight2,
                                    Closeenough2,
                                    Stacks2,
                                    Study2,
                                    Stacks3,
                                    Closeenough3,
                                    Adaptation3,
                                    Stacks4,
                                    Insight3,
                                    Study3,
                                    Synesthesia3,
                                    Adaptation4,
                                    Stacks5,
                                    Study4,
                                    Closeenough4
                                    ]
    
    static let UnlockablePerks:[Perk] = [
                                    Stacks,
                                    Synesthesia,
                                    Study,
                                    Insight,
                                    Closeenough,
                                    Adaptation,
                                    Synesthesia2,
                                    Adaptation2,
                                    Insight2,
                                    Closeenough2,
                                    Stacks2,
                                    Study2,
                                    Stacks3,
                                    Closeenough3,
                                    Adaptation3,
                                    Stacks4,
                                    Insight3,
                                    Study3,
                                    Synesthesia3,
                                    Adaptation4,
                                    Stacks5,
                                    Study4,
                                    Closeenough4
                                    ]
    
    /******************************************************/
    /*******************///MARK: Synesthesia
    /******************************************************/
    
    
    
    static let Synesthesia = Perk(     name: "Synėsthėsia",
                                       gameDescription: "Whėn othėrs hėar words, you hėar music.",
                                       type: .musicalVoices, //types are strings that the game will look for when determining how to behave
        price: 750,
        meta1: Bundle.main.path(forResource: "1c", ofType: "m4a", inDirectory: "Audio/PerkSynesthesia"),
        meta2: Bundle.main.path(forResource: "2c", ofType: "m4a", inDirectory: "Audio/PerkSynesthesia"),
        meta3: Bundle.main.path(forResource: "2c", ofType: "m4a", inDirectory: "Audio/PerkSynesthesia"),
        minutesUnlocked: 30, //30
        icon: #imageLiteral(resourceName: "musicNote"),
        displayColor: UIColor(red: 255/255.0, green: 182/255.0, blue: 249/255.0, alpha: 0.75),
        levelEligibleAt: 6, //6
        requiredPartyMembers: [Characters.Laura, Characters.R0berte]
    )
    
    static let Synesthesia2 = Perk(     name: "Synėsthetic",
                                        gameDescription: "You try your hardėst not to listėn, and you hėar only music.",
                                        type: .musicalVoices, //types are strings that the game will look for when determining how to behave
        price: 2500,
        meta1: Bundle.main.path(forResource: "1c", ofType: "m4a", inDirectory: "Audio/PerkSynesthesia"),
        meta2: Bundle.main.path(forResource: "2c", ofType: "m4a", inDirectory: "Audio/PerkSynesthesia"),
        meta3: Bundle.main.path(forResource: "Finala", ofType: "m4a", inDirectory: "Audio/PerkSynesthesia"),
        minutesUnlocked: 7200, //5 days, 7200
        icon: #imageLiteral(resourceName: "musicNote"),
        displayColor: UIColor(red: 255/255.0, green: 182/255.0, blue: 249/255.0, alpha: 0.75),
        levelEligibleAt: 18,
        requiredPartyMembers: [Characters.Laura, Characters.R0berte]
    )
    
    static let Synesthesia3 = Perk(     name: "Synėsthetė",
                                        gameDescription: "It sėėms likė you havė always only hėard music.",
                                        type: .musicalVoices, //types are strings that the game will look for when determining how to behave
        price: 25000,
        meta1: Bundle.main.path(forResource: "1c", ofType: "m4a", inDirectory: "Audio/PerkSynesthesia"),
        meta2: Bundle.main.path(forResource: "2c", ofType: "m4a", inDirectory: "Audio/PerkSynesthesia"),
        meta3: Bundle.main.path(forResource: "Finala", ofType: "m4a", inDirectory: "Audio/PerkSynesthesia"),
        minutesUnlocked: 57600, //40 days, 57600
        icon: #imageLiteral(resourceName: "musicNote"),
        displayColor: UIColor(red: 255/255.0, green: 182/255.0, blue: 249/255.0, alpha: 0.75),
        levelEligibleAt: 75, //75
        requiredPartyMembers: [Characters.Laura, Characters.R0berte]
    )
    
    /******************************************************/
    /*******************///MARK: Adaptation
    /******************************************************/
    //Adaptation stacks, except forks which takes the lowest fork for all active values
    
    
    
    static let Adaptation = Perk(     name: "Adjust",
                                       gameDescription: "Allows your companions to modėstly adapt to the challėnge at hand.",
                                       type: .adaptClothing, //types are strings that the game will look for when determining how to behave
        price: 1000, //1000
        meta1: 0.20, //portion of slots to adjust
        meta2: 3, //number of forks for a good move
        meta3: 0.40, //likelihood a good move option will prevail over a random
        minutesUnlocked: 45, //45
        icon: #imageLiteral(resourceName: "hex-key"),
        displayColor: UIColor(red: 255/255.0, green: 126/255.0, blue: 55/255.0, alpha: 1), //orange
        levelEligibleAt: 10, //10
        requiredPartyMembers: []
    )
    
    static let Adaptation2 = Perk(     name: "Compėnsatė",
                                        gameDescription: "Another, morė potėnt, sourcė of adaptation.",
                                        type: .adaptClothing, //types are strings that the game will look for when determining how to behave
        price: 15000, //15000
        meta1: 0.25, //portion of slots to adjust
        meta2: 2, //number of forks for a good move
        meta3: 0.50, //likelihood a good move option will prevail over a random
        minutesUnlocked: 1445, //1 day and 5 minutes, 1445
        icon: #imageLiteral(resourceName: "hex-key"),
        displayColor: UIColor(red: 255/255.0, green: 126/255.0, blue: 55/255.0, alpha: 1), //orange
        levelEligibleAt: 20, //20
        requiredPartyMembers: []
    )
    
    //Adaptation 3 also considers the color of the player's initial progress color
    static let Adaptation3 = Perk(     name: "Adapt",
                                        gameDescription: "Anothėr powėrful sourcė of adaptation.",
                                        type: .adaptClothing, //types are strings that the game will look for when determining how to behave
        price: 90000,//90000
        meta1: 0.30, //portion of slots to adjust
        meta2: 2, //number of forks for a good move
        meta3: 0.75, //likelihood a good move option will prevail over a random
        minutesUnlocked: 2880, //2 days, 2880
        icon: #imageLiteral(resourceName: "hex-key"),
        displayColor: UIColor(red: 255/255.0, green: 126/255.0, blue: 55/255.0, alpha: 1), //orange
        levelEligibleAt: 56, //56
        requiredPartyMembers: []
    )
    
    //Adaptation 4 also considers the color of the player's initial progress color - or rather, it resets the player's color to black.
    static let Adaptation4 = Perk(     name: "Evolvė",
                                       gameDescription: "The most powėrful in the systėm of adaptation tools.",
                                       type: .adaptClothing, //types are strings that the game will look for when determining how to behave
        price: 300000, //300000
        meta1: 0.35, //portion of slots to adjust
        meta2: 1, //number of forks for a good move
        meta3: 0.90, //likelihood a good move option will prevail over a random
        minutesUnlocked: 20160, //14 days, 20160
        icon: #imageLiteral(resourceName: "hex-key"),
        displayColor: UIColor(red: 255/255.0, green: 126/255.0, blue: 55/255.0, alpha: 1), //orange
        levelEligibleAt: 82, //82
        requiredPartyMembers: []
    )
    
    
    /******************************************************/
    /*******************///MARK: Insight
    /******************************************************/
    
    static let Insight = Perk(     name: "Insight",
                                    gameDescription: "You sėė things othėrs might not.",
                                    type: .visualizeColorValues, //types are strings that the game will look for when determining how to behave
                                    price: 5000, //5000
                                    meta1: 1,
                                    meta2: nil,
                                    meta3: nil,
                                    minutesUnlocked: 60, //60
                                    icon: #imageLiteral(resourceName: "lightbulb"),
                                    displayColor: UIColor(red: 0/255.0, green: 134/255.0, blue: 237/255.0, alpha: 1),
                                    levelEligibleAt: 8, //8
                                    requiredPartyMembers: []
    )
    static let Insight2 = Perk(     name: "Pėrcėption",
                                    gameDescription: "You sėė morė things othėrs might not, with the hėlp of a friėnd.",
                                    type: .visualizeColorValues, //types are strings that the game will look for when determining how to behave
        price: 25000, //25000
        meta1: 2,
        meta2: nil,
        meta3: nil,
        minutesUnlocked: 240, //4 hours
        icon: #imageLiteral(resourceName: "lightbulb"),
        displayColor: UIColor(red: 0/255.0, green: 134/255.0, blue: 237/255.0, alpha: 1),
        levelEligibleAt: Characters.StanleyJr.levelEligibleAt,
        requiredPartyMembers: [Characters.StanleyJr, Characters.R0berte]
    )
    
    static let Insight3 = Perk(     name: "Epiphany",
                                    gameDescription: "You sėė many things othėrs might not, with the hėlp of a friėnd.",
                                    type: .visualizeColorValues, //types are strings that the game will look for when determining how to behave
        price: 250000, //250,000
        meta1: 3,
        meta2: nil,
        meta3: nil,
        minutesUnlocked: 20160, //2 weeks 20160
        icon: #imageLiteral(resourceName: "lightbulb"),
        displayColor: UIColor(red: 0/255.0, green: 134/255.0, blue: 237/255.0, alpha: 1),
        levelEligibleAt: 63,
        requiredPartyMembers: [Characters.Stanley, Characters.John, Characters.R0berte]
    )
    
    /******************************************************/
    /*******************///MARK: Study
    /******************************************************/
    
    static let Study = Perk(     name: "Quick Study",
                                   gameDescription: "You lėarn morė at ėach ėncountėr.",
                                   type: .increasedXP, //types are strings that the game will look for when determining how to behave
                                    price: 50000, //50000
                                    meta1: 1,
                                    meta2: nil,
                                    meta3: nil,
                                    minutesUnlocked: 30,
                                    icon: #imageLiteral(resourceName: "pencil"),
                                    displayColor: UIColor(red: 114/255.0, green: 42/255.0, blue: 183/255.0, alpha: 1),
                                    levelEligibleAt: 7,
                                    requiredPartyMembers: []
    )
    
    static let Study2 = Perk(     name: "Study Buddy",
                                  gameDescription: "Anothėr sourcė of advancėd lėarning, with the hėlp of a friėnd.",
                                  type: .increasedXP, //types are strings that the game will look for when determining how to behave
        price: 85000,
        meta1: 1,
        meta2: nil,
        meta3: nil,
        minutesUnlocked: 45,
        icon: #imageLiteral(resourceName: "pencil"),
        displayColor: UIColor(red: 114/255.0, green: 42/255.0, blue: 183/255.0, alpha: 1),
        levelEligibleAt: 34, //34
        requiredPartyMembers: [Characters.Fred, Characters.Dawson, Characters.R0berte]
    )
    
    static let Study3 = Perk(     name: "Numbėr Crunch",
                                  gameDescription: "Anothėr sourcė of lėarning, availablė with the hėlp of a mėchanical friėnd.",
                                  type: .increasedXP, //types are strings that the game will look for when determining how to behave
        price: 101010,
        meta1: 1,
        meta2: nil,
        meta3: nil,
        minutesUnlocked: 35,
        icon: #imageLiteral(resourceName: "pencil"),
        displayColor: UIColor(red: 114/255.0, green: 42/255.0, blue: 183/255.0, alpha: 1),
        levelEligibleAt: Characters.R0berte.levelEligibleAt,
        requiredPartyMembers: [Characters.R0berte]
    )
    
    
    static let Study4 = Perk(     name: "Emėritus",
                                      gameDescription: "The most potėnt of lėarning tools, availablė with the help of a lost friėnd (or a real tool).",
                                      type: .increasedXP, //types are strings that the game will look for when determining how to behave
                                    price: 2007000,
                                    meta1: 3,
                                    meta2: nil,
                                    meta3: nil,
                                    minutesUnlocked: 90,
                                    icon: #imageLiteral(resourceName: "pencil"),
                                    displayColor: UIColor(red: 114/255.0, green: 42/255.0, blue: 183/255.0, alpha: 1),
                                    levelEligibleAt: Characters.John.levelEligibleAt! + 0,
                                    requiredPartyMembers: [Characters.John, Characters.R0berte]
    )
    
    
    /******************************************************/
    /*******************///MARK: Stacks
    /******************************************************/
    
    
    static let Stacks = Perk(     name: "Innovatė",
                                      gameDescription: "You find a way to walk away with morė from ėach ėncountėr.",
                                      type: .increasedScore, //types are strings that the game will look for when determining how to behave
                                        price: 10000, //10000
                                        meta1: 2,
                                        meta2: nil,
                                        meta3: nil,
                                        minutesUnlocked: 45, //45
                                        icon: #imageLiteral(resourceName: "hex-DollarSign"),
                                        displayColor: UIColor(red: 249/255.0, green: 219/255.0, blue: 0/255.0, alpha: 1),
                                        levelEligibleAt: 5, //5
                                        requiredPartyMembers: []
    )
    
    static let Stacks2 = Perk(     name: "Crėatė",
                                      gameDescription: "With hėlp, you crėatė an additional way to ėarn more.",
                                      type: .increasedScore, //types are strings that the game will look for when determining how to behave
                                        price: 30000,
                                        meta1: 2,
                                        meta2: nil,
                                        meta3: nil,
                                        minutesUnlocked: 55, //55
                                        icon: #imageLiteral(resourceName: "hex-DollarSign"),
                                        displayColor: UIColor(red: 249/255.0, green: 219/255.0, blue: 0/255.0, alpha: 1),
                                        levelEligibleAt: 33, //33
                                        requiredPartyMembers: [Characters.Charles, Characters.Laura, Characters.R0berte]
    )
    
    static let Stacks3 = Perk(     name: "Producė",
                                   gameDescription: "You producė an additional tool - ėarning much more with the hėlp of a friėnd.",
                                   type: .increasedScore, //types are strings that the game will look for when determining how to behave
        price: 85000,
        meta1: 3,
        meta2: nil,
        meta3: nil,
        minutesUnlocked: 600, //10 hours
        icon: #imageLiteral(resourceName: "hex-DollarSign"),
        displayColor: UIColor(red: 249/255.0, green: 219/255.0, blue: 0/255.0, alpha: 1),
        levelEligibleAt: 48, //48
        requiredPartyMembers: [Characters.Fred, Characters.Bessie, Characters.R0berte]
    )
    
    static let Stacks5 = Perk(     name: "Cash Cow",
                                   gameDescription: "Cash from the cow.",
                                   type: .increasedScore, //types are strings that the game will look for when determining how to behave
        price: 250000,
        meta1: 4,
        meta2: nil,
        meta3: nil,
        minutesUnlocked: 480, //8 hours
        icon: #imageLiteral(resourceName: "hex-DollarSign"),
        displayColor: UIColor(red: 249/255.0, green: 219/255.0, blue: 0/255.0, alpha: 1),
        levelEligibleAt: 100, //100
        requiredPartyMembers: [Characters.Bessie]
    )
    
    static let Stacks4 = Perk(     name: "Invėnt",
                                        gameDescription: "Your crėations culminatė and producė much, much morė.",
                                        type: .increasedScore, //types are strings that the game will look for when determining how to behave
                                            price: 220000,
                                            meta1: 4,
                                            meta2: nil,
                                            meta3: nil,
                                            minutesUnlocked: 7200, //5 Days, 7200
                                            icon: #imageLiteral(resourceName: "hex-DollarSign"),
                                            displayColor: UIColor(red: 249/255.0, green: 219/255.0, blue: 0/255.0, alpha: 1),
                                            levelEligibleAt: 61,
                                            requiredPartyMembers: []
    )
    
    /******************************************************/
    /*******************///MARK: Closeenough
    /******************************************************/
    
    static let Closeenough = Perk(     name: "Closė Enough",
                                        gameDescription: "Your good mannėrs ėnablė you to squėak by whėrė othėrs would fail.",
                                        type: .precisionAdjustment, //types are strings that the game will look for when determining how to behave
                                        price: 10000,
                                        meta1: -0.02,
                                        meta2: nil,
                                        meta3: nil,
                                        minutesUnlocked: 4320, //3 days, 4320
                                        icon: #imageLiteral(resourceName: "bullseye"),
                                        displayColor: UIColor(red: 25/255.0, green: 25/255.0, blue: 25/255.0, alpha: 1),
                                        levelEligibleAt: 9,
                                        requiredPartyMembers: []
    )
    
    static let Closeenough2 = Perk(     name: "Just About",
                                       gameDescription: "Your rėputation allows you to gėt by whėrė othėrs would fail.",
                                       type: .precisionAdjustment, //types are strings that the game will look for when determining how to behave
                                        price: 50000,
                                        meta1: -0.035,
                                        meta2: nil,
                                        meta3: nil,
                                        minutesUnlocked: 300, //5 hours 300
                                        icon: #imageLiteral(resourceName: "bullseye"),
                                        displayColor: UIColor(red: 25/255.0, green: 25/255.0, blue: 25/255.0, alpha: 1),
                                        levelEligibleAt: 30,
                                        requiredPartyMembers: [Characters.Matthew, Characters.Stanley, Characters.Charles, Characters.Sparkle, Characters.R0berte]
    )
    
    static let Closeenough3 = Perk(     name: "Ballpark",
                                     gameDescription: "Pėople likė you.  Whėn you arė almost thėrė, you arė.",
                                     type: .precisionAdjustment, //types are strings that the game will look for when determining how to behave
        price: 200000,
        meta1: -0.05,
        meta2: nil,
        meta3: nil,
        minutesUnlocked: 20,
        icon: #imageLiteral(resourceName: "bullseye"),
        displayColor: UIColor(red: 25/255.0, green: 25/255.0, blue: 25/255.0, alpha: 1),
        levelEligibleAt: Characters.Matthew.levelEligibleAt, //Matthew
        requiredPartyMembers: [Characters.Matthew, Characters.Sparkle, Characters.R0berte]
    )
    
    static let Closeenough4 = Perk(     name: "Out of My Way",
                                         gameDescription: "Some challenges can only be overcome with the right person.",
                                         type: .precisionAdjustment, //types are strings that the game will look for when determining how to behave
        price: 400000,
        meta1: -0.10,
        meta2: nil,
        meta3: nil,
        minutesUnlocked: 10,
        icon: #imageLiteral(resourceName: "bullseye"),
        displayColor: UIColor(red: 25/255.0, green: 25/255.0, blue: 25/255.0, alpha: 1),
        levelEligibleAt: 130, //130 is love of life
        requiredPartyMembers: [Characters.John]
    )
    
    /******************************************************/
    /*******************///MARK: Investment
    /******************************************************/
    //early levels give valuable bonuses to characters base
    //second highest level of this perk will bankrupt the player by making all characters bleed his score
    //when perk expires a fullscreen modal shows a crash - player loses money

    static let Investment = Perk(     name: "Stock",
                                        gameDescription: "You makė somė clėar and ėasy rėturns by making this invėstmėnt.",
                                        type: .investment, //types are strings that the game will look for when determining how to behave
        price: 0,
        meta1: 300,  //increase to base score for all characters
        meta2: nil,  //increase to closeenough
        meta3: nil,
        minutesUnlocked: 30, //short time requies player to keep asking for it
        icon: #imageLiteral(resourceName: "hex-rubyBlur10"),
        displayColor: UIColor(red: 0/255.0, green: 128/255.0, blue: 64/255.0, alpha: 1), //green.  A snake or money?
        levelEligibleAt: Characters.Francisco.levelEligibleAt,
        requiredPartyMembers: [Characters.Francisco]
    )
    
    static let Investment2 = Perk(     name: "Invėstmėnt",
                                      gameDescription: "You makė somė vėry clėar and ėasy returns by making this invėstment.",
                                      type: .investment, //types are strings that the game will look for when determining how to behave
        price: 0,
        meta1: 600,  //increase to base score for all characters
        meta2: nil,  //increase to closeenough
        meta3: nil,
        minutesUnlocked: 45,
        icon: #imageLiteral(resourceName: "hex-rubyBlur6"),
        displayColor: UIColor(red: 0/255.0, green: 128/255.0, blue: 64/255.0, alpha: 1), //green.  A snake or money?
        levelEligibleAt: 1, //15
        requiredPartyMembers: [Characters.Francisco]
    )
    
    static let Investment3 = Perk(     name: "Portfolio",
                                       gameDescription: "You makė somė clėar and ėasy returns in a lot of ways by making this investment.",
                                       type: .investment, //types are strings that the game will look for when determining how to behave
        price: 0,
        meta1: 900,  //increase to base score for all characters
        meta2: -0.01,  //increase to closeenough
        meta3: nil,
        minutesUnlocked: 15, //2 Days, 2880
        icon: #imageLiteral(resourceName: "hex-rubyBlur4"),
        displayColor: UIColor(red: 0/255.0, green: 128/255.0, blue: 64/255.0, alpha: 1), //green.  A snake or money?
        levelEligibleAt: 1, //18
        requiredPartyMembers: [Characters.Francisco]
    )
    
    static let Investment4 = Perk(     name: "Rėinvėstmėnt",
                                       gameDescription: "You will dėfinatėly makė somė ėasy rėturns in a lot of ways by making this invėstment.",
                                       type: .investment, //types are strings that the game will look for when determining how to behave
        price: 0,
        meta1: 1500,  //increase to base score for all characters
        meta2: -0.01,  //increase to closeenough
        meta3: nil,
        minutesUnlocked: 15, //3 days 4320
        icon: #imageLiteral(resourceName: "hex-rubyBlur2"),
        displayColor: UIColor(red: 0/255.0, green: 128/255.0, blue: 64/255.0, alpha: 1), //green.  A snake or money?
        levelEligibleAt: 1, //22
        requiredPartyMembers: [Characters.Francisco]
    )
    
    static let Investment5 = Perk(     name: "Big Payoff",
                                       gameDescription: "You have madė many surė-firė invėstmėnts bėforė this and havė no rėason to think this will bė any different.",
                                       type: .investment, //types are strings that the game will look for when determining how to behave
        price: 0,
        meta1: 2400,  //increase to base score for all characters
        meta2: -0.02,  //increase to closeenough
        meta3: true,  //when this perk expires, player will lose 80% of all money, all perks will expire (be locked), level will be reset to "looter" (level 22)
        minutesUnlocked: 30, //7 Days, 10080.  make player forget about it
        icon: #imageLiteral(resourceName: "hex-ruby"),
        displayColor: UIColor(red: 0/255.0, green: 128/255.0, blue: 64/255.0, alpha: 1), //green.  A snake or money?
        levelEligibleAt: 1, //24
        requiredPartyMembers: [Characters.Francisco]
    )
    
    //TODO: figure this one out
    
    static let FranciscoRedemption = Perk(     name: "Rėdėmption",
                                       gameDescription: "You havė madė many surė-firė invėstmėnts bėforė this and have no rėason to think this will bė any different.",
                                       type: .investment, //types are strings that the game will look for when determining how to behave
        price: 2500,
        meta1: 700,  //increase to base score for all characters
        meta2: -0.02,  //increase to closeenough
        meta3: true,  //when this perk expires, player will lose 50% of all money plus 5% for all other active (or being unlocked) investment perks, all perks will expire (be locked), level will be reset to "looter" (level 22)
        minutesUnlocked: 10080, //7 Days, 10080.  make player forget about it
        icon: #imageLiteral(resourceName: "hex-ruby"),
        displayColor: UIColor(red: 0/255.0, green: 128/255.0, blue: 64/255.0, alpha: 1), //green.  A snake or money?
        levelEligibleAt: Characters.John.levelEligibleAt,
        requiredPartyMembers: [Characters.Francisco]
    )
    
}
