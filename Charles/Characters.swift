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
                               phrases: [Phrase(name: "Pawned his head",
                                                likelihood: 30,
                                                subphrases: [Subphrase(words: "Pawned", audioFilePath: Bundle.main.path(forResource: "Pawned", ofType: "m4a", inDirectory: "Audio/Dan")),
                                                             Subphrase(words: "his", audioFilePath: Bundle.main.path(forResource: "His", ofType: "m4a", inDirectory: "Audio/Dan")),
                                                             Subphrase(words: "Head", audioFilePath: Bundle.main.path(forResource: "Head", ofType: "m4a", inDirectory: "Audio/Dan"))
                                ],
                                                slots: [Slot(tone: -300, color: .black),
                                                        Slot(tone: 200, color: .white),
                                                        Slot(tone: 200, color: .white),
                                                        Slot(tone: 200, color: .white),
                                                        Slot(tone: 600, color: .blue),
                                                        Slot(tone: 600, color: .blue),
                                                        Slot(tone: 600, color: .blue),
                                                        Slot(tone: -600, color: .orange),
                                                        Slot(tone: -600, color: .orange),
                                                        Slot(tone: -600, color: .orange)
                                ]),
                                         Phrase(name: "N00b!",
                                                    likelihood: 40,
                                                    subphrases: [Subphrase(words: "nooob!", audioFilePath: Bundle.main.path(forResource: "N00b!", ofType: "m4a", inDirectory: "Audio/Dan"))
                                    ],
                                                    slots: [Slot(tone: -50, color: .black),
                                                            Slot(tone: -400, color: .white),
                                                            Slot(tone: -400, color: .white),
                                                            Slot(tone: -150, color: .black),
                                                            Slot(tone: 400, color: .white),
                                                            Slot(tone: -400, color: .white),
                                                            Slot(tone: 600, color: .black),
                                                            Slot(tone: 800, color: .white),
                                                            Slot(tone: -400, color: .white),
                                                            Slot(tone: 1000, color: .black),
                                                            Slot(tone: 1200, color: .white),
                                                            Slot(tone: -400, color: .white)
                                    ]),
                                             
                                             Phrase(name: "That's a pawn",
                                                    likelihood: 20,
                                                    subphrases: [Subphrase(words: "That's", audioFilePath: Bundle.main.path(forResource: "That's", ofType: "m4a", inDirectory: "Audio/Dan")),
                                                                 Subphrase(words: "a", audioFilePath: Bundle.main.path(forResource: "A (pawn)", ofType: "m4a", inDirectory: "Audio/Dan")),
                                                                 Subphrase(words: "pawn", audioFilePath: Bundle.main.path(forResource: "Pawn", ofType: "m4a", inDirectory: "Audio/Dan"))
                                                ], slots: [Slot(tone: 600, color: .black),
                                                            Slot(tone: 550, color: .orange),
                                                           Slot(tone: 550, color: .orange),
                                                           Slot(tone: 550, color: .orange),
                                                           Slot(tone: 300, color: .yellow),
                                                           Slot(tone: 300, color: .yellow),
                                                           Slot(tone: 300, color: .yellow),
                                                           Slot(tone: -250, color: .white),
                                                           Slot(tone: -250, color: .white),
                                                           Slot(tone: -250, color: .white)
                                                ])
                                    
        ])
    
    // MARK: Unlockable Characters
    /// MARK: Fred
    static let Fred = Character(name: "Fred",
                                topRadius: 15,
                                bottomRadius: 15,
                                price: 3000,
                               phrases: [Phrase(name: "You're not the boss of me.",
                                                likelihood: 60,
                                                subphrases: [Subphrase(words: "You're", audioFilePath: Bundle.main.path(forResource: "You're", ofType: "m4a", inDirectory: "Audio/Fred")),
                                                             Subphrase(words: "Not", audioFilePath: Bundle.main.path(forResource: "Not", ofType: "m4a", inDirectory: "Audio/Fred")),
                                                             Subphrase(words: "Dah", audioFilePath: Bundle.main.path(forResource: "Dah", ofType: "m4a", inDirectory: "Audio/Fred")),
                                                             Subphrase(words: "Boss", audioFilePath: Bundle.main.path(forResource: "Boss", ofType: "m4a", inDirectory: "Audio/Fred")),
                                                             Subphrase(words: "Of", audioFilePath: Bundle.main.path(forResource: "Of", ofType: "m4a", inDirectory: "Audio/Fred")),
                                                             Subphrase(words: "Me", audioFilePath: Bundle.main.path(forResource: "Me", ofType: "m4a", inDirectory: "Audio/Fred"))
                                ],
                                                slots: [Slot(tone: 400, color: .red),
                                                        Slot(tone: 400, color: .blue),
                                                        Slot(tone: 300, color: .red),
                                                        Slot(tone: 380, color: .blue),
                                                        Slot(tone: 350, color: .blue),
                                                        Slot(tone: 200, color: .blue)
                                ]),
                                         Phrase(name: "You're not the boss of me.",
                                                likelihood: 20,
                                                subphrases: [Subphrase(words: "You're", audioFilePath: Bundle.main.path(forResource: "You're", ofType: "m4a", inDirectory: "Audio/Fred")),
                                                             Subphrase(words: "Not", audioFilePath: Bundle.main.path(forResource: "Not2", ofType: "m4a", inDirectory: "Audio/Fred")),
                                                             Subphrase(words: "Dah", audioFilePath: Bundle.main.path(forResource: "Dah", ofType: "m4a", inDirectory: "Audio/Fred")),
                                                             Subphrase(words: "Boss", audioFilePath: Bundle.main.path(forResource: "Boss2", ofType: "m4a", inDirectory: "Audio/Fred")),
                                                             Subphrase(words: "Of", audioFilePath: Bundle.main.path(forResource: "Of", ofType: "m4a", inDirectory: "Audio/Fred")),
                                                             Subphrase(words: "Me", audioFilePath: Bundle.main.path(forResource: "Me", ofType: "m4a", inDirectory: "Audio/Fred"))
                                            ],
                                                slots: [Slot(tone: 300, color: .red),
                                                        Slot(tone: 380, color: .blue),
                                                        Slot(tone: 500, color: .red),
                                                        Slot(tone: 600, color: .red),
                                                        Slot(tone: 350, color: .red),
                                                        Slot(tone: 400, color: .red)
                                            ]),
                                         Phrase(name: "I'm gonna call charter.",
                                                likelihood: 60,
                                                subphrases: [Subphrase(words: "I'm", audioFilePath: Bundle.main.path(forResource: "I'm", ofType: "m4a", inDirectory: "Audio/Fred")),
                                                             Subphrase(words: "Gonna", audioFilePath: Bundle.main.path(forResource: "Gonna", ofType: "m4a", inDirectory: "Audio/Fred")),
                                                             Subphrase(words: "Call", audioFilePath: Bundle.main.path(forResource: "Call", ofType: "m4a", inDirectory: "Audio/Fred")),
                                                             Subphrase(words: "Charter", audioFilePath: Bundle.main.path(forResource: "Charter", ofType: "m4a", inDirectory: "Audio/Fred"))
                                            ],
                                                slots: [Slot(tone: 400, color: .yellow),
                                                        Slot(tone: 500, color: .white),
                                                        Slot(tone: 600, color: .black),
                                                        Slot(tone: -100, color: .white),
                                                        Slot(tone: -300, color: .blue)
                                            ]),
                                         Phrase(name: "I'm gonna call charter.",
                                                likelihood: 20,
                                                subphrases: [Subphrase(words: "I'm", audioFilePath: Bundle.main.path(forResource: "I'm2", ofType: "m4a", inDirectory: "Audio/Fred")),
                                                             Subphrase(words: "Gonna", audioFilePath: Bundle.main.path(forResource: "Gonna2", ofType: "m4a", inDirectory: "Audio/Fred")),
                                                             Subphrase(words: "Call", audioFilePath: Bundle.main.path(forResource: "Call", ofType: "m4a", inDirectory: "Audio/Fred")),
                                                             Subphrase(words: "Charter", audioFilePath: Bundle.main.path(forResource: "Charter2", ofType: "m4a", inDirectory: "Audio/Fred"))
                                            ],
                                                slots: [Slot(tone: -400, color: .red),
                                                        Slot(tone: -550, color: .white),
                                                        Slot(tone: -650, color: .black),
                                                        Slot(tone: -800, color: .white),
                                                        Slot(tone: -100, color: .red)
                                            ])
                                
        ])
    
    static let Benton = Character(name: "Benton",
                                  topRadius: 20,
                                  bottomRadius: 30,
                                  price: 0,
                                phrases: [Phrase(name: "Oh Tessa You're So Cute",
                                                 likelihood: 70,
                                                 subphrases: [Subphrase(words: "Oh", audioFilePath: Bundle.main.path(forResource: "Oh", ofType: "m4a", inDirectory: "Audio/Benton")),
                                                              Subphrase(words: "Tessa", audioFilePath: Bundle.main.path(forResource: "Tessa", ofType: "m4a", inDirectory: "Audio/Benton")),
                                                              Subphrase(words: "You're", audioFilePath: Bundle.main.path(forResource: "You're2", ofType: "m4a", inDirectory: "Audio/Benton")),
                                                              Subphrase(words: "So", audioFilePath: Bundle.main.path(forResource: "So", ofType: "m4a", inDirectory: "Audio/Benton")),
                                                              Subphrase(words: "Cute", audioFilePath: Bundle.main.path(forResource: "Cute", ofType: "m4a", inDirectory: "Audio/Benton"))
                                            ],
                                                 slots: [Slot(tone: -400, color: .white),
                                                         Slot(tone: -300, color: .red),
                                                         Slot(tone: -500, color: .white),
                                                         Slot(tone: -700, color: .white)
                                            ]),
                                          Phrase(name: "You Know You're Not As Dumb As You Look",
                                                 likelihood: 10,
                                                 subphrases: [Subphrase(words: "You", audioFilePath: Bundle.main.path(forResource: "You", ofType: "m4a", inDirectory: "Audio/Benton")),
                                                              Subphrase(words: "Know", audioFilePath: Bundle.main.path(forResource: "Know", ofType: "m4a", inDirectory: "Audio/Benton")),
                                                              Subphrase(words: "You're", audioFilePath: Bundle.main.path(forResource: "You're", ofType: "m4a", inDirectory: "Audio/Benton")),
                                                              Subphrase(words: "Not", audioFilePath: Bundle.main.path(forResource: "Not", ofType: "m4a", inDirectory: "Audio/Benton")),
                                                              Subphrase(words: "As", audioFilePath: Bundle.main.path(forResource: "As", ofType: "m4a", inDirectory: "Audio/Benton")),
                                                              Subphrase(words: "Dumb", audioFilePath: Bundle.main.path(forResource: "Dumb", ofType: "m4a", inDirectory: "Audio/Benton")),
                                                              Subphrase(words: "As", audioFilePath: Bundle.main.path(forResource: "As2", ofType: "m4a", inDirectory: "Audio/Benton")),
                                                              Subphrase(words: "You", audioFilePath: Bundle.main.path(forResource: "You2", ofType: "m4a", inDirectory: "Audio/Benton")),
                                                              Subphrase(words: "Look", audioFilePath: Bundle.main.path(forResource: "Look", ofType: "m4a", inDirectory: "Audio/Benton"))
                                            ], slots: [Slot(tone: -550, color: .white),
                                                       Slot(tone: -300, color: .orange),
                                                       Slot(tone: -250, color: .orange),
                                                       Slot(tone: -150, color: .white),
                                                       Slot(tone: -750, color: .white)
                                                
                                            ]),
                                          Phrase(name: "Laugh",
                                                 likelihood: 50,
                                                 subphrases: [Subphrase(words: "Ha Ha Ha Ha", audioFilePath: Bundle.main.path(forResource: "Laugh", ofType: "m4a", inDirectory: "Audio/Benton"))
                                            ], slots: [Slot(tone: -250, color: .blue),
                                                       Slot(tone: -600, color: .white),
                                                       Slot(tone: -250, color: .white)
                                            ]),
                                          Phrase(name: "You're So Cute",
                                                 likelihood: 50,
                                                 subphrases: [Subphrase(words: "You're", audioFilePath: Bundle.main.path(forResource: "You're2", ofType: "m4a", inDirectory: "Audio/Benton")),
                                                              Subphrase(words: "So", audioFilePath: Bundle.main.path(forResource: "So", ofType: "m4a", inDirectory: "Audio/Benton")),
                                                              Subphrase(words: "Cute", audioFilePath: Bundle.main.path(forResource: "Cute", ofType: "m4a", inDirectory: "Audio/Benton"))
                                            ],
                                                 slots: [Slot(tone: -100, color: .white),
                                                         Slot(tone: -200, color: .white),
                                                         Slot(tone: -800, color: .white),
                                                         Slot(tone: -500, color: .white)
                                            ])
                                    
        ])
    
}
