//
//  Characters.swift
//  Charles
//
//  Created by Jacob Foster Davis on 5/10/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation
import UIKit



struct Characters {
    
    /******************************************************/
    /*******************///MARK: Functions
    /******************************************************/

    
    /******************************************************/
    /*******************///MARK: Groups of Characters
    /******************************************************/
    static let ValidCharacters: [Character] = [Dan, LittleJimmy, Benton, Charles, Fred, Stanley, Laura, Matthew]
    static let NewPlayerCharacterSet: [Character] = [Dan]
    static let AlwaysUnlockedSet: [Character] = NewPlayerCharacterSet
    static let UnlockableCharacters: [Character] = [LittleJimmy, Benton, Charles, Fred, Stanley, Laura, Matthew]
    
    /******************************************************/
    /*******************///MARK: Characters
    /******************************************************/

    // MARK: Charles
    static let Charles = Character(name: "Charles",
                                   topRadius: 30,
                                   bottomRadius: 15,
                                   price: 10200,
                                   hoursUnlocked: 3,
                                   levelEligibleAt: 4,
                                   phrases: [Phrase(name: "I'm a pimp",
                                                    likelihood: 60,
                                                    subphrases: [Subphrase(words: "I'm", audioFilePath: Bundle.main.path(forResource: "I'm", ofType: "m4a", inDirectory: "Audio/Charles")),
                                                                 Subphrase(words: "a", audioFilePath: Bundle.main.path(forResource: "A", ofType: "m4a", inDirectory: "Audio/Charles")),
                                                                 Subphrase(words: "pimp", audioFilePath: Bundle.main.path(forResource: "Pimp", ofType: "m4a", inDirectory: "Audio/Charles"))
                                                ],
                                                    slots: [Slot(tone: 500, color: .blue),
                                                            Slot(tone: 200, color: .black),
                                                            Slot(tone: -200, color: .green)
                                                ]),
                                             Phrase(name: "I'm a playa",
                                                    likelihood: 65,
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
                                                    likelihood: 40,
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
                               topRadius: 20,
                               bottomRadius: 10,
                               price: 0,
                               hoursUnlocked: 1,
                               levelEligibleAt: 1,
                               phrases: [Phrase(name: "Pawned his head",
                                                likelihood: 91,
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
                                                    likelihood: 94,
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
                                                    likelihood: 92,
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
                                price: 10200,
                                hoursUnlocked: 3,
                                levelEligibleAt: 4,
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
                                                likelihood: 40,
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
                                                likelihood: 65,
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
                                  hoursUnlocked: 4,
                                  levelEligibleAt: 1,
                                phrases: [Phrase(name: "Oh Tessa You're So Cute",
                                                 likelihood: 90,
                                                 subphrases: [Subphrase(words: "Oh", audioFilePath: Bundle.main.path(forResource: "Oh", ofType: "m4a", inDirectory: "Audio/Benton")),
                                                              Subphrase(words: "Tessa", audioFilePath: Bundle.main.path(forResource: "Tessa", ofType: "m4a", inDirectory: "Audio/Benton")),
                                                              Subphrase(words: "You're", audioFilePath: Bundle.main.path(forResource: "You're2", ofType: "m4a", inDirectory: "Audio/Benton")),
                                                              Subphrase(words: "So", audioFilePath: Bundle.main.path(forResource: "So", ofType: "m4a", inDirectory: "Audio/Benton")),
                                                              Subphrase(words: "Cute", audioFilePath: Bundle.main.path(forResource: "Cute", ofType: "m4a", inDirectory: "Audio/Benton"))
                                            ],
                                                 slots: [Slot(tone: -400, color: .white),
                                                         Slot(tone: -300, color: .red),
                                                         Slot(tone: -250, color: .white),
                                                         Slot(tone: -350, color: .white)
                                            ]),
                                          Phrase(name: "You Know You're Not As Dumb As You Look",
                                                 likelihood: 95,
                                                 subphrases: [Subphrase(words: "You", audioFilePath: Bundle.main.path(forResource: "You", ofType: "m4a", inDirectory: "Audio/Benton")),
                                                              Subphrase(words: "Know", audioFilePath: Bundle.main.path(forResource: "Know", ofType: "m4a", inDirectory: "Audio/Benton")),
                                                              Subphrase(words: "You're", audioFilePath: Bundle.main.path(forResource: "You're", ofType: "m4a", inDirectory: "Audio/Benton")),
                                                              Subphrase(words: "Not", audioFilePath: Bundle.main.path(forResource: "Not", ofType: "m4a", inDirectory: "Audio/Benton")),
                                                              Subphrase(words: "As", audioFilePath: Bundle.main.path(forResource: "As", ofType: "m4a", inDirectory: "Audio/Benton")),
                                                              Subphrase(words: "Dumb", audioFilePath: Bundle.main.path(forResource: "Dumb", ofType: "m4a", inDirectory: "Audio/Benton")),
                                                              Subphrase(words: "As", audioFilePath: Bundle.main.path(forResource: "As2", ofType: "m4a", inDirectory: "Audio/Benton")),
                                                              Subphrase(words: "You", audioFilePath: Bundle.main.path(forResource: "You2", ofType: "m4a", inDirectory: "Audio/Benton")),
                                                              Subphrase(words: "Look", audioFilePath: Bundle.main.path(forResource: "Look", ofType: "m4a", inDirectory: "Audio/Benton"))
                                            ], slots: [Slot(tone: -350, color: .white),
                                                       Slot(tone: -200, color: .orange),
                                                       Slot(tone: -150, color: .orange),
                                                       Slot(tone: -150, color: .white),
                                                       Slot(tone: -250, color: .white)
                                                
                                            ]),
                                          Phrase(name: "Laugh", //this is funny because it awards no base points.  Cuts you deep!
                                                 likelihood: 100,
                                                 subphrases: [Subphrase(words: "Ha Ha Ha Ha", audioFilePath: Bundle.main.path(forResource: "Laugh", ofType: "m4a", inDirectory: "Audio/Benton"))
                                            ], slots: [Slot(tone: -250, color: .blue),
                                                       Slot(tone: -600, color: .white),
                                                       Slot(tone: -350, color: .white)
                                            ]),
                                          Phrase(name: "You're So Cute",
                                                 likelihood: 95,
                                                 subphrases: [Subphrase(words: "You're", audioFilePath: Bundle.main.path(forResource: "You're2", ofType: "m4a", inDirectory: "Audio/Benton")),
                                                              Subphrase(words: "So", audioFilePath: Bundle.main.path(forResource: "So", ofType: "m4a", inDirectory: "Audio/Benton")),
                                                              Subphrase(words: "Cute", audioFilePath: Bundle.main.path(forResource: "Cute", ofType: "m4a", inDirectory: "Audio/Benton"))
                                            ],
                                                 slots: [Slot(tone: -100, color: .white),
                                                         Slot(tone: -200, color: .white),
                                                         Slot(tone: -300, color: .white),
                                                         Slot(tone: -350, color: .white)
                                            ])
                                    
        ])
    
    static let Laura = Character(name: "Laura",
                                  topRadius: 50,
                                  bottomRadius: 25,
                                  price: 5000,
                                  hoursUnlocked: 5,
                                  levelEligibleAt: 7,
                                  phrases: [Phrase(name: "Rookie",
                                                   likelihood: 20,
                                                   subphrases: [Subphrase(words: "Rookie!", audioFilePath: Bundle.main.path(forResource: "Rookie", ofType: "m4a", inDirectory: "Audio/Laura"))
                                    ],
                                                   slots: [//Slot(tone: 700, color: .red),
                                                            Slot(tone: 700, color: UIColor(red: 29/255, green: 43/255, blue: 145/255, alpha: 1)),
                                                           Slot(tone: 650, color: .white),
                                                           Slot(tone: 600, color: UIColor(red: 73/255, green: 29/255, blue: 145/255, alpha: 1)),
                                                           Slot(tone: 550, color: .white),
                                                           Slot(tone: 500, color: UIColor(red: 29/255, green: 101/255, blue: 145/255, alpha: 1))
                                    ]),
                                            Phrase(name: "Thomas",
                                                   likelihood: 20,
                                                   subphrases: [Subphrase(words: "Thomas!", audioFilePath: Bundle.main.path(forResource: "Thomas", ofType: "m4a", inDirectory: "Audio/Laura"))
                                                ], slots: [Slot(tone: 900, color: UIColor(red: 131/255, green: 29/255, blue: 145/255, alpha: 1)),
                                                           Slot(tone: 450, color: .white),
                                                           Slot(tone: 400, color: UIColor(red: 43/255, green: 145/255, blue: 29/255, alpha: 1)),
                                                           Slot(tone: 350, color: .white),
                                                           Slot(tone: 300, color: UIColor(red: 29/255, green: 43/255, blue: 145/255, alpha: 1))
                                                    
                                                ]),
                                            Phrase(name: "BlahBlah",
                                                   likelihood: 15,
                                                   subphrases: [Subphrase(words: "Blahlahlalhhdhhlalhlahlha", audioFilePath: Bundle.main.path(forResource: "BlahBlah", ofType: "m4a", inDirectory: "Audio/Laura"))
                                                ], slots: [Slot(tone: 300, color: UIColor(red: 23/255, green: 29/255, blue: 74/255, alpha: 1)),
                                                           Slot(tone: 450, color: .white),
                                                           Slot(tone: 700, color: UIColor(red: 23/255, green: 29/255, blue: 74/255, alpha: 1)),
                                                           Slot(tone: 200, color: UIColor(red: 23/255, green: 29/255, blue: 74/255, alpha: 1)),
                                                           Slot(tone: 250, color: UIColor(red: 23/255, green: 29/255, blue: 74/255, alpha: 1)),
                                                           Slot(tone: 300, color: UIColor(red: 23/255, green: 29/255, blue: 74/255, alpha: 1))
                                                ]),
                                            Phrase(name: "I'm Not Even Tired Zzzz",
                                                   likelihood: 20,
                                                   subphrases: [Subphrase(words: "I'm", audioFilePath: Bundle.main.path(forResource: "I'm", ofType: "m4a", inDirectory: "Audio/Laura")),
                                                                Subphrase(words: "Not", audioFilePath: Bundle.main.path(forResource: "Not", ofType: "m4a", inDirectory: "Audio/Laura")),
                                                                Subphrase(words: "Even", audioFilePath: Bundle.main.path(forResource: "Even", ofType: "m4a", inDirectory: "Audio/Laura")),
                                                                Subphrase(words: "Tired", audioFilePath: Bundle.main.path(forResource: "Tired", ofType: "m4a", inDirectory: "Audio/Laura")),
                                                                Subphrase(words: "Zzzzzzzzz  z z zzzzz z", audioFilePath: Bundle.main.path(forResource: "Zzzz", ofType: "m4a", inDirectory: "Audio/Laura"))
                                                ],
                                                   slots: [Slot(tone: 350, color: UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)),
                                                           Slot(tone: 300, color: UIColor(red: 250/255, green: 100/255, blue: 175/255, alpha: 1)),
                                                           
                                                           Slot(tone: 400, color: UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)),
                                                           Slot(tone: 250, color: UIColor(red: 175/255, green: 250/255, blue: 100/255, alpha: 1)),
                                                           Slot(tone: 350, color: UIColor(red: 175/255, green: 250/255, blue: 100/255, alpha: 1)),
                                                           Slot(tone: -400, color: UIColor(red: 175/255, green: 250/255, blue: 100/255, alpha: 1))
                                                ])
                                    
        ])
    
    
    static let LittleJimmy = Character(name: "Little Jimmy",
                                  topRadius: 111,
                                  bottomRadius: 5,
                                  price: 250,
                                  hoursUnlocked: 6,
                                  levelEligibleAt: 1,
                                  phrases: [Phrase(name: "Gee Golly Mister",
                                                   likelihood: 87,
                                                   subphrases: [Subphrase(words: "Gee", audioFilePath: Bundle.main.path(forResource: "Gee", ofType: "m4a", inDirectory: "Audio/LittleJimmy")),
                                                                Subphrase(words: "Golly", audioFilePath: Bundle.main.path(forResource: "Golly!", ofType: "m4a", inDirectory: "Audio/LittleJimmy")),
                                                                Subphrase(words: "Mister", audioFilePath: Bundle.main.path(forResource: "Mister", ofType: "m4a", inDirectory: "Audio/LittleJimmy"))
                                    ],
                                                   slots: [Slot(tone: 150, color: .black),
                                                           Slot(tone: 150, color: .red),
                                                           Slot(tone: 150, color: .red),
                                                           Slot(tone: 200, color: .blue),
                                                           Slot(tone: 200, color: .blue),
                                                           Slot(tone: 300, color: .red),
                                                           Slot(tone: 300, color: .red),
                                                           Slot(tone: 175, color: .blue),
                                                           Slot(tone: 175, color: .blue)
                                    ]),
                                            Phrase(name: "Bang Bang You're Dead",
                                                   likelihood: 80,
                                                   subphrases: [Subphrase(words: "Bang", audioFilePath: Bundle.main.path(forResource: "Bang1", ofType: "m4a", inDirectory: "Audio/LittleJimmy")),
                                                                Subphrase(words: "Bang!", audioFilePath: Bundle.main.path(forResource: "Bang2", ofType: "m4a", inDirectory: "Audio/LittleJimmy")),
                                                                Subphrase(words: "You're", audioFilePath: Bundle.main.path(forResource: "You're", ofType: "m4a", inDirectory: "Audio/LittleJimmy")),
                                                                Subphrase(words: "Dead", audioFilePath: Bundle.main.path(forResource: "Dead", ofType: "m4a", inDirectory: "Audio/LittleJimmy"))
                                                ],
                                                   slots: [Slot(tone: 237, color: .black),
                                                           Slot(tone: 200, color: .green),
                                                           Slot(tone: 200, color: .green),
                                                           Slot(tone: 225, color: .red),
                                                           Slot(tone: 225, color: .red),
                                                           Slot(tone: 215, color: .blue),
                                                           Slot(tone: 215, color: .blue)
                                                    
                                                ]),
                                            Phrase(name: "Ouch that really hurt",
                                                   likelihood: 85,
                                                   subphrases: [Subphrase(words: "Ouch!", audioFilePath: Bundle.main.path(forResource: "Ouch", ofType: "m4a", inDirectory: "Audio/LittleJimmy")),
                                                                Subphrase(words: "That", audioFilePath: Bundle.main.path(forResource: "That", ofType: "m4a", inDirectory: "Audio/LittleJimmy")),
                                                                Subphrase(words: "Really", audioFilePath: Bundle.main.path(forResource: "Really", ofType: "m4a", inDirectory: "Audio/LittleJimmy")),
                                                                Subphrase(words: "Hurt", audioFilePath: Bundle.main.path(forResource: "Hurt", ofType: "m4a", inDirectory: "Audio/LittleJimmy"))
                                                ],
                                                   slots: [Slot(tone: 200, color: .black),
                                                           Slot(tone: 210, color: .green),
                                                           Slot(tone: 210, color: .green),
                                                           Slot(tone: 300, color: .white),
                                                           Slot(tone: 475, color: .blue),
                                                           Slot(tone: 475, color: .blue),
                                                           Slot(tone: 475, color: .blue)
                                                ]),
                                            Phrase(name: "Can I have some ice cream?",
                                                   likelihood: 85,
                                                   subphrases: [Subphrase(words: "Can", audioFilePath: Bundle.main.path(forResource: "Can", ofType: "m4a", inDirectory: "Audio/LittleJimmy")),
                                                                Subphrase(words: "I", audioFilePath: Bundle.main.path(forResource: "I", ofType: "m4a", inDirectory: "Audio/LittleJimmy")),
                                                                Subphrase(words: "Have", audioFilePath: Bundle.main.path(forResource: "Have", ofType: "m4a", inDirectory: "Audio/LittleJimmy")),
                                                                Subphrase(words: "Some", audioFilePath: Bundle.main.path(forResource: "Some", ofType: "m4a", inDirectory: "Audio/LittleJimmy")),
                                                                Subphrase(words: "Ice Cream?", audioFilePath: Bundle.main.path(forResource: "IceCream?", ofType: "m4a", inDirectory: "Audio/LittleJimmy"))
                                                ],
                                                   slots: [Slot(tone: 330, color: .black),
                                                           Slot(tone: 450, color: .cyan),
                                                           Slot(tone: 380, color: .red),
                                                           Slot(tone: 375, color: .white),
                                                           Slot(tone: 475, color: .white),
                                                           Slot(tone: 395, color: .green),
                                                           Slot(tone: 385, color: .yellow),
                                                           Slot(tone: 725, color: .blue)
                                                ]),
                                            Phrase(name: "Wooo hooo",
                                                   likelihood: 80,
                                                   subphrases: [Subphrase(words: "Wooooo   Hoooooooo!", audioFilePath: Bundle.main.path(forResource: "Whoohoo", ofType: "m4a", inDirectory: "Audio/LittleJimmy"))
                                                ],
                                                   slots: [Slot(tone: 430, color: .black),
                                                           Slot(tone: 350, color: .red),
                                                           Slot(tone: 380, color: .red),
                                                           Slot(tone: 275, color: .red),
                                                           Slot(tone: 275, color: .red),
                                                           Slot(tone: 395, color: .red),
                                                           Slot(tone: 285, color: .red),
                                                           Slot(tone: 275, color: .red)
                                                ])
                                    
        ])
    
    static let Stanley = Character(name: "Stanley",
                                       topRadius: 80,
                                       bottomRadius: 50,
                                       price: 9000,
                                       hoursUnlocked: 1,
                                       levelEligibleAt: 5,
                                       phrases: [Phrase(name: "Back in my day",
                                                        likelihood: 50,
                                                        subphrases: [Subphrase(words: "Back", audioFilePath: Bundle.main.path(forResource: "Back", ofType: "m4a", inDirectory: "Audio/Stanley")),
                                                                     Subphrase(words: "In", audioFilePath: Bundle.main.path(forResource: "In", ofType: "m4a", inDirectory: "Audio/Stanley")),
                                                                     Subphrase(words: "My", audioFilePath: Bundle.main.path(forResource: "My", ofType: "m4a", inDirectory: "Audio/Stanley")),
                                                                     Subphrase(words: "Day", audioFilePath: Bundle.main.path(forResource: "Day", ofType: "m4a", inDirectory: "Audio/Stanley"))
                                        ],
                                                        slots: [Slot(tone: 50, color: .brown),
                                                                Slot(tone: 20, color: UIColor(red: 125/255, green: 84/255, blue: 31/255, alpha: 1)),
                                                                Slot(tone: 40, color: UIColor(red: 125/255, green: 61/255, blue: 31/255, alpha: 1)),
                                                                Slot(tone: 40, color: UIColor(red: 125/255, green: 61/255, blue: 31/255, alpha: 1)),
                                                                Slot(tone: 40, color: UIColor(red: 125/255, green: 61/255, blue: 31/255, alpha: 1)),
                                                                Slot(tone: -30, color: UIColor(red: 125/255, green: 61/255, blue: 31/255, alpha: 1)),
                                                                Slot(tone: -40, color: UIColor(red: 125/255, green: 61/255, blue: 31/255, alpha: 1)),
                                                                Slot(tone: -50, color: UIColor(red: 125/255, green: 61/255, blue: 31/255, alpha: 1)),
                                                                Slot(tone: -30, color: UIColor(red: 125/255, green: 61/255, blue: 31/255, alpha: 1)),
                                                                Slot(tone: -20, color: UIColor(red: 125/255, green: 61/255, blue: 31/255, alpha: 1)),
                                                                 Slot(tone: -20, color: UIColor(red: 125/255, green: 61/255, blue: 31/255, alpha: 1)),
                                                                Slot(tone: -100, color: .black)
                                        ]),
                                                 Phrase(name: "Huh",
                                                        likelihood: 60,
                                                        subphrases: [Subphrase(words: "Huh?", audioFilePath: Bundle.main.path(forResource: "Huh", ofType: "m4a", inDirectory: "Audio/Stanley"))
                                                    ],
                                                        slots: [Slot(tone: 50, color: .brown),
                                                                Slot(tone: -30, color: UIColor(red: 125/255, green: 84/255, blue: 31/255, alpha: 1)),
                                                                Slot(tone: -50, color: UIColor(red: 43/255, green: 31/255, blue: 125/255, alpha: 1)),
                                                                Slot(tone: -50, color: UIColor(red: 43/255, green: 31/255, blue: 125/255, alpha: 1)),
                                                                Slot(tone: -50, color: UIColor(red: 43/255, green: 31/255, blue: 125/255, alpha: 1)),
                                                                Slot(tone: -50, color: UIColor(red: 43/255, green: 31/255, blue: 125/255, alpha: 1)),
                                                                Slot(tone: 20, color: UIColor(red: 125/255, green: 108/255, blue: 31/255, alpha: 1)),
                                                                Slot(tone: 20, color: UIColor(red: 125/255, green: 108/255, blue: 31/255, alpha: 1)),
                                                                Slot(tone: 20, color: UIColor(red: 125/255, green: 108/255, blue: 31/255, alpha: 1)),
                                                                Slot(tone: -30, color: UIColor(red: 125/255, green: 84/255, blue: 31/255, alpha: 1)),
                                                                Slot(tone: -30, color: UIColor(red: 125/255, green: 84/255, blue: 31/255, alpha: 1)),
                                                                
                                                                Slot(tone: -100, color: .black)
                                                            
                                                    ]),
                                                 Phrase(name: "What?",
                                                        likelihood: 60,
                                                        subphrases: [Subphrase(words: "What?", audioFilePath: Bundle.main.path(forResource: "What", ofType: "m4a", inDirectory: "Audio/Stanley"))
                                                    ],
                                                        slots: [Slot(tone: 50, color: .brown),
                                                                Slot(tone: -30, color: UIColor(red: 125/255, green: 84/255, blue: 31/255, alpha: 1)),
                                                               Slot(tone: -50, color: UIColor(red: 125/255, green: 31/255, blue: 125/255, alpha: 1)),
                                                                Slot(tone: -50, color: UIColor(red: 125/255, green: 31/255, blue: 125/255, alpha: 1)),
                                                                Slot(tone: -50, color: UIColor(red: 125/255, green: 31/255, blue: 125/255, alpha: 1)),
                                                                Slot(tone: -50, color: UIColor(red: 125/255, green: 31/255, blue: 125/255, alpha: 1)),
                                                                Slot(tone: 20, color: UIColor(red: 125/255, green: 108/255, blue: 31/255, alpha: 1)),
                                                                Slot(tone: 20, color: UIColor(red: 125/255, green: 108/255, blue: 31/255, alpha: 1)),
                                                                Slot(tone: 20, color: UIColor(red: 125/255, green: 108/255, blue: 31/255, alpha: 1)),
                                                                Slot(tone: -30, color: UIColor(red: 125/255, green: 84/255, blue: 31/255, alpha: 1)),
                                                                Slot(tone: -30, color: UIColor(red: 125/255, green: 84/255, blue: 31/255, alpha: 1)),
                                                                
                                                                Slot(tone: -100, color: .black)
                                                    ]),
                                                 Phrase(name: "What did you say?",
                                                        likelihood: 70,
                                                        subphrases: [Subphrase(words: "What?", audioFilePath: Bundle.main.path(forResource: "What", ofType: "m4a", inDirectory: "Audio/Stanley")),
                                                                     Subphrase(words: "did", audioFilePath: Bundle.main.path(forResource: "Did", ofType: "m4a", inDirectory: "Audio/Stanley")),
                                                                     Subphrase(words: "You", audioFilePath: Bundle.main.path(forResource: "You", ofType: "m4a", inDirectory: "Audio/Stanley")),
                                                                     Subphrase(words: "Say", audioFilePath: Bundle.main.path(forResource: "Say?", ofType: "m4a", inDirectory: "Audio/Stanley"))
                                                    ],
                                                        slots: [Slot(tone: 50, color: .brown),
                                                                Slot(tone: -30, color: UIColor(red: 125/255, green: 84/255, blue: 31/255, alpha: 1)),
                                                                Slot(tone: -50, color: UIColor(red: 125/255, green: 31/255, blue: 125/255, alpha: 1)),
                                                                Slot(tone: -50, color: UIColor(red: 125/255, green: 31/255, blue: 125/255, alpha: 1)),
                                                                Slot(tone: -50, color: UIColor(red: 125/255, green: 31/255, blue: 125/255, alpha: 1)),
                                                                Slot(tone: -50, color: UIColor(red: 125/255, green: 31/255, blue: 125/255, alpha: 1)),
                                                                Slot(tone: 20, color: UIColor(red: 125/255, green: 108/255, blue: 31/255, alpha: 1)),
                                                                Slot(tone: 20, color: UIColor(red: 125/255, green: 108/255, blue: 31/255, alpha: 1)),
                                                                Slot(tone: 20, color: UIColor(red: 125/255, green: 108/255, blue: 31/255, alpha: 1)),
                                                                Slot(tone: -30, color: UIColor(red: 125/255, green: 84/255, blue: 31/255, alpha: 1)),
                                                                Slot(tone: -30, color: UIColor(red: 125/255, green: 84/255, blue: 31/255, alpha: 1)),
                                                                
                                                                Slot(tone: -100, color: .black)
                                                    ])
                                        
        ])
    
    static let Matthew = Character(name: "Matthew",
                                   topRadius: 10,
                                   bottomRadius: 10,
                                   price: 55000,
                                   hoursUnlocked: 2,
                                   levelEligibleAt: 12,
                                   phrases: [Phrase(name: "Maybe I should just take my shirt off", //he will have his shirt off in the store!
                                                    likelihood: 55,
                                                    subphrases: [Subphrase(words: "Maybe", audioFilePath: Bundle.main.path(forResource: "Maybe", ofType: "m4a", inDirectory: "Audio/Matthew")),
                                                                 Subphrase(words: "I", audioFilePath: Bundle.main.path(forResource: "I", ofType: "m4a", inDirectory: "Audio/Matthew")),
                                                                 Subphrase(words: "Should", audioFilePath: Bundle.main.path(forResource: "Should", ofType: "m4a", inDirectory: "Audio/Matthew")),
                                                                 Subphrase(words: "Just", audioFilePath: Bundle.main.path(forResource: "Just", ofType: "m4a", inDirectory: "Audio/Matthew")),
                                                                 Subphrase(words: "Take", audioFilePath: Bundle.main.path(forResource: "Take", ofType: "m4a", inDirectory: "Audio/Matthew")),
                                                                 Subphrase(words: "My", audioFilePath: Bundle.main.path(forResource: "My", ofType: "m4a", inDirectory: "Audio/Matthew")),
                                                                 Subphrase(words: "Shirt", audioFilePath: Bundle.main.path(forResource: "Shirt", ofType: "m4a", inDirectory: "Audio/Matthew")),
                                                                 Subphrase(words: "Off", audioFilePath: Bundle.main.path(forResource: "Off", ofType: "m4a", inDirectory: "Audio/Matthew"))
                                    ],
                                                    slots: [
                                                        Slot(tone: 50, color: UIColor(red: 230/255, green: 201/255, blue: 166/255, alpha: 1)),
                                                        Slot(tone: 75, color: UIColor(red: 230/255, green: 201/255, blue: 166/255, alpha: 1)),
                                                        Slot(tone: 400, color: UIColor(red: 230/255, green: 201/255, blue: 166/255, alpha: 1)),
                                                        Slot(tone: -50, color: UIColor(red: 111/255, green: 147/255, blue: 232/255, alpha: 1)),
                                                        Slot(tone: -150, color: UIColor(red: 111/255, green: 147/255, blue: 232/255, alpha: 1)),
                                                        Slot(tone: -400, color: UIColor(red: 111/255, green: 147/255, blue: 232/255, alpha: 1))
                                    ]),
                                             Phrase(name: "All right all right all right 1",
                                                    likelihood: 35,
                                                    subphrases: [Subphrase(words: "All right all right all right", audioFilePath: Bundle.main.path(forResource: "AllRightAllRight", ofType: "m4a", inDirectory: "Audio/Matthew"))
                                    ],
                                                    slots: [
                                                        
                                                        Slot(tone: -300, color: UIColor(red: 107/255, green: 102/255, blue: 96/255, alpha: 1)),
                                                        Slot(tone: 100, color: UIColor(red: 107/255, green: 107/255, blue: 96/255, alpha: 1)),
                                                        Slot(tone: -100, color: UIColor(red: 96/255, green: 96/255, blue: 107/255, alpha: 1)),
                                                        Slot(tone: 300, color: UIColor(red: 107/255, green: 96/255, blue: 107/255, alpha: 1))
                                                        
                                    ]),
                                             Phrase(name: "All right",
                                                    likelihood: 30,
                                                    subphrases: [Subphrase(words: "Alllll riiight", audioFilePath: Bundle.main.path(forResource: "AllRight", ofType: "m4a", inDirectory: "Audio/Matthew"))
                                    ],
                                                    slots: [
                                                            Slot(tone: 400, color: UIColor(red: 250/255, green: 225/255, blue: 5/255, alpha: 1)),
                                                            Slot(tone: 300, color: UIColor(red: 201/255, green: 5/255, blue: 250/255, alpha: 1)),
                                                            Slot(tone: -100, color: UIColor(red: 250/255, green: 5/255, blue: 54/255, alpha: 1)),
                                                            Slot(tone: -300, color: UIColor(red: 54/255, green: 250/255, blue: 5/255, alpha: 1))
                                    ]),
                                             
                                             Phrase(name: "All right all right all right 2",
                                                    likelihood: 50,
                                                    subphrases: [Subphrase(words: "All right all right all right", audioFilePath: Bundle.main.path(forResource: "AllRightAllRight2", ofType: "m4a", inDirectory: "Audio/Matthew"))
                                                ],
                                                    slots: [
                                                        
                                                        Slot(tone: -50, color: UIColor(red: 232/255, green: 63/255, blue: 37/255, alpha: 1)),
                                                        Slot(tone: 200, color: UIColor(red: 107/255, green: 107/255, blue: 96/255, alpha: 1)),
                                                        Slot(tone: 50, color: UIColor(red: 96/255, green: 96/255, blue: 107/255, alpha: 1)),
                                                        Slot(tone: 400, color: UIColor(red: 107/255, green: 96/255, blue: 107/255, alpha: 1))
                                                ])
                                             
                                    
        ])
    
}
