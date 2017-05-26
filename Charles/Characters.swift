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
    static let ValidCharacters: [Character] = [Dan, Benton, Charles, Fred]
    static let NewPlayerCharacterSet: [Character] = [Dan, Benton]
    static let AlwaysUnlockedSet: [Character] = NewPlayerCharacterSet
    static let UnlockableCharacters: [Character] = [Charles, Fred]
    
    /******************************************************/
    /*******************///MARK: Characters
    /******************************************************/

    // MARK: Charles
    static let Charles = Character(name: "Charles",
                                   topRadius: 30,
                                   bottomRadius: 15,
                                   price: 6000,
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
                                                    likelihood: 25,
                                                    subphrases: [Subphrase(words: "I'm", audioFilePath: Bundle.main.path(forResource: "I'm", ofType: "m4a", inDirectory: "Audio/Charles")),
                                                                 Subphrase(words: "a", audioFilePath: Bundle.main.path(forResource: "A", ofType: "m4a", inDirectory: "Audio/Charles")),
                                                                 Subphrase(words: "playa and a pimp", audioFilePath: Bundle.main.path(forResource: "Playa And A Pimp", ofType: "m4a", inDirectory: "Audio/Charles"))
                                                ], slots: [Slot(tone: 100, color: .orange),
                                                           Slot(tone: 150, color: .yellow),
                                                           Slot(tone: -500, color: .red)
                                                ])
                                    
                                    ])
    
    /// MARK: Dan
    static let Dan = Character(name: "Dan",
                               topRadius: 130,
                               bottomRadius: 10,
                               price: 0,
                                   phrases: [Phrase(name: "N00b!",
                                                    likelihood: 40,
                                                    subphrases: [Subphrase(words: "nooob!", audioFilePath: Bundle.main.path(forResource: "N00b!", ofType: "m4a", inDirectory: "Audio/Dan"))
                                    ],
                                                    slots: [Slot(tone: -400, color: .white),
                                                            Slot(tone: -150, color: .black),
                                                            Slot(tone: 400, color: .white),
                                                            Slot(tone: 600, color: .black),
                                                            Slot(tone: 800, color: .white),
                                                            Slot(tone: 1000, color: .black),
                                                            Slot(tone: 1200, color: .white)
                                    ]),
                                             Phrase(name: "Pawned his head",
                                                    likelihood: 30,
                                                    subphrases: [Subphrase(words: "Pawned", audioFilePath: Bundle.main.path(forResource: "Pawned", ofType: "m4a", inDirectory: "Audio/Dan")),
                                                                 Subphrase(words: "his", audioFilePath: Bundle.main.path(forResource: "His", ofType: "m4a", inDirectory: "Audio/Dan")),
                                                                 Subphrase(words: "Head", audioFilePath: Bundle.main.path(forResource: "Head", ofType: "m4a", inDirectory: "Audio/Dan"))
                                                ],
                                                    slots: [Slot(tone: -300, color: .red),
                                                            Slot(tone: 200, color: .white),
                                                            Slot(tone: 600, color: .blue),
                                                            Slot(tone: -600, color: .orange)
                                                ]),
                                             Phrase(name: "That's a pawn",
                                                    likelihood: 20,
                                                    subphrases: [Subphrase(words: "That's", audioFilePath: Bundle.main.path(forResource: "That's", ofType: "m4a", inDirectory: "Audio/Dan")),
                                                                 Subphrase(words: "a", audioFilePath: Bundle.main.path(forResource: "A (pawn)", ofType: "m4a", inDirectory: "Audio/Dan")),
                                                                 Subphrase(words: "pawn", audioFilePath: Bundle.main.path(forResource: "Pawn", ofType: "m4a", inDirectory: "Audio/Dan"))
                                                ], slots: [Slot(tone: 550, color: .orange),
                                                           Slot(tone: 300, color: .yellow),
                                                           Slot(tone: -250, color: .white)
                                                ])
                                    
        ])
    
    // MARK: Unlockable Characters
    /// MARK: Fred
    static let Fred = Character(name: "Fred",
                                topRadius: 15,
                                bottomRadius: 15,
                                price: 6000,
                               phrases: [Phrase(name: "N00b!",
                                                likelihood: 40,
                                                subphrases: [Subphrase(words: "nooob!", audioFilePath: Bundle.main.path(forResource: "N00b!", ofType: "m4a", inDirectory: "Audio/Dan"))
                                ],
                                                slots: [Slot(tone: -400, color: .yellow),
                                                        Slot(tone: -150, color: .black),
                                                        Slot(tone: 400, color: .yellow),
                                                        Slot(tone: 600, color: .black),
                                                        Slot(tone: 800, color: .yellow),
                                                        Slot(tone: 1000, color: .black),
                                                        Slot(tone: 1200, color: .yellow)
                                ]),
                                         Phrase(name: "Pawned his head",
                                                likelihood: 30,
                                                subphrases: [Subphrase(words: "Pawned", audioFilePath: Bundle.main.path(forResource: "Pawned", ofType: "m4a", inDirectory: "Audio/Dan")),
                                                             Subphrase(words: "his", audioFilePath: Bundle.main.path(forResource: "His", ofType: "m4a", inDirectory: "Audio/Dan")),
                                                             Subphrase(words: "Head", audioFilePath: Bundle.main.path(forResource: "Head", ofType: "m4a", inDirectory: "Audio/Dan"))
                                            ],
                                                slots: [Slot(tone: -300, color: .red),
                                                        Slot(tone: 200, color: .white),
                                                        Slot(tone: 600, color: .blue),
                                                        Slot(tone: -600, color: .orange)
                                            ]),
                                         Phrase(name: "That's a pawn",
                                                likelihood: 20,
                                                subphrases: [Subphrase(words: "That's", audioFilePath: Bundle.main.path(forResource: "That's", ofType: "m4a", inDirectory: "Audio/Dan")),
                                                             Subphrase(words: "a", audioFilePath: Bundle.main.path(forResource: "A (pawn)", ofType: "m4a", inDirectory: "Audio/Dan")),
                                                             Subphrase(words: "pawn", audioFilePath: Bundle.main.path(forResource: "Pawn", ofType: "m4a", inDirectory: "Audio/Dan"))
                                            ], slots: [Slot(tone: 550, color: .orange),
                                                       Slot(tone: 300, color: .yellow),
                                                       Slot(tone: -250, color: .white)
                                            ])
                                
        ])
    
    static let Benton = Character(name: "Benton",
                                  topRadius: 20,
                                  bottomRadius: 30,
                                  price: 0,
                                phrases: [Phrase(name: "N00b!",
                                                 likelihood: 40,
                                                 subphrases: [Subphrase(words: "nooob!", audioFilePath: Bundle.main.path(forResource: "N00b!", ofType: "m4a", inDirectory: "Audio/Dan"))
                                    ],
                                                 slots: [Slot(tone: -400, color: .yellow),
                                                         Slot(tone: -150, color: .black),
                                                         Slot(tone: 400, color: .yellow),
                                                         Slot(tone: 600, color: .black),
                                                         Slot(tone: 800, color: .yellow)
                                    ]),
                                          Phrase(name: "Pawned his head",
                                                 likelihood: 30,
                                                 subphrases: [Subphrase(words: "Pawned", audioFilePath: Bundle.main.path(forResource: "Pawned", ofType: "m4a", inDirectory: "Audio/Dan")),
                                                              Subphrase(words: "his", audioFilePath: Bundle.main.path(forResource: "His", ofType: "m4a", inDirectory: "Audio/Dan")),
                                                              Subphrase(words: "Head", audioFilePath: Bundle.main.path(forResource: "Head", ofType: "m4a", inDirectory: "Audio/Dan"))
                                            ],
                                                 slots: [Slot(tone: -300, color: .red),
                                                         Slot(tone: 200, color: .white),
                                                         Slot(tone: 600, color: .blue),
                                                         Slot(tone: -600, color: .orange)
                                            ]),
                                          Phrase(name: "That's a pawn",
                                                 likelihood: 20,
                                                 subphrases: [Subphrase(words: "That's", audioFilePath: Bundle.main.path(forResource: "That's", ofType: "m4a", inDirectory: "Audio/Dan")),
                                                              Subphrase(words: "a", audioFilePath: Bundle.main.path(forResource: "A (pawn)", ofType: "m4a", inDirectory: "Audio/Dan")),
                                                              Subphrase(words: "pawn", audioFilePath: Bundle.main.path(forResource: "Pawn", ofType: "m4a", inDirectory: "Audio/Dan"))
                                            ], slots: [Slot(tone: 550, color: .orange),
                                                       Slot(tone: 300, color: .yellow),
                                                       Slot(tone: -250, color: .white)
                                            ])
                                    
        ])
    
}
