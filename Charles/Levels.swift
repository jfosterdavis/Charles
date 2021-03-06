//
//  Levels.swift
//  Charles
//
//  Created by Jacob Foster Davis on 5/27/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation

//phases of the game
enum GamePhase {
    //training
    case training
    case emergeFromDarkness
    case returnToDarkness
    case returnToLight
    case noPhase
    
}

///Holds all of the Levels

struct Levels {
    
    //static let valid: [Level] = []
    ///All levels in the order for the game
    static let HighestLevel = Game[144]!  //everything that determines level or winning the game references this as the highest level
   
    
    static let TrainingLevelFirst = Game[1]!
    static let TrainingLevelLast = Game[10]!
    
    static let EmergeFromDarknessLevelFirst = Game[11]!
    static let EmergeFromDarknessLevelLast = Game[106]!
    
    static let ReturnToDarknessLevelFirst = Game[107]!
    static let ReturnToDarknessLevelLast = Game[126]!
    
    static let ReturnToLightLevelFirst = Game[127]!
    static let ReturnToLightLevelLast = Game[144]!
    
    //for the given level, returns the GamePhase and a Double of the progress within that phase, where 0 = the first level of the phase and 1 is the last level of the phase
    static func getLevelPhaseAndProgress(level: Level) -> (GamePhase, Double) {
        let levelLevel = level.level
        
        switch levelLevel {
        case let x where TrainingLevelFirst.level <= x && x <= TrainingLevelLast.level:
            let adjustedLevel = levelLevel - TrainingLevelFirst.level
            let progress = Double(adjustedLevel) / Double(TrainingLevelLast.level - TrainingLevelFirst.level)
            return (.training, progress)
            
        case let x where EmergeFromDarknessLevelFirst.level <= x && x <= EmergeFromDarknessLevelLast.level:
            let adjustedLevel = levelLevel - EmergeFromDarknessLevelFirst.level
            let progress = Double(adjustedLevel) / Double(EmergeFromDarknessLevelLast.level - EmergeFromDarknessLevelFirst.level)
            return (.emergeFromDarkness, progress)
            
        case let x where ReturnToDarknessLevelFirst.level <= x && x <= ReturnToDarknessLevelLast.level:
            let adjustedLevel = levelLevel - ReturnToDarknessLevelFirst.level
            let progress = Double(adjustedLevel) / Double(ReturnToDarknessLevelLast.level - ReturnToDarknessLevelFirst.level)
            return (.returnToDarkness, progress)
            
        case let x where ReturnToLightLevelFirst.level <= x && x <= ReturnToLightLevelLast.level:
            let adjustedLevel = levelLevel - ReturnToLightLevelFirst.level
            let progress = Double(adjustedLevel) / Double(ReturnToLightLevelLast.level - ReturnToLightLevelFirst.level)
            return (.returnToLight, progress)
            
        default:
            return (.noPhase, 0)
            
        }
    }
    
    
    
