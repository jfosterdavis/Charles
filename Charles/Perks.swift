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
                                    Synesthesia3,
                                    Adaptation4,
                                    Study4,
                                    Closeenough4,
                                    Study3]
    
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
                                         Synesthesia3,
                                         Adaptation4,
                                         Study4,
                                         Closeenough4,
                                         Study3]
    
    /******************************************************/
    /*******************///MARK: Synesthesia
    /******************************************************/
    
    
    
    static let Synesthesia = Perk(     name: "Synesthesia",
                                       gameDescription: "In a moment of stress, when others hear words, you hear music.",
                                       type: .musicalVoices, //types are strings that the game will look for when determining how to behave
        price: 750,
        meta1: Bundle.main.path(forResource: "1c", ofType: "m4a", inDirectory: "Audio/PerkSynesthesia"),
        meta2: Bundle.main.path(forResource: "2c", ofType: "m4a", inDirectory: "Audio/PerkSynesthesia"),
        meta3: Bundle.main.path(forResource: "2c", ofType: "m4a", inDirectory: "Audio/PerkSynesthesia"),
        minutesUnlocked: 30, //30
        icon: #imageLiteral(resourceName: "musicNote"),
        displayColor: UIColor(red: 255/255.0, green: 182/255.0, blue: 249/255.0, alpha: 0.75),
        levelEligibleAt: 6, //6
        requiredPartyMembers: [Characters.Laura]
    )
    
    static let Synesthesia2 = Perk(     name: "Synesthetic",
                                        gameDescription: "It appears you try your hardest not to listen, and you hear only music.",
                                        type: .musicalVoices, //types are strings that the game will look for when determining how to behave
        price: 2500,
        meta1: Bundle.main.path(forResource: "1c", ofType: "m4a", inDirectory: "Audio/PerkSynesthesia"),
        meta2: Bundle.main.path(forResource: "2c", ofType: "m4a", inDirectory: "Audio/PerkSynesthesia"),
        meta3: Bundle.main.path(forResource: "Finala", ofType: "m4a", inDirectory: "Audio/PerkSynesthesia"),
        minutesUnlocked: 7200, //5 days, 7200
        icon: #imageLiteral(resourceName: "musicNote"),
        displayColor: UIColor(red: 255/255.0, green: 182/255.0, blue: 249/255.0, alpha: 0.75),
        levelEligibleAt: 18,
        requiredPartyMembers: [Characters.Laura]
    )
    
    static let Synesthesia3 = Perk(     name: "Synesthete",
                                        gameDescription: "It seems like you have always only heard music.",
                                        type: .musicalVoices, //types are strings that the game will look for when determining how to behave
        price: 25000,
        meta1: Bundle.main.path(forResource: "1c", ofType: "m4a", inDirectory: "Audio/PerkSynesthesia"),
        meta2: Bundle.main.path(forResource: "2c", ofType: "m4a", inDirectory: "Audio/PerkSynesthesia"),
        meta3: Bundle.main.path(forResource: "Finala", ofType: "m4a", inDirectory: "Audio/PerkSynesthesia"),
        minutesUnlocked: 57600, //40 days, 57600
        icon: #imageLiteral(resourceName: "musicNote"),
        displayColor: UIColor(red: 255/255.0, green: 182/255.0, blue: 249/255.0, alpha: 0.75),
        levelEligibleAt: 75, //75
        requiredPartyMembers: [Characters.Laura]
    )
    
    /******************************************************/
    /*******************///MARK: Adaptation
    /******************************************************/
    //Adaptation stacks, except forks which takes the lowest fork for all active values
    
    
    
    static let Adaptation = Perk(     name: "Adjust",
                                       gameDescription: "Your tools adapt to the challenge at hand.",
                                       type: .adaptClothing, //types are strings that the game will look for when determining how to behave
        price: 1000, //1000
        meta1: 0.3, //portion of slots to adjust
        meta2: 3, //number of forks for a good move
        meta3: 0.35, //likelihood a good move option will prevail over a random
        minutesUnlocked: 30, //30
        icon: #imageLiteral(resourceName: "hex-key"),
        displayColor: UIColor(red: 255/255.0, green: 126/255.0, blue: 55/255.0, alpha: 1), //orange
        levelEligibleAt: 10, //10
        requiredPartyMembers: []
    )
    
    static let Adaptation2 = Perk(     name: "Compensate",
                                        gameDescription: "Your tools adapt better to the challenge at hand.",
                                        type: .adaptClothing, //types are strings that the game will look for when determining how to behave
        price: 15000, //15000
        meta1: 0.35, //portion of slots to adjust
        meta2: 2, //number of forks for a good move
        meta3: 0.40, //likelihood a good move option will prevail over a random
        minutesUnlocked: 1440, //1 day, 1440
        icon: #imageLiteral(resourceName: "hex-key"),
        displayColor: UIColor(red: 255/255.0, green: 126/255.0, blue: 55/255.0, alpha: 1), //orange
        levelEligibleAt: 20, //20
        requiredPartyMembers: []
    )
    
    //Adaptation 3 also considers the color of the player's initial progress color
    static let Adaptation3 = Perk(     name: "Adapt",
                                        gameDescription: "Your tools are suited to the challenge at hand.",
                                        type: .adaptClothing, //types are strings that the game will look for when determining how to behave
        price: 30000,//30000
        meta1: 0.4, //portion of slots to adjust
        meta2: 2, //number of forks for a good move
        meta3: 0.45, //likelihood a good move option will prevail over a random
        minutesUnlocked: 2880, //2 days, 2880
        icon: #imageLiteral(resourceName: "hex-key"),
        displayColor: UIColor(red: 255/255.0, green: 126/255.0, blue: 55/255.0, alpha: 1), //orange
        levelEligibleAt: 56, //56
        requiredPartyMembers: []
    )
    
    //Adaptation 4 also considers the color of the player's initial progress color - or rather, it resets the player's color to black.
    static let Adaptation4 = Perk(     name: "Evolve",
                                       gameDescription: "Your tools are inheriently well suited to the challenge at hand.",
                                       type: .adaptClothing, //types are strings that the game will look for when determining how to behave
        price: 120000, //120000
        meta1: 0.55, //portion of slots to adjust
        meta2: 1, //number of forks for a good move
        meta3: 0.50, //likelihood a good move option will prevail over a random
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
                                    gameDescription: "You see things others might not.",
                                    type: .visualizeColorValues, //types are strings that the game will look for when determining how to behave
                                    price: 5000, //5000
                                    meta1: 1,
                                    meta2: nil,
                                    meta3: nil,
                                    minutesUnlocked: 30, //30
                                    icon: #imageLiteral(resourceName: "lightbulb"),
                                    displayColor: UIColor(red: 0/255.0, green: 134/255.0, blue: 237/255.0, alpha: 1),
                                    levelEligibleAt: 8, //8
                                    requiredPartyMembers: []
    )
    static let Insight2 = Perk(     name: "Perception",
                                    gameDescription: "You see things others might not with the help of a friend.",
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
                                    gameDescription: "You see many things others might not with the help of a friend.",
                                    type: .visualizeColorValues, //types are strings that the game will look for when determining how to behave
        price: 65000,
        meta1: 3,
        meta2: nil,
        meta3: nil,
        minutesUnlocked: 10080, //1 week 10080
        icon: #imageLiteral(resourceName: "lightbulb"),
        displayColor: UIColor(red: 0/255.0, green: 134/255.0, blue: 237/255.0, alpha: 1),
        levelEligibleAt: 63,
        requiredPartyMembers: [Characters.Stanley, Characters.John, Characters.R0berte]
    )
    
    /******************************************************/
    /*******************///MARK: Study
    /******************************************************/
    
    static let Study = Perk(     name: "Quick Study",
                                   gameDescription: "You get more out of each encounter.",
                                   type: .increasedXP, //types are strings that the game will look for when determining how to behave
                                    price: 50000, //50000
                                    meta1: 1,
                                    meta2: nil,
                                    meta3: nil,
                                    minutesUnlocked: 20,
                                    icon: #imageLiteral(resourceName: "pencil"),
                                    displayColor: UIColor(red: 114/255.0, green: 42/255.0, blue: 183/255.0, alpha: 1),
                                    levelEligibleAt: 7,
                                    requiredPartyMembers: []
    )
    
    static let Study2 = Perk(     name: "Study Buddy",
                                  gameDescription: "You get more out of each encounter with the help of a friend.",
                                  type: .increasedXP, //types are strings that the game will look for when determining how to behave
        price: 85000,
        meta1: 1,
        meta2: nil,
        meta3: nil,
        minutesUnlocked: 25,
        icon: #imageLiteral(resourceName: "pencil"),
        displayColor: UIColor(red: 114/255.0, green: 42/255.0, blue: 183/255.0, alpha: 1),
        levelEligibleAt: 34, //34
        requiredPartyMembers: [Characters.Fred, Characters.R0berte]
    )
    
    static let Study3 = Perk(     name: "Number Crunch",
                                  gameDescription: "You get more out of each encounter with the help of a mechanical friend.",
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
    
    
    static let Study4 = Perk(     name: "Emeritus",
                                      gameDescription: "You get more out of each encounter with the help of a lost friend.",
                                      type: .increasedXP, //types are strings that the game will look for when determining how to behave
                                    price: 20070000,
                                    meta1: 3,
                                    meta2: nil,
                                    meta3: nil,
                                    minutesUnlocked: 45,
                                    icon: #imageLiteral(resourceName: "pencil"),
                                    displayColor: UIColor(red: 114/255.0, green: 42/255.0, blue: 183/255.0, alpha: 1),
                                    levelEligibleAt: Characters.John.levelEligibleAt,
                                    requiredPartyMembers: [Characters.John]
    )
    
    
    /******************************************************/
    /*******************///MARK: Stacks
    /******************************************************/
    
    
    static let Stacks = Perk(     name: "Innovate",
                                      gameDescription: "You find a way to walk away with more from each encounter.",
                                      type: .increasedScore, //types are strings that the game will look for when determining how to behave
                                        price: 10000, //10000
                                        meta1: 2,
                                        meta2: nil,
                                        meta3: nil,
                                        minutesUnlocked: 30, //30
                                        icon: #imageLiteral(resourceName: "hex-DollarSign"),
                                        displayColor: UIColor(red: 249/255.0, green: 219/255.0, blue: 0/255.0, alpha: 1),
                                        levelEligibleAt: 5, //5
                                        requiredPartyMembers: []
    )
    
    static let Stacks2 = Perk(     name: "Create",
                                      gameDescription: "You find a way to walk away with more from each encounter with the help of a friend.",
                                      type: .increasedScore, //types are strings that the game will look for when determining how to behave
                                        price: 30000,
                                        meta1: 2,
                                        meta2: nil,
                                        meta3: nil,
                                        minutesUnlocked: 25, //30
                                        icon: #imageLiteral(resourceName: "hex-DollarSign"),
                                        displayColor: UIColor(red: 249/255.0, green: 219/255.0, blue: 0/255.0, alpha: 1),
                                        levelEligibleAt: 33, //33
                                        requiredPartyMembers: [Characters.Charles, Characters.Laura]
    )
    
    static let Stacks3 = Perk(     name: "Produce",
                                   gameDescription: "You find a way to walk away with much more from each encounter with the help of a friend.",
                                   type: .increasedScore, //types are strings that the game will look for when determining how to behave
        price: 60000,
        meta1: 2,
        meta2: nil,
        meta3: nil,
        minutesUnlocked: 20, //20
        icon: #imageLiteral(resourceName: "hex-DollarSign"),
        displayColor: UIColor(red: 249/255.0, green: 219/255.0, blue: 0/255.0, alpha: 1),
        levelEligibleAt: 48, //48
        requiredPartyMembers: [Characters.Fred, Characters.R0berte]
    )
    
    static let Stacks4 = Perk(     name: "Invent",
                                        gameDescription: "You find a way to walk away with much more from each encounter.",
                                        type: .increasedScore, //types are strings that the game will look for when determining how to behave
                                            price: 100000,
                                            meta1: 3,
                                            meta2: nil,
                                            meta3: nil,
                                            minutesUnlocked: 15,
                                            icon: #imageLiteral(resourceName: "hex-DollarSign"),
                                            displayColor: UIColor(red: 249/255.0, green: 219/255.0, blue: 0/255.0, alpha: 1),
                                            levelEligibleAt: 61,
                                            requiredPartyMembers: []
    )
    
    /******************************************************/
    /*******************///MARK: Closeenough
    /******************************************************/
    
    static let Closeenough = Perk(     name: "Close Enough",
                                        gameDescription: "You are able to squeak by where others would fail.",
                                        type: .precisionAdjustment, //types are strings that the game will look for when determining how to behave
                                        price: 10000,
                                        meta1: -0.015,
                                        meta2: nil,
                                        meta3: nil,
                                        minutesUnlocked: 4320, //3 days, 4320
                                        icon: #imageLiteral(resourceName: "bullseye"),
                                        displayColor: UIColor(red: 25/255.0, green: 25/255.0, blue: 25/255.0, alpha: 1),
                                        levelEligibleAt: 9,
                                        requiredPartyMembers: []
    )
    
    static let Closeenough2 = Perk(     name: "Just About",
                                       gameDescription: "You are able to get by where others would fail.",
                                       type: .precisionAdjustment, //types are strings that the game will look for when determining how to behave
                                        price: 50000,
                                        meta1: -0.025,
                                        meta2: nil,
                                        meta3: nil,
                                        minutesUnlocked: 300, //5 hours 300
                                        icon: #imageLiteral(resourceName: "bullseye"),
                                        displayColor: UIColor(red: 25/255.0, green: 25/255.0, blue: 25/255.0, alpha: 1),
                                        levelEligibleAt: 30,
                                        requiredPartyMembers: [Characters.Matthew, Characters.StanleyJr, Characters.R0berte]
    )
    
    static let Closeenough3 = Perk(     name: "Ballpark",
                                     gameDescription: "When you are almost there, you are.",
                                     type: .precisionAdjustment, //types are strings that the game will look for when determining how to behave
        price: 200000,
        meta1: -0.04,
        meta2: nil,
        meta3: nil,
        minutesUnlocked: 20,
        icon: #imageLiteral(resourceName: "bullseye"),
        displayColor: UIColor(red: 25/255.0, green: 25/255.0, blue: 25/255.0, alpha: 1),
        levelEligibleAt: 50, //50
        requiredPartyMembers: [Characters.Matthew, Characters.Stanley, Characters.Charles, Characters.R0berte]
    )
    
    static let Closeenough4 = Perk(     name: "Out of My Way",
                                         gameDescription: "Some things can only be stopped with the right person.",
                                         type: .precisionAdjustment, //types are strings that the game will look for when determining how to behave
        price: 500000,
        meta1: -0.10,
        meta2: nil,
        meta3: nil,
        minutesUnlocked: 10,
        icon: #imageLiteral(resourceName: "bullseye"),
        displayColor: UIColor(red: 25/255.0, green: 25/255.0, blue: 25/255.0, alpha: 1),
        levelEligibleAt: Characters.John.levelEligibleAt,
        requiredPartyMembers: [Characters.John]
    )
    
    /******************************************************/
    /*******************///MARK: Investment
    /******************************************************/
    //early levels give valuable bonuses to characters base
    //second highest level of this perk will bankrupt the player by making all characters bleed his score
    //when perk expires a fullscreen modal shows a crash - player loses money

    static let Investment = Perk(     name: "Stock",
                                        gameDescription: "You make some clear and easy returns by making this investment.",
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
    
    static let Investment2 = Perk(     name: "Investment",
                                      gameDescription: "You make some very clear and easy returns by making this investment.",
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
                                       gameDescription: "You make some clear and easy returns in a lot of ways by making this investment.",
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
    
    static let Investment4 = Perk(     name: "Reinvestment",
                                       gameDescription: "You will definately make some easy returns in a lot of ways by making this investment.",
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
                                       gameDescription: "You have made many sure-fire investments before this and have no reason to think this will be any different.",
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
    
    static let FranciscoRedemption = Perk(     name: "Redemption",
                                       gameDescription: "You have made many sure-fire investments before this and have no reason to think this will be any different.",
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
