//
//  Characters.swift
//  Charles
//
//  Created by Jacob Foster Davis on 5/10/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation



struct Characters {
    
    /******************************************************/
    /*******************///MARK: Functions
    /******************************************************/

    
    /******************************************************/
    /*******************///MARK: Groups of Characters
    /******************************************************/
    static let ValidCharacters: [Character] = [Charles]
    static let NewPlayerCharacterSet: [Character] = [Charles]
    
    /******************************************************/
    /*******************///MARK: Characters
    /******************************************************/

    // MARK: Charles
    //create a test character
    static let Charles = Character(name: "Charles",
                                   phrases: [Phrase(name: "I'm a pimp",
                                                    likelihood: 50,
                                                    subphrases: [Subphrase(words: "I'm", audioFilePath: Bundle.main.path(forResource: "I'm", ofType: "m4a", inDirectory: "Audio/Charles")),
                                                                 Subphrase(words: "a", audioFilePath: Bundle.main.path(forResource: "A", ofType: "m4a", inDirectory: "Audio/Charles")),
                                                                 Subphrase(words: "pimp", audioFilePath: Bundle.main.path(forResource: "Pimp", ofType: "m4a", inDirectory: "Audio/Charles"))
                                                ],
                                                    slots: [Slot(tone: 500, color: .blue),
                                                            Slot(tone: 200, color: .black),
                                                            Slot(tone: -200, color: .green)
                                                ]),
                                             Phrase(name: "I'm a playa",
                                                    likelihood: 50,
                                                    subphrases: [Subphrase(words: "I'm", audioFilePath: Bundle.main.path(forResource: "I'm", ofType: "m4a", inDirectory: "Audio/Charles")),
                                                                 Subphrase(words: "a", audioFilePath: Bundle.main.path(forResource: "A", ofType: "m4a", inDirectory: "Audio/Charles")),
                                                                 Subphrase(words: "playa", audioFilePath: Bundle.main.path(forResource: "Playa", ofType: "m4a", inDirectory: "Audio/Charles"))
                                                ],
                                                    slots: [Slot(tone: -300, color: .red),
                                                            Slot(tone: 100, color: .yellow),
                                                            Slot(tone: 700, color: .brown),
                                                            Slot(tone: 600, color: .cyan)
                                                ]),
                                             Phrase(name: "I'm a playa and a pimp",
                                                    likelihood: 10,
                                                    subphrases: [Subphrase(words: "I'm", audioFilePath: Bundle.main.path(forResource: "I'm", ofType: "m4a", inDirectory: "Audio/Charles")),
                                                                 Subphrase(words: "a", audioFilePath: Bundle.main.path(forResource: "A", ofType: "m4a", inDirectory: "Audio/Charles")),
                                                                 Subphrase(words: "playa and a pimp", audioFilePath: Bundle.main.path(forResource: "Playa And A Pimp", ofType: "m4a", inDirectory: "Audio/Charles"))
                                                ], slots: [Slot(tone: 100, color: .orange),
                                                           Slot(tone: 150, color: .yellow)
                                                ])
                                    
                                    ])
    
    
}
