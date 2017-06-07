//
//  Levels.swift
//  Charles
//
//  Created by Jacob Foster Davis on 5/27/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation


///Holds all of the Levels

struct Levels {
    
    //static let valid: [Level] = []
    ///All levels in the order for the game
    static let HighestLevel = Game[142]  //everything that determines level or winning the game references this as the highest level
   
     ///All levels in the order for the game
    static let Game: [Int:Level] = [
    
    // 1 - 10 for training the user.  Easy but helps user know what is good and what is bad.
        //train in darkness
        
    1 :  Level(level: 1,  levelDescription: "newbie",                   xPRequired: 4,  successThreshold: 0.50, punishThreshold: 0.15, canBeLost: false, eligiblePredefinedObjectives: [ColorLibrary.Fundamental], eligibleRandomColorPrecision: nil),
    2 :  Level(level: 2,  levelDescription: "noobie",                   xPRequired: 5,  successThreshold: 0.50, punishThreshold: 0.15, canBeLost: false, eligiblePredefinedObjectives: [ColorLibrary.Fundamental], eligibleRandomColorPrecision: nil),
    3 :  Level(level: 3,  levelDescription: "n00bie",                   xPRequired: 6,  successThreshold: 0.50, punishThreshold: 0.25, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Fundamental], eligibleRandomColorPrecision: nil),
    4 :  Level(level: 4,  levelDescription: "n00b",                     xPRequired: 7,  successThreshold: 0.50, punishThreshold: 0.25, canBeLost: false, eligiblePredefinedObjectives: [ColorLibrary.Fundamental], eligibleRandomColorPrecision: nil),
    5 :  Level(level: 5,  levelDescription: "n00binator",               xPRequired: 8,  successThreshold: 0.51, punishThreshold: 0.33, canBeLost: false, eligiblePredefinedObjectives: [ColorLibrary.Fundamental], eligibleRandomColorPrecision: nil),
    6 :  Level(level: 6,  levelDescription: "nubian",                   xPRequired: 8,  successThreshold: 0.52, punishThreshold: 0.33, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Fundamental], eligibleRandomColorPrecision: nil),
    7 :  Level(level: 7,  levelDescription: "knower of n00bs",          xPRequired: 9,  successThreshold: 0.52, punishThreshold: 0.34, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy], eligibleRandomColorPrecision: nil),
    8 :  Level(level: 8,  levelDescription: "teacher of n00bs",         xPRequired: 9,  successThreshold: 0.53, punishThreshold: 0.34, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy], eligibleRandomColorPrecision: nil),
    9 :  Level(level: 9,  levelDescription: "leader of n00bs",          xPRequired: 10, successThreshold: 0.54, punishThreshold: 0.34, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy], eligibleRandomColorPrecision: nil),
    10 : Level(level: 10, levelDescription: "nubal academy graduate",   xPRequired: 10, successThreshold: 0.55, punishThreshold: 0.34, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy], eligibleRandomColorPrecision: nil), //first 10 for training
    
    // emerge from darkness
    11 : Level(level: 11, levelDescription: "nothing",                  xPRequired: 11, successThreshold: 0.57, punishThreshold: 0.34, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy], eligibleRandomColorPrecision: nil),
    12 : Level(level: 12, levelDescription: "something",                xPRequired: 11, successThreshold: 0.60, punishThreshold: 0.34, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy], eligibleRandomColorPrecision: nil),
    13 : Level(level: 13, levelDescription: "quantity",                 xPRequired: 11, successThreshold: 0.61, punishThreshold: 0.34, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy], eligibleRandomColorPrecision: nil),
    14 : Level(level: 14, levelDescription: "change",                   xPRequired: 11, successThreshold: 0.62, punishThreshold: 0.34, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy], eligibleRandomColorPrecision: nil),
    15 : Level(level: 15, levelDescription: "infinite",                 xPRequired: 11, successThreshold: 0.63, punishThreshold: 0.34, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: nil),
    16 : Level(level: 16, levelDescription: "nothingness",              xPRequired: 11, successThreshold: 0.64, punishThreshold: 0.34, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: nil),
    17 : Level(level: 17, levelDescription: "dimension",                xPRequired: 11, successThreshold: 0.65, punishThreshold: 0.36, canBeLost: false, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: nil),
    18 : Level(level: 18, levelDescription: "direction",                xPRequired: 11, successThreshold: 0.66, punishThreshold: 0.36, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: nil),
    19 : Level(level: 19, levelDescription: "magnitude",                xPRequired: 11, successThreshold: 0.67, punishThreshold: 0.36, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: nil),
    20 : Level(level: 20, levelDescription: "vector",                   xPRequired: 11, successThreshold: 0.63, punishThreshold: 0.34, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: nil),
    21 : Level(level: 21, levelDescription: "bounds",                   xPRequired: 11, successThreshold: 0.64, punishThreshold: 0.34, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: nil),
    22 : Level(level: 22, levelDescription: "emptiness",                xPRequired: 11, successThreshold: 0.65, punishThreshold: 0.36, canBeLost: false, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: nil),
    23 : Level(level: 23, levelDescription: "empty",                    xPRequired: 11, successThreshold: 0.66, punishThreshold: 0.36, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: nil),
    24 : Level(level: 24, levelDescription: "the void",                 xPRequired: 11, successThreshold: 0.67, punishThreshold: 0.36, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: nil),
    25 : Level(level: 25, levelDescription: "expanse",                  xPRequired: 11, successThreshold: 0.67, punishThreshold: 0.36, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: 1),
    26 : Level(level: 26, levelDescription: "time",                     xPRequired: 11, successThreshold: 0.67, punishThreshold: 0.36, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: 1),
    27 : Level(level: 27, levelDescription: "cycle",                    xPRequired: 11, successThreshold: 0.68, punishThreshold: 0.36, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: 1),
    28 : Level(level: 28, levelDescription: "position",                 xPRequired: 11, successThreshold: 0.69, punishThreshold: 0.39, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: 1),
    29 : Level(level: 29, levelDescription: "field",                    xPRequired: 11, successThreshold: 0.70, punishThreshold: 0.39, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: 1),
    30 : Level(level: 30, levelDescription: "energy",                   xPRequired: 11, successThreshold: 0.71, punishThreshold: 0.41, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: 1),
    31 : Level(level: 31, levelDescription: "mass",                     xPRequired: 11, successThreshold: 0.67, punishThreshold: 0.36, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: 1),
    32 : Level(level: 32, levelDescription: "quanta",                   xPRequired: 11, successThreshold: 0.67, punishThreshold: 0.36, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: 1),
    33 : Level(level: 33, levelDescription: "entity",                   xPRequired: 11, successThreshold: 0.68, punishThreshold: 0.36, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: 1),
    34 : Level(level: 34, levelDescription: "class",                    xPRequired: 11, successThreshold: 0.69, punishThreshold: 0.39, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: 1),
    35 : Level(level: 35, levelDescription: "displacement",             xPRequired: 11, successThreshold: 0.70, punishThreshold: 0.39, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: 1),
    36 : Level(level: 36, levelDescription: "velocity",                 xPRequired: 11, successThreshold: 0.71, punishThreshold: 0.41, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: 1),
    37 : Level(level: 37, levelDescription: "momentum",                 xPRequired: 11, successThreshold: 0.72, punishThreshold: 0.42, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: 2),
    38 : Level(level: 38, levelDescription: "acceleration",             xPRequired: 11, successThreshold: 0.73, punishThreshold: 0.43, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: 2),
    39 : Level(level: 39, levelDescription: "impulse",                  xPRequired: 11, successThreshold: 0.74, punishThreshold: 0.44, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: 2),
    40 : Level(level: 40, levelDescription: "jerk",                     xPRequired: 11, successThreshold: 0.72, punishThreshold: 0.42, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: 2),
    41 : Level(level: 41, levelDescription: "impact",                   xPRequired: 11, successThreshold: 0.73, punishThreshold: 0.43, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: 2),
    42 : Level(level: 42, levelDescription: "causality",                xPRequired: 11, successThreshold: 0.74, punishThreshold: 0.44, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Easy, ColorLibrary.Medium], eligibleRandomColorPrecision: 2),
    43 : Level(level: 43, levelDescription: "action",                   xPRequired: 11, successThreshold: 0.75, punishThreshold: 0.45, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Fundamental, ColorLibrary.Medium], eligibleRandomColorPrecision: 2),
    44 : Level(level: 44, levelDescription: "reaction",                 xPRequired: 11, successThreshold: 0.76, punishThreshold: 0.46, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Fundamental, ColorLibrary.Medium], eligibleRandomColorPrecision: 2),
    45 : Level(level: 45, levelDescription: "interaction",              xPRequired: 11, successThreshold: 0.77, punishThreshold: 0.47, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Fundamental, ColorLibrary.Medium], eligibleRandomColorPrecision: 2),
    46 : Level(level: 46, levelDescription: "system",                   xPRequired: 11, successThreshold: 0.78, punishThreshold: 0.48, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Fundamental, ColorLibrary.Medium], eligibleRandomColorPrecision: 2),
    47 : Level(level: 47, levelDescription: "ends",                     xPRequired: 11, successThreshold: 0.75, punishThreshold: 0.45, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Fundamental, ColorLibrary.Medium], eligibleRandomColorPrecision: 2),
    48 : Level(level: 48, levelDescription: "force",                    xPRequired: 11, successThreshold: 0.76, punishThreshold: 0.46, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Fundamental, ColorLibrary.Medium], eligibleRandomColorPrecision: 2),
    49 : Level(level: 49, levelDescription: "attraction",               xPRequired: 11, successThreshold: 0.77, punishThreshold: 0.47, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Fundamental, ColorLibrary.Medium], eligibleRandomColorPrecision: 3),
    50 : Level(level: 50, levelDescription: "repulsion",                xPRequired: 11, successThreshold: 0.78, punishThreshold: 0.48, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Fundamental, ColorLibrary.Medium], eligibleRandomColorPrecision: 2),
    51 : Level(level: 51, levelDescription: "process",                  xPRequired: 11, successThreshold: 0.79, punishThreshold: 0.49, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Fundamental], eligibleRandomColorPrecision: 2),
    52 : Level(level: 52, levelDescription: "means",                    xPRequired: 11, successThreshold: 0.80, punishThreshold: 0.50, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Fundamental], eligibleRandomColorPrecision: 2),
    53 : Level(level: 53, levelDescription: "creation",                 xPRequired: 11, successThreshold: 0.81, punishThreshold: 0.51, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Fundamental], eligibleRandomColorPrecision: 2),
    54 : Level(level: 54, levelDescription: "destruction",              xPRequired: 11, successThreshold: 0.82, punishThreshold: 0.52, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Fundamental], eligibleRandomColorPrecision: 2),
    55 : Level(level: 55, levelDescription: "particle",                 xPRequired: 11, successThreshold: 0.79, punishThreshold: 0.49, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Fundamental], eligibleRandomColorPrecision: 2),
    56 : Level(level: 56, levelDescription: "property",                 xPRequired: 11, successThreshold: 0.80, punishThreshold: 0.50, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Fundamental], eligibleRandomColorPrecision: 2),
    57 : Level(level: 57, levelDescription: "state",                    xPRequired: 11, successThreshold: 0.81, punishThreshold: 0.51, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Fundamental], eligibleRandomColorPrecision: 2),
    58 : Level(level: 58, levelDescription: "atom",                     xPRequired: 11, successThreshold: 0.82, punishThreshold: 0.52, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Fundamental], eligibleRandomColorPrecision: 2),
    59 : Level(level: 59, levelDescription: "chemical",                 xPRequired: 11, successThreshold: 0.82, punishThreshold: 0.53, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Primary], eligibleRandomColorPrecision: 2),
    60 : Level(level: 60, levelDescription: "phase",                    xPRequired: 11, successThreshold: 0.83, punishThreshold: 0.55, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Fundamental], eligibleRandomColorPrecision: nil),
    61 : Level(level: 61, levelDescription: "material",                 xPRequired: 11, successThreshold: 0.83, punishThreshold: 0.57, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    62 : Level(level: 62, levelDescription: "emergence",                xPRequired: 11, successThreshold: 0.82, punishThreshold: 0.53, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Primary], eligibleRandomColorPrecision: 2),
    63 : Level(level: 63, levelDescription: "complex system",           xPRequired: 11, successThreshold: 0.83, punishThreshold: 0.55, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Fundamental], eligibleRandomColorPrecision: nil),
    64 : Level(level: 64, levelDescription: "replication",              xPRequired: 11, successThreshold: 0.83, punishThreshold: 0.57, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    65 : Level(level: 65, levelDescription: "life",                     xPRequired: 11, successThreshold: 0.84, punishThreshold: 0.59, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Fundamental], eligibleRandomColorPrecision: 2),
    66 : Level(level: 66, levelDescription: "death",                    xPRequired: 11, successThreshold: 0.84, punishThreshold: 0.59, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Fundamental], eligibleRandomColorPrecision: 2),
    67 : Level(level: 67, levelDescription: "survival",                 xPRequired: 11, successThreshold: 0.84, punishThreshold: 0.61, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    68 : Level(level: 68, levelDescription: "objective need",           xPRequired: 11, successThreshold: 0.85, punishThreshold: 0.63, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    69 : Level(level: 69, levelDescription: "objective value",          xPRequired: 11, successThreshold: 0.85, punishThreshold: 0.63, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    70 : Level(level: 70, levelDescription: "organism",                 xPRequired: 11, successThreshold: 0.86, punishThreshold: 0.63, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    71 : Level(level: 71, levelDescription: "brain",                    xPRequired: 11, successThreshold: 0.86, punishThreshold: 0.63, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    72 : Level(level: 72, levelDescription: "reality",                  xPRequired: 11, successThreshold: 0.84, punishThreshold: 0.63, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    73 : Level(level: 73, levelDescription: "sensation",                xPRequired: 11, successThreshold: 0.85, punishThreshold: 0.63, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    74 : Level(level: 74, levelDescription: "memory",                   xPRequired: 11, successThreshold: 0.85, punishThreshold: 0.65, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    75 : Level(level: 75, levelDescription: "perception",               xPRequired: 11, successThreshold: 0.86, punishThreshold: 0.65, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    76 : Level(level: 76, levelDescription: "cognition",                xPRequired: 11, successThreshold: 0.86, punishThreshold: 0.65, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    77 : Level(level: 77, levelDescription: "consciousness",            xPRequired: 11, successThreshold: 0.86, punishThreshold: 0.65, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Fundamental], eligibleRandomColorPrecision: 2),
    78 : Level(level: 78, levelDescription: "judgement",                xPRequired: 11, successThreshold: 0.86, punishThreshold: 0.65, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Primary], eligibleRandomColorPrecision: 2),
    79 : Level(level: 79, levelDescription: "reason",                   xPRequired: 11, successThreshold: 0.86, punishThreshold: 0.65, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Fundamental], eligibleRandomColorPrecision: nil),
    80 : Level(level: 80, levelDescription: "identity",                 xPRequired: 11, successThreshold: 0.86, punishThreshold: 0.67, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    81 : Level(level: 81, levelDescription: "delusion",                 xPRequired: 11, successThreshold: 0.87, punishThreshold: 0.67, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Fundamental], eligibleRandomColorPrecision: 2),
    82 : Level(level: 82, levelDescription: "the mind",                 xPRequired: 11, successThreshold: 0.87, punishThreshold: 0.67, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    83 : Level(level: 83, levelDescription: "control",                  xPRequired: 11, successThreshold: 0.87, punishThreshold: 0.67, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    84 : Level(level: 84, levelDescription: "skill",                    xPRequired: 11, successThreshold: 0.87, punishThreshold: 0.67, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    85 : Level(level: 85, levelDescription: "Ego",                      xPRequired: 11, successThreshold: 0.87, punishThreshold: 0.67, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    86 : Level(level: 86, levelDescription: "forethought",              xPRequired: 11, successThreshold: 0.87, punishThreshold: 0.69, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    87 : Level(level: 87, levelDescription: "free will",                xPRequired: 11, successThreshold: 0.88, punishThreshold: 0.69, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    88 : Level(level: 88, levelDescription: "thinking",                 xPRequired: 11, successThreshold: 0.88, punishThreshold: 0.69, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    89 : Level(level: 89, levelDescription: "intent",                   xPRequired: 11, successThreshold: 0.88, punishThreshold: 0.69, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    90 : Level(level: 90, levelDescription: "planning",                 xPRequired: 11, successThreshold: 0.88, punishThreshold: 0.69, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),  //last 10 levels exception to the pattern
    91 : Level(level: 91, levelDescription: "self-interest",            xPRequired: 11, successThreshold: 0.88, punishThreshold: 0.69, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    92 : Level(level: 92, levelDescription: "philosophy",               xPRequired: 11, successThreshold: 0.88, punishThreshold: 0.70, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    93 : Level(level: 93, levelDescription: "society",                  xPRequired: 11, successThreshold: 0.88, punishThreshold: 0.70, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    94 : Level(level: 94, levelDescription: "persuade",                 xPRequired: 11, successThreshold: 0.88, punishThreshold: 0.70, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    95 : Level(level: 95, levelDescription: "delegate",                 xPRequired: 11, successThreshold: 0.88, punishThreshold: 0.70, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    96 : Level(level: 96, levelDescription: "compel",                   xPRequired: 11, successThreshold: 0.89, punishThreshold: 0.70, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    97 : Level(level: 97, levelDescription: "good",                     xPRequired: 11, successThreshold: 0.89, punishThreshold: 0.70, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    98 : Level(level: 98, levelDescription: "evil",                     xPRequired: 11, successThreshold: 0.89, punishThreshold: 0.71, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
    99 : Level(level: 99, levelDescription: "ethics",                   xPRequired: 11, successThreshold: 0.89, punishThreshold: 0.71, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
   100 : Level(level:100, levelDescription: "values",                   xPRequired: 11, successThreshold: 0.89, punishThreshold: 0.71, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
   101 : Level(level: 101, levelDescription: "morality",                xPRequired: 11, successThreshold: 0.89, punishThreshold: 0.71, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
   102 : Level(level: 102, levelDescription: "respect",                 xPRequired: 11, successThreshold: 0.89, punishThreshold: 0.71, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
   103 : Level(level: 103, levelDescription: "production",              xPRequired: 11, successThreshold: 0.89, punishThreshold: 0.71, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
   104 : Level(level: 104, levelDescription: "wealth",                  xPRequired: 11, successThreshold: 0.89, punishThreshold: 0.71, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
   105 : Level(level: 105, levelDescription: "thrive",                  xPRequired: 11, successThreshold: 0.89, punishThreshold: 0.71, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
   106 : Level(level: 106, levelDescription: "flourish",                xPRequired: 11, successThreshold: 0.89, punishThreshold: 0.71, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),

   
   //return to darkness
   
   107 : Level(level: 107, levelDescription: "envy",                    xPRequired: 11, successThreshold: 0.87, punishThreshold: 0.71, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Fundamental], eligibleRandomColorPrecision: 3),
   108 : Level(level: 108, levelDescription: "disregard",               xPRequired: 11, successThreshold: 0.87, punishThreshold: 0.72, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Primary], eligibleRandomColorPrecision: 3),
   109 : Level(level: 109, levelDescription: "supremacy",               xPRequired: 11, successThreshold: 0.88, punishThreshold: 0.72, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Fundamental], eligibleRandomColorPrecision: nil),
   110 : Level(level: 110, levelDescription: "sacrifice",               xPRequired: 11, successThreshold: 0.88, punishThreshold: 0.73, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 3),
   111 : Level(level: 111, levelDescription: "subjugation",             xPRequired: 11, successThreshold: 0.89, punishThreshold: 0.73, canBeLost: true, eligiblePredefinedObjectives: [ColorLibrary.Fundamental], eligibleRandomColorPrecision: 3),
   112 : Level(level: 112, levelDescription: "extermination",           xPRequired: 11, successThreshold: 0.89, punishThreshold: 0.74, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 3),
   113 : Level(level: 113, levelDescription: "unearned material",       xPRequired: 11, successThreshold: 0.90, punishThreshold: 0.74, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 3),
   114 : Level(level: 114, levelDescription: "parasite",                xPRequired: 11, successThreshold: 0.91, punishThreshold: 0.74, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 3),
   115 : Level(level: 115, levelDescription: "moocher",                 xPRequired: 11, successThreshold: 0.92, punishThreshold: 0.75, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 3),
   116 : Level(level: 116, levelDescription: "looter",                  xPRequired: 11, successThreshold: 0.93, punishThreshold: 0.75, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 3),
   117 : Level(level: 117, levelDescription: "criminal",                xPRequired: 11, successThreshold: 0.94, punishThreshold: 0.75, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 3),
   118 : Level(level: 118, levelDescription: "unearned greatness",      xPRequired: 11, successThreshold: 0.95, punishThreshold: 0.75, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 3),
   119 : Level(level: 119, levelDescription: "self-deception",          xPRequired: 11, successThreshold: 0.89, punishThreshold: 0.74, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 3),
   120 : Level(level: 120, levelDescription: "prestige",                xPRequired: 11, successThreshold: 0.90, punishThreshold: 0.70, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 3),  //last 10 levels exception to the pattern
   121 : Level(level: 121, levelDescription: "power-lust",              xPRequired: 11, successThreshold: 0.90, punishThreshold: 0.73, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 3),
   122 : Level(level: 122, levelDescription: "\"the public good\"",     xPRequired: 11, successThreshold: 0.90, punishThreshold: 0.73, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 3),
   123 : Level(level: 123,levelDescription: "\"the public, c’est moi\"",xPRequired: 11, successThreshold: 0.91, punishThreshold: 0.75, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 3),
   124 : Level(level: 124, levelDescription: "abetment",                xPRequired: 11, successThreshold: 0.91, punishThreshold: 0.75, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 3),
   125 : Level(level: 125, levelDescription: "collectivism",            xPRequired: 11, successThreshold: 0.91, punishThreshold: 0.77, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 3),
   126 : Level(level: 126, levelDescription: "totalitarianism",         xPRequired: 11, successThreshold: 0.92, punishThreshold: 0.77, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 3),

   //return to light
   
   127 : Level(level: 127, levelDescription: "awakening",               xPRequired: 11, successThreshold: 0.92, punishThreshold: 0.79, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
   128 : Level(level: 128, levelDescription: "love",                    xPRequired: 11, successThreshold: 0.92, punishThreshold: 0.79, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
   129 : Level(level: 129, levelDescription: "love of self",            xPRequired: 11, successThreshold: 0.93, punishThreshold: 0.80, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
   130 : Level(level: 130, levelDescription: "love of life",            xPRequired: 11, successThreshold: 0.92, punishThreshold: 0.79, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
   131 : Level(level: 131, levelDescription: "egoism",                  xPRequired: 11, successThreshold: 0.92, punishThreshold: 0.79, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
   132 : Level(level: 132, levelDescription: "withdrawal of consent",   xPRequired: 11, successThreshold: 0.93, punishThreshold: 0.80, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
   133 : Level(level: 133, levelDescription: "withdrawal of support",   xPRequired: 11, successThreshold: 0.92, punishThreshold: 0.79, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
   134 : Level(level: 134, levelDescription: "reciprocity",             xPRequired: 11, successThreshold: 0.92, punishThreshold: 0.79, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
   135 : Level(level: 135, levelDescription: "self-defense",            xPRequired: 11, successThreshold: 0.93, punishThreshold: 0.80, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
   136 : Level(level: 136, levelDescription: "individualism",           xPRequired: 11, successThreshold: 0.92, punishThreshold: 0.79, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
   137 : Level(level: 137, levelDescription: "objectivism",             xPRequired: 11, successThreshold: 0.92, punishThreshold: 0.79, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
   138 : Level(level: 138, levelDescription: "clear the way",           xPRequired: 11, successThreshold: 0.93, punishThreshold: 0.80, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
   139 : Level(level: 139, levelDescription: "production",              xPRequired: 11, successThreshold: 0.92, punishThreshold: 0.79, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
   140 : Level(level: 140, levelDescription: "wealth",                  xPRequired: 11, successThreshold: 0.92, punishThreshold: 0.79, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
   141 : Level(level: 141, levelDescription: "thrive",                  xPRequired: 11, successThreshold: 0.93, punishThreshold: 0.80, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2),
   142 : Level(level: 142, levelDescription: "flourish",                xPRequired: 11, successThreshold: 0.93, punishThreshold: 0.80, canBeLost: true, eligiblePredefinedObjectives: nil, eligibleRandomColorPrecision: 2)
    ]
    
    //given an amount of XP the player has, return the level the player is on. (currentLevel, xp towards this level) Returns nil if the player's level is off the charts
    static func getLevelAndProgress(from xp: Int) -> (Level?, Int?) {
        
        var level = 1
        var xPRemaining = xp
        //let currentLevel: Int
        //count up each level until xp number is exceeded
        while level <= Levels.Game.count {
            let xpRequired = Levels.Game[level]?.xPRequired
            if xPRemaining < xpRequired! {
                return (Levels.Game[level], xPRemaining)
            }
            
            xPRemaining = xPRemaining - (Levels.Game[level]?.xPRequired)!
            level = level + 1
        }
        
        //no level found by now, player either has max xp or xp above the standard levels
        //for now, return level 39 with highest progress
        //return (Levels.Game[Levels.HighestLevel!.level - 1], Levels.Game[Levels.HighestLevel!.level - 1]?.xPRequired)
        return (nil, nil)
    }
    
}