     ///All levels in the order for the game
    static let Game: [Int:Level] = [
    
    // 1 - 10 for training the user.  Easy but helps user know what is good and what is bad.
        //train in darkness
        
    1 :  Level(level: 1,  name: "nėwbiė",                   xPRequired: 4,  successThreshold: 0.50, punishThreshold: 0.15, canBeLost: false, eligiblePredefinedObjectives: [ColorLibrary.Fundamental], eligibleRandomColorPrecision: nil),
    2 :  Level(level: 2,  name: "noobiė",                   xPRequired: 5,  successThreshold: 0.50, punishThreshold: 0.15, canBeLost: false, eligiblePredefinedObjectives: [ColorLibrary.Fundamental], eligibleRandomColorPrecision: nil), //Benton
    3 :  Level(level: 3,  name: "n00biė",                   xPRequired: 6,  successThreshold: 0.50, punishThreshold: 0.25, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Fundamental], eligibleRandomColorPrecision: nil), //Little Jimmy
    4 :  Level(level: 4,  name: "n00b",                     xPRequired: 7,  successThreshold: 0.50, punishThreshold: 0.32, canBeLost: false, eligiblePredefinedObjectives: [ColorLibrary.Fundamental], eligibleRandomColorPrecision: nil),
    5 :  Level(level: 5,  name: "n00binator",               xPRequired: 8,  successThreshold: 0.51, punishThreshold: 0.32, canBeLost: false, eligiblePredefinedObjectives: [ColorLibrary.Fundamental], eligibleRandomColorPrecision: nil), //Laura, stacks1
    6 :  Level(level: 6,  name: "nubian",                   xPRequired: 8,  successThreshold: 0.52, punishThreshold: 0.33, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Fundamental], eligibleRandomColorPrecision: nil), //  synesthesia1
    7 :  Level(level: 7,  name: "knowėr of n00bs",          xPRequired: 9,  successThreshold: 0.52, punishThreshold: 0.33, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy], eligibleRandomColorPrecision: nil), //study1
    8 :  Level(level: 8,  name: "tėachėr of n00bs",         xPRequired: 9,  successThreshold: 0.53, punishThreshold: 0.33, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy], eligibleRandomColorPrecision: nil), //insight
    9 :  Level(level: 9,  name: "lėadėr of n00bs",          xPRequired: 10, successThreshold: 0.54, punishThreshold: 0.33, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy], eligibleRandomColorPrecision: nil), //closeenough1
    10 : Level(level: 10, name: "nubal acadėmy graduatė",   xPRequired: 10, successThreshold: 0.55, punishThreshold: 0.33, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy], eligibleRandomColorPrecision: nil), //Adaptation1
    // emerge from darkness
        //in the middle the punishment gets harsher as man tries to figure himself out.  It is a challenge.  But as man discovers his mind things start to get easier.
    11 : Level(level: 11, name: "nothing",                  xPRequired: 11, successThreshold: 0.57, punishThreshold: 0.33, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy], eligibleRandomColorPrecision: nil),
    12 : Level(level: 12, name: "ėxistėncė ėxists",         xPRequired: 11, successThreshold: 0.58, punishThreshold: 0.33, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy], eligibleRandomColorPrecision: nil),
    13 : Level(level: 13, name: "quantity",                 xPRequired: 11, successThreshold: 0.59, punishThreshold: 0.33, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy], eligibleRandomColorPrecision: nil),
    14 : Level(level: 14, name: "changė",                   xPRequired: 11, successThreshold: 0.60, punishThreshold: 0.34, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy], eligibleRandomColorPrecision: nil),
    15 : Level(level: 15, name: "infinitė",                 xPRequired: 11, successThreshold: 0.61, punishThreshold: 0.34, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: nil), //Charles
    16 : Level(level: 16, name: "nothingnėss",              xPRequired: 11, successThreshold: 0.61, punishThreshold: 0.34, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: nil), //fred
    17 : Level(level: 17, name: "dimėnsion",                xPRequired: 11, successThreshold: 0.62, punishThreshold: 0.34, canBeLost: false, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: nil),
    18 : Level(level: 18, name: "dirėction",                xPRequired: 11, successThreshold: 0.63, punishThreshold: 0.35, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: nil), //synesthesia2
    19 : Level(level: 19, name: "magnitudė",                xPRequired: 11, successThreshold: 0.63, punishThreshold: 0.35, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: nil),
    20 : Level(level: 20, name: "vėctor",                   xPRequired: 11, successThreshold: 0.63, punishThreshold: 0.35, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: nil), //Adaptation2
    21 : Level(level: 21, name: "bounds",                   xPRequired: 11, successThreshold: 0.64, punishThreshold: 0.35, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: nil),
    22 : Level(level: 22, name: "ėmptinėss",                xPRequired: 11, successThreshold: 0.64, punishThreshold: 0.36, canBeLost: false, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: nil),
    23 : Level(level: 23, name: "ėmpty",                    xPRequired: 11, successThreshold: 0.64, punishThreshold: 0.36, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: nil), //S Jr. E, insight2
    24 : Level(level: 24, name: "the void",                 xPRequired: 11, successThreshold: 0.65, punishThreshold: 0.36, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: nil),
    25 : Level(level: 25, name: "ėxpansė",                  xPRequired: 11, successThreshold: 0.65, punishThreshold: 0.36, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Medium], eligibleRandomColorPrecision: 1),
    26 : Level(level: 26, name: "timė",                     xPRequired: 11, successThreshold: 0.66, punishThreshold: 0.36, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Medium], eligibleRandomColorPrecision: 1),
    27 : Level(level: 27, name: "cyclė",                    xPRequired: 11, successThreshold: 0.66, punishThreshold: 0.37, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Medium], eligibleRandomColorPrecision: 1),
    28 : Level(level: 28, name: "position",                 xPRequired: 11, successThreshold: 0.67, punishThreshold: 0.37, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Medium], eligibleRandomColorPrecision: 1),
    29 : Level(level: 29, name: "fiėld",                    xPRequired: 11, successThreshold: 0.67, punishThreshold: 0.37, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Medium], eligibleRandomColorPrecision: 1),
    30 : Level(level: 30, name: "ėnėrgy",                   xPRequired: 11, successThreshold: 0.68, punishThreshold: 0.38, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Medium], eligibleRandomColorPrecision: 1), //Closeenough2
    31 : Level(level: 31, name: "mass",                     xPRequired: 11, successThreshold: 0.68, punishThreshold: 0.38, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Medium], eligibleRandomColorPrecision: 1),
    32 : Level(level: 32, name: "quanta",                   xPRequired: 11, successThreshold: 0.69, punishThreshold: 0.38, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Medium], eligibleRandomColorPrecision: 1),
    33 : Level(level: 33, name: "ėntity",                   xPRequired: 11, successThreshold: 0.69, punishThreshold: 0.39, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Medium], eligibleRandomColorPrecision: 1), //stacks2
    34 : Level(level: 34, name: "class",                    xPRequired: 11, successThreshold: 0.70, punishThreshold: 0.39, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Medium], eligibleRandomColorPrecision: 1), //study 2
    35 : Level(level: 35, name: "displacėment",             xPRequired: 11, successThreshold: 0.70, punishThreshold: 0.39, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Medium], eligibleRandomColorPrecision: 1),
    36 : Level(level: 36, name: "vėlocity",                 xPRequired: 11, successThreshold: 0.70, punishThreshold: 0.41, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Medium], eligibleRandomColorPrecision: 1),
    37 : Level(level: 37, name: "momėntum",                 xPRequired: 11, successThreshold: 0.71, punishThreshold: 0.42, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Medium], eligibleRandomColorPrecision: 1),
    38 : Level(level: 38, name: "accėlėration",             xPRequired: 11, successThreshold: 0.72, punishThreshold: 0.43, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Medium], eligibleRandomColorPrecision: 1),
    39 : Level(level: 39, name: "impulsė",                  xPRequired: 11, successThreshold: 0.72, punishThreshold: 0.44, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Medium], eligibleRandomColorPrecision: 1),
    40 : Level(level: 40, name: "jėrk",                     xPRequired: 11, successThreshold: 0.73, punishThreshold: 0.42, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Medium], eligibleRandomColorPrecision: 1), //Stanley Enters
    41 : Level(level: 41, name: "impact",                   xPRequired: 11, successThreshold: 0.73, punishThreshold: 0.43, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Medium], eligibleRandomColorPrecision: 1),
    42 : Level(level: 42, name: "causality",                xPRequired: 11, successThreshold: 0.73, punishThreshold: 0.44, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Medium], eligibleRandomColorPrecision: 1),
    43 : Level(level: 43, name: "action",                   xPRequired: 11, successThreshold: 0.74, punishThreshold: 0.45, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Medium], eligibleRandomColorPrecision: 1),
    44 : Level(level: 44, name: "rėaction",                 xPRequired: 11, successThreshold: 0.74, punishThreshold: 0.46, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Medium], eligibleRandomColorPrecision: 1),
    45 : Level(level: 45, name: "intėraction",              xPRequired: 11, successThreshold: 0.74, punishThreshold: 0.47, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Medium], eligibleRandomColorPrecision: 1),
    46 : Level(level: 46, name: "systėm",                   xPRequired: 11, successThreshold: 0.74, punishThreshold: 0.48, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Fundamental, ColorLibrary.Medium], eligibleRandomColorPrecision: 2),
    47 : Level(level: 47, name: "ėnds",                     xPRequired: 11, successThreshold: 0.74, punishThreshold: 0.45, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Fundamental, ColorLibrary.Medium], eligibleRandomColorPrecision: 2),
    48 : Level(level: 48, name: "forcė",                    xPRequired: 11, successThreshold: 0.74, punishThreshold: 0.46, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Fundamental, ColorLibrary.Medium], eligibleRandomColorPrecision: 2), //stacks3
    49 : Level(level: 49, name: "attraction",               xPRequired: 11, successThreshold: 0.74, punishThreshold: 0.47, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Fundamental, ColorLibrary.Medium], eligibleRandomColorPrecision: 3),
    50 : Level(level: 50, name: "rėpulsion",                xPRequired: 11, successThreshold: 0.74, punishThreshold: 0.48, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Fundamental, ColorLibrary.Medium], eligibleRandomColorPrecision: 2),
    51 : Level(level: 51, name: "procėss",                  xPRequired: 11, successThreshold: 0.74, punishThreshold: 0.49, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    52 : Level(level: 52, name: "mėans",                    xPRequired: 11, successThreshold: 0.75, punishThreshold: 0.50, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    53 : Level(level: 53, name: "crėation",                 xPRequired: 11, successThreshold: 0.75, punishThreshold: 0.51, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    54 : Level(level: 54, name: "dėstruction",              xPRequired: 11, successThreshold: 0.75, punishThreshold: 0.52, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    55 : Level(level: 55, name: "particlė",                 xPRequired: 11, successThreshold: 0.75, punishThreshold: 0.49, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    56 : Level(level: 56, name: "propėrty",                 xPRequired: 11, successThreshold: 0.75, punishThreshold: 0.50, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2), //Adaptation 3
    57 : Level(level: 57, name: "statė",                    xPRequired: 11, successThreshold: 0.75, punishThreshold: 0.51, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    58 : Level(level: 58, name: "atom",                     xPRequired: 11, successThreshold: 0.75, punishThreshold: 0.52, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    59 : Level(level: 59, name: "chėmical",                 xPRequired: 11, successThreshold: 0.75, punishThreshold: 0.53, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    60 : Level(level: 60, name: "phasė",                    xPRequired: 11, successThreshold: 0.75, punishThreshold: 0.55, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    61 : Level(level: 61, name: "matėrial",                 xPRequired: 11, successThreshold: 0.75, punishThreshold: 0.57, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2), //stacks4
    62 : Level(level: 62, name: "ėmėrgėncė",                xPRequired: 20, successThreshold: 0.75, punishThreshold: 0.53, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    63 : Level(level: 63, name: "complėx systėm",           xPRequired: 20, successThreshold: 0.75, punishThreshold: 0.55, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2), //insight 3
    64 : Level(level: 64, name: "rėplication",              xPRequired: 11, successThreshold: 0.75, punishThreshold: 0.57, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),  //Matthew Enters  //Closeenough3
    65 : Level(level: 65, name: "lifė",                     xPRequired: 11, successThreshold: 0.75, punishThreshold: 0.59, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    66 : Level(level: 66, name: "dėath",                    xPRequired: 11, successThreshold: 0.75, punishThreshold: 0.59, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    67 : Level(level: 67, name: "survival",                 xPRequired: 11, successThreshold: 0.75, punishThreshold: 0.60, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    68 : Level(level: 68, name: "nėėd",                     xPRequired: 11, successThreshold: 0.75, punishThreshold: 0.60, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    69 : Level(level: 69, name: "organism",                 xPRequired: 11, successThreshold: 0.75, punishThreshold: 0.60, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    70 : Level(level: 70, name: "brain",                    xPRequired: 11, successThreshold: 0.76, punishThreshold: 0.60, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),  //R0berte enters,  study3
    71 : Level(level: 71, name: "rėality",                  xPRequired: 11, successThreshold: 0.76, punishThreshold: 0.60, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    72 : Level(level: 72, name: "sėnsation",                xPRequired: 11, successThreshold: 0.76, punishThreshold: 0.60, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    73 : Level(level: 73, name: "mėmory",                   xPRequired: 11, successThreshold: 0.76, punishThreshold: 0.60, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    74 : Level(level: 74, name: "pėrcėption",               xPRequired: 11, successThreshold: 0.76, punishThreshold: 0.61, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: nil),
    75 : Level(level: 75, name: "cognition",                xPRequired: 11, successThreshold: 0.76, punishThreshold: 0.61, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: nil), //synesthesia3
    76 : Level(level: 76, name: "consciousnėss",            xPRequired: 11, successThreshold: 0.76, punishThreshold: 0.61, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: nil),
    77 : Level(level: 77, name: "valuė",                    xPRequired: 11, successThreshold: 0.76, punishThreshold: 0.61, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: nil),
    78 : Level(level: 78, name: "judgėmėnt",                xPRequired: 11, successThreshold: 0.76, punishThreshold: 0.61, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    79 : Level(level: 79, name: "rėason",                   xPRequired: 11, successThreshold: 0.76, punishThreshold: 0.62, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    80 : Level(level: 80, name: "idėntity",                 xPRequired: 11, successThreshold: 0.76, punishThreshold: 0.62, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    81 : Level(level: 81, name: "dėlusion",                 xPRequired: 11, successThreshold: 0.77, punishThreshold: 0.65, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    82 : Level(level: 82, name: "thė mind",                 xPRequired: 11, successThreshold: 0.78, punishThreshold: 0.65, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2), //Adaptation 4
    83 : Level(level: 83, name: "control",                  xPRequired: 11, successThreshold: 0.79, punishThreshold: 0.64, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    84 : Level(level: 84, name: "skill",                    xPRequired: 11, successThreshold: 0.80, punishThreshold: 0.64, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    85 : Level(level: 85, name: "Ego",                      xPRequired: 11, successThreshold: 0.81, punishThreshold: 0.63, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    86 : Level(level: 86, name: "forėthought",              xPRequired: 11, successThreshold: 0.82, punishThreshold: 0.63, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    87 : Level(level: 87, name: "frėė will",                xPRequired: 11, successThreshold: 0.83, punishThreshold: 0.63, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    88 : Level(level: 88, name: "thinking",                 xPRequired: 11, successThreshold: 0.83, punishThreshold: 0.63, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),  //John enters
    89 : Level(level: 89, name: "intėnt",                   xPRequired: 11, successThreshold: 0.83, punishThreshold: 0.64, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    90 : Level(level: 90, name: "planning",                 xPRequired: 11, successThreshold: 0.83, punishThreshold: 0.64, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),  //last 10 levels exception to the pattern
    91 : Level(level: 91, name: "sėlf-intėrėst",            xPRequired: 11, successThreshold: 0.84, punishThreshold: 0.64, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    92 : Level(level: 92, name: "philosophy",               xPRequired: 11, successThreshold: 0.84, punishThreshold: 0.64, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    93 : Level(level: 93, name: "sociėty",                  xPRequired: 11, successThreshold: 0.84, punishThreshold: 0.64, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    94 : Level(level: 94, name: "pėrsuadė",                 xPRequired: 11, successThreshold: 0.84, punishThreshold: 0.67, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    95 : Level(level: 95, name: "dėlėgatė",                 xPRequired: 11, successThreshold: 0.85, punishThreshold: 0.66, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    96 : Level(level: 96, name: "compėl",                   xPRequired: 11, successThreshold: 0.85, punishThreshold: 0.65, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    97 : Level(level: 97, name: "good",                     xPRequired: 11, successThreshold: 0.85, punishThreshold: 0.64, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2), //study 4 (John + 5)
    98 : Level(level: 98, name: "ėvil",                     xPRequired: 11, successThreshold: 0.85, punishThreshold: 0.63, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    99 : Level(level: 99, name: "ėthics",                   xPRequired: 11, successThreshold: 0.86, punishThreshold: 0.62, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
   100 : Level(level:100, name: "valuės",                   xPRequired: 11, successThreshold: 0.86, punishThreshold: 0.61, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
   101 : Level(level: 101, name: "morality",                xPRequired: 11, successThreshold: 0.86, punishThreshold: 0.60, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
   102 : Level(level: 102, name: "rėspėct",                 xPRequired: 11, successThreshold: 0.86, punishThreshold: 0.57, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
   103 : Level(level: 103, name: "production",              xPRequired: 11, successThreshold: 0.87, punishThreshold: 0.55, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
   104 : Level(level: 104, name: "wėalth",                  xPRequired: 11, successThreshold: 0.87, punishThreshold: 0.53, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
   105 : Level(level: 105, name: "thrivė",                  xPRequired: 11, successThreshold: 0.88, punishThreshold: 0.50, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2), //,
   106 : Level(level: 106, name: "flourish",                xPRequired: 11, successThreshold: 0.90, punishThreshold: 0.50, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),

   
   //return to darkness
        //starts out a bit easier.  This is an easy road to get down and then it is a hard road to get out of.  harshes punishment here.  And yet still has medium color library in many cases
   
   107 : Level(level: 107, name: "ėnvy",                    xPRequired: 11, successThreshold: 0.65, punishThreshold: 0.40, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: nil),
   108 : Level(level: 108, name: "disrėgard",               xPRequired: 11, successThreshold: 0.67, punishThreshold: 0.45, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: nil),
   109 : Level(level: 109, name: "suprėmacy",               xPRequired: 11, successThreshold: 0.69, punishThreshold: 0.50, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: nil),
   110 : Level(level: 110, name: "sacrificė",               xPRequired: 11, successThreshold: 0.71, punishThreshold: 0.55, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Medium], eligibleRandomColorPrecision: 3),
   111 : Level(level: 111, name: "subjugation",             xPRequired: 11, successThreshold: 0.74, punishThreshold: 0.60, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Medium], eligibleRandomColorPrecision: 3),
   112 : Level(level: 112, name: "ėxtėrmination",           xPRequired: 11, successThreshold: 0.76, punishThreshold: 0.61, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Medium], eligibleRandomColorPrecision: 3),
   113 : Level(level: 113, name: "unėarnėd matėrial",       xPRequired: 35, successThreshold: 0.10, punishThreshold: 0.00, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: nil),
   114 : Level(level: 114, name: "parasitė",                xPRequired: 11, successThreshold: 0.70, punishThreshold: 0.63, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Medium], eligibleRandomColorPrecision: 3),
   115 : Level(level: 115, name: "moochėr",                 xPRequired: 11, successThreshold: 0.73, punishThreshold: 0.65, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Medium], eligibleRandomColorPrecision: 3),
   116 : Level(level: 116, name: "lootėr",                  xPRequired: 11, successThreshold: 0.74, punishThreshold: 0.65, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Medium], eligibleRandomColorPrecision: 3),
   117 : Level(level: 117, name: "criminal",                xPRequired: 11, successThreshold: 0.75, punishThreshold: 0.66, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Medium], eligibleRandomColorPrecision: 3),
   118 : Level(level: 118, name: "unėarnėd grėatnėss",      xPRequired: 60, successThreshold: 0.20, punishThreshold: 0.00, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: nil),
   119 : Level(level: 119, name: "sėlf-dėcėption",          xPRequired: 35, successThreshold: 0.40, punishThreshold: 0.00, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Medium], eligibleRandomColorPrecision: 3),
   120 : Level(level: 120, name: "prėstigė",                xPRequired: 11, successThreshold: 0.85, punishThreshold: 0.60, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Medium], eligibleRandomColorPrecision: 3),
   121 : Level(level: 121, name: "powėr-lust",              xPRequired: 11, successThreshold: 0.86, punishThreshold: 0.63, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Medium], eligibleRandomColorPrecision: 3),
   122 : Level(level: 122, name: "\"the public good\"",     xPRequired: 11, successThreshold: 0.87, punishThreshold: 0.65, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Medium], eligibleRandomColorPrecision: 3),
   123 : Level(level: 123,name: "\"the public, c’ėst moi\"",xPRequired: 11, successThreshold: 0.88, punishThreshold: 0.66, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 3),
   124 : Level(level: 124, name: "abėtmėnt",                xPRequired: 5,  successThreshold: 0.84, punishThreshold: 0.68, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 3),
   125 : Level(level: 125, name: "collėctivism",            xPRequired: 11, successThreshold: 0.90, punishThreshold: 0.76, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 3),
   126 : Level(level: 126, name: "totalitarianism",         xPRequired: 11, successThreshold: 0.90, punishThreshold: 0.77, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 3),

   //return to light
        //although the difficulty does increase, its the punishment threshold that decrases.  Clear the way has highest success threshold in game.  It can be the hardest thing to get done.
   
   127 : Level(level: 127, name: "awakėning",               xPRequired: 80, successThreshold: 0.65, punishThreshold: 0.45, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: nil),
   128 : Level(level: 128, name: "lovė",                    xPRequired: 11, successThreshold: 0.79, punishThreshold: 0.65, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 3), //closeEnough 4
   129 : Level(level: 129, name: "lovė of sėlf",            xPRequired: 11, successThreshold: 0.79, punishThreshold: 0.65, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 3),
   130 : Level(level: 130, name: "lovė of lifė",            xPRequired: 11, successThreshold: 0.79, punishThreshold: 0.65, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 3),
   131 : Level(level: 131, name: "egoism",                  xPRequired: 11, successThreshold: 0.80, punishThreshold: 0.65, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 3),
   132 : Level(level: 132, name: "withdrawal of consėnt",   xPRequired: 11, successThreshold: 0.80, punishThreshold: 0.65, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 3),
   133 : Level(level: 133, name: "withdrawal of support",   xPRequired: 11, successThreshold: 0.80, punishThreshold: 0.65, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 3),
   134 : Level(level: 134, name: "rėciprocity",             xPRequired: 11, successThreshold: 0.80, punishThreshold: 0.65, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 3),
   135 : Level(level: 135, name: "sėlf-dėfėnsė",            xPRequired: 35, successThreshold: 0.81, punishThreshold: 0.66, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 3),
   136 : Level(level: 136, name: "individualism",           xPRequired: 11, successThreshold: 0.81, punishThreshold: 0.63, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 3),
   137 : Level(level: 137, name: "objectivism",             xPRequired: 11, successThreshold: 0.82, punishThreshold: 0.63, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 3),
   138 : Level(level: 138, name: "clėar the way",           xPRequired: 40, successThreshold: 0.98, punishThreshold: 0.57, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 3),
   139 : Level(level: 139, name: "rėmėmbėr",                xPRequired: 15, successThreshold: 0.85, punishThreshold: 0.56, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 3),
   140 : Level(level: 140, name: "production",              xPRequired: 15, successThreshold: 0.87, punishThreshold: 0.55, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 3),
   141 : Level(level: 141, name: "wėalth",                  xPRequired: 15, successThreshold: 0.88, punishThreshold: 0.53, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 3),
   142 : Level(level: 142, name: "thrivė",                  xPRequired: 15, successThreshold: 0.88, punishThreshold: 0.50, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 3),
   143 : Level(level: 143, name: "flourish",                xPRequired: 15, successThreshold: 0.89, punishThreshold: 0.50, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 3),
   144 : Level(level: 144, name: "forgėt?",                 xPRequired: 15, successThreshold: 0.91, punishThreshold: 0.50, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 3)
    ]
    
    //given an amount of XP the player has, return the level the player is on. (currentLevel, xp towards this level) Returns nil if the player's level is off the charts
    static func getLevelAndProgress(from xp: Int) -> (Level, Int) {
        
        var level = 1
        var xPRemaining = xp
        //let currentLevel: Int
        //count up each level until xp number is exceeded
        while level <= Levels.Game.count {
            let xpRequired = Levels.Game[level]?.xPRequired
            
            if level > Levels.HighestLevel.level {
                return (Levels.HighestLevel, Levels.HighestLevel.xPRequired)
            }
            
            if xPRemaining < xpRequired! {
                return (Levels.Game[level]!, xPRemaining)
            }
            
            xPRemaining = xPRemaining - (Levels.Game[level]?.xPRequired)!
            level = level + 1
        }
        
        
        if level > Levels.HighestLevel.level {
            let ghostLevel = Level(level: Levels.HighestLevel.level + 1, name: "GHOST", xPRequired: 15, successThreshold: 0.85, punishThreshold: 0.50, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 3)
            return (ghostLevel , xPRemaining)
        }
        
        //no level found by now, player either has max xp or xp above the standard levels
        //for now, return level 39 with highest progress
        //return (Levels.Game[Levels.HighestLevel!.level - 1], Levels.Game[Levels.HighestLevel!.level - 1]?.xPRequired)
        fatalError("Level out of bounds")
    }
    
}
