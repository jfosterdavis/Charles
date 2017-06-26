//
//  Characters.swift
//  Charles
//
//  Created by Jacob Foster Davis on 5/10/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
///

import Foundation
import UIKit



struct Characters {
    
    /******************************************************/
    /*******************///MARK: Functions
    /******************************************************/

    
    /******************************************************/
    /*******************///MARK: Groups of Characters
    /******************************************************/
    static let ValidCharacters: [Character] = [Dan, Benton, LittleJimmy,  Laura, Charles, Fred, StanleyJr, Stanley, Matthew, John, R0berte]
    static let NewPlayerCharacterSet: [Character] = [Dan]
    static let AlwaysUnlockedSet: [Character] = NewPlayerCharacterSet
    static let UnlockableCharacters: [Character] = [Benton, LittleJimmy,  Laura, Charles, Fred, StanleyJr, Stanley,  Matthew,  John, R0berte]
    
    /******************************************************/
    /*******************///MARK: Characters
    /******************************************************/

    // MARK: Charles
    static let Charles = Character(name: "Charles",
                                   topRadius: 30,
                                   bottomRadius: 15,
                                   price: 10200,
                                   hoursUnlocked: 96,
                                   levelEligibleAt: 15,
                                   phrases: [Phrase(name: "I'm a pimp",
                                                    likelihood: 30,
                                                    subphrases: [Subphrase(words: "I'm", audioFilePath: Bundle.main.path(forResource: "I'm", ofType: "m4a", inDirectory: "Audio/Charles")),
                                                                 Subphrase(words: "a", audioFilePath: Bundle.main.path(forResource: "A", ofType: "m4a", inDirectory: "Audio/Charles")),
                                                                 Subphrase(words: "pimp", audioFilePath: Bundle.main.path(forResource: "Pimp", ofType: "m4a", inDirectory: "Audio/Charles"))
                                                ],
                                                    slots: [Slot(tone: 500, color: .blue),
                                                            Slot(tone: 200, color: .black),
                                                            Slot(tone: -200, color: .green)
                                                ]),
                                             Phrase(name: "I'm a playa",
                                                    likelihood: 25,
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
                                                likelihood: 88,
                                                subphrases: [Subphrase(words: "Pawned", audioFilePath: Bundle.main.path(forResource: "Pawned", ofType: "m4a", inDirectory: "Audio/Dan")),
                                                             Subphrase(words: "his", audioFilePath: Bundle.main.path(forResource: "His", ofType: "m4a", inDirectory: "Audio/Dan")),
                                                             Subphrase(words: "Head", audioFilePath: Bundle.main.path(forResource: "Head", ofType: "m4a", inDirectory: "Audio/Dan"))
                                ],
                                                slots: [Slot(tone: 300, color: .white),
                                                        Slot(tone: 300, color: .green),
                                                        Slot(tone: 300, color: .green),
                                                        Slot(tone: 600, color: .blue),
                                                        Slot(tone: 600, color: .blue),
                                                        Slot(tone: -600, color: .orange),
                                                        Slot(tone: -600, color: .orange),
                                                        Slot(tone: -300, color: .red),
                                                        Slot(tone: -300, color: .red),
                                                        Slot(tone: -375, color: .black),
                                ]),
                                         Phrase(name: "N00b!",
                                                    likelihood: 90,
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
                                                    likelihood: 88,
                                                    subphrases: [Subphrase(words: "That's", audioFilePath: Bundle.main.path(forResource: "That's", ofType: "m4a", inDirectory: "Audio/Dan")),
                                                                 Subphrase(words: "a", audioFilePath: Bundle.main.path(forResource: "A (pawn)", ofType: "m4a", inDirectory: "Audio/Dan")),
                                                                 Subphrase(words: "pawn", audioFilePath: Bundle.main.path(forResource: "Pawn", ofType: "m4a", inDirectory: "Audio/Dan"))
                                                ], slots: [Slot(tone: 600, color: .black),
                                                           Slot(tone: 600, color: .black),
                                                            Slot(tone: 550, color: .red),
                                                           Slot(tone: 550, color: .yellow),
                                                           Slot(tone: 550, color: .green),
                                                           Slot(tone: 300, color: .cyan),
                                                           Slot(tone: 300, color: .blue),
                                                           Slot(tone: 300, color: .magenta),
                                                           Slot(tone: -250, color: .red),
                                                           Slot(tone: -250, color: .white)
                                                ])
                                    
        ])
    
    // MARK: Unlockable Characters
    /// MARK: Fred
    static let Fred = Character(name: "Fred",
                                topRadius: 15,
                                bottomRadius: 15,
                                price: 10200,
                                hoursUnlocked: 96,
                                levelEligibleAt: 15,
                               phrases: [Phrase(name: "You're not the boss of me.",
                                                likelihood: 50,
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
                                                likelihood: 30,
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
                                                likelihood: 45,
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
                                                likelihood: 45,
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
                                  levelEligibleAt: 2,
                                phrases: [Phrase(name: "Oh Tessa You're So Cute",
                                                 likelihood: 92,
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
                                          Phrase(name: "You're Not As Dumb As You Look",
                                                 likelihood: 95,
                                                 subphrases: [
//                                                    Subphrase(words: "You", audioFilePath: Bundle.main.path(forResource: "You", ofType: "m4a", inDirectory: "Audio/Benton")),
//                                                              Subphrase(words: "Know", audioFilePath: Bundle.main.path(forResource: "Know", ofType: "m4a", inDirectory: "Audio/Benton")),
                                                              Subphrase(words: "You're", audioFilePath: Bundle.main.path(forResource: "You're", ofType: "m4a", inDirectory: "Audio/Benton")),
                                                              Subphrase(words: "Not", audioFilePath: Bundle.main.path(forResource: "Not", ofType: "m4a", inDirectory: "Audio/Benton")),
                                                              Subphrase(words: "As", audioFilePath: Bundle.main.path(forResource: "As", ofType: "m4a", inDirectory: "Audio/Benton")),
                                                              Subphrase(words: "Dumb", audioFilePath: Bundle.main.path(forResource: "Dumb", ofType: "m4a", inDirectory: "Audio/Benton")),
                                                              Subphrase(words: "As", audioFilePath: Bundle.main.path(forResource: "As2", ofType: "m4a", inDirectory: "Audio/Benton")),
                                                              Subphrase(words: "You", audioFilePath: Bundle.main.path(forResource: "You2", ofType: "m4a", inDirectory: "Audio/Benton")),
                                                              Subphrase(words: "Look", audioFilePath: Bundle.main.path(forResource: "Look", ofType: "m4a", inDirectory: "Audio/Benton"))
                                            ], slots: [Slot(tone: -350, color: .white),
                                                       Slot(tone: -200, color: .orange),
                                                       Slot(tone: -250, color: .orange),
                                                       Slot(tone: -275, color: .white),
                                                       Slot(tone: -225, color: .white)
                                                
                                            ]),
                                          Phrase(name: "Laugh", //this is funny because it awards no base points.  Cuts you deep!
                                                 likelihood: 100,
                                                 subphrases: [Subphrase(words: "Ha Ha Ha Ha", audioFilePath: Bundle.main.path(forResource: "Laugh", ofType: "m4a", inDirectory: "Audio/Benton"))
                                            ], slots: [
                                                Slot(tone: -550, color: .white),
                                                Slot(tone: -450, color: .white),
                                                Slot(tone: -350, color: .white),
                                                Slot(tone: -250, color: .white)
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
                                  hoursUnlocked: 168,
                                  levelEligibleAt: 5,
                                  phrases: [Phrase(name: "Rookie",
                                                   likelihood: 60,
                                                   subphrases: [Subphrase(words: "Rookie!", audioFilePath: Bundle.main.path(forResource: "Rookie", ofType: "m4a", inDirectory: "Audio/Laura"))
                                    ],
                                                   slots: [//Slot(tone: 700, color: .red),
                                                            Slot(tone: 700, color: UIColor(red: 29/255, green: 43/255, blue: 145/255, alpha: 1)),
                                                           Slot(tone: 650, color: .white),
                                                           Slot(tone: 600, color: UIColor(red: 73/255, green: 29/255, blue: 145/255, alpha: 1)),
                                                           Slot(tone: 550, color: .white),
                                                           Slot(tone: 500, color: UIColor(red: 29/255, green: 101/255, blue: 145/255, alpha: 1))
                                    ]),
                                            Phrase(name: "Rookie Down 1",
                                                   likelihood: 60,
                                                   subphrases: [Subphrase(words: "Rookie", audioFilePath: Bundle.main.path(forResource: "Rookie2", ofType: "m4a", inDirectory: "Audio/Laura")),
                                                                Subphrase(words: "Down!", audioFilePath: Bundle.main.path(forResource: "Down2", ofType: "m4a", inDirectory: "Audio/Laura"))
                                                ],
                                                   slots: [
                                                    Slot(tone: 600, color: UIColor(red: 166/255, green: 73/255, blue: 36/255, alpha: 1)),
                                                    Slot(tone: 450, color: .white),
                                                    Slot(tone: 400, color: UIColor(red: 110/255, green: 36/255, blue: 166/255, alpha: 1)),
                                                    Slot(tone: 350, color: .white),
                                                    Slot(tone: 300, color: UIColor(red: 92/255, green: 166/255, blue: 36/255, alpha: 1))
                                                ]),
                                            Phrase(name: "Rookie Down 2",
                                                   likelihood: 60,
                                                   subphrases: [Subphrase(words: "Rookie", audioFilePath: Bundle.main.path(forResource: "Rookie3", ofType: "m4a", inDirectory: "Audio/Laura")),
                                                                Subphrase(words: "Down!", audioFilePath: Bundle.main.path(forResource: "Down3", ofType: "m4a", inDirectory: "Audio/Laura"))
                                                ],
                                                   slots: [Slot(tone: 650, color: .white),
                                                    Slot(tone: 600, color: UIColor(red: 166/255, green: 73/255, blue: 36/255, alpha: 1)),
                                                    Slot(tone: 550, color: .white),
                                                    Slot(tone: 500, color: UIColor(red: 166/255, green: 105/255, blue: 36/255, alpha: 1)),
                                                    Slot(tone: 450, color: .white),
                                                    Slot(tone: 400, color: UIColor(red: 166/255, green: 40/255, blue: 36/255, alpha: 1)),
                                                    Slot(tone: 450, color: .white)
                                                ]),
                                            Phrase(name: "I love you",
                                                   likelihood: 60,
                                                   subphrases: [Subphrase(words: "I", audioFilePath: Bundle.main.path(forResource: "I", ofType: "m4a", inDirectory: "Audio/Laura")),
                                                                Subphrase(words: "Love", audioFilePath: Bundle.main.path(forResource: "Love", ofType: "m4a", inDirectory: "Audio/Laura")),
                                                                Subphrase(words: "You", audioFilePath: Bundle.main.path(forResource: "You", ofType: "m4a", inDirectory: "Audio/Laura"))
                                                ],
                                                   slots: [
                                                           Slot(tone: 500, color: UIColor(red: 110/255, green: 36/255, blue: 166/255, alpha: 1)),
                                                           Slot(tone: 350, color: .white),
                                                           Slot(tone: 450, color: .white),
                                                           Slot(tone: 400, color: UIColor(red: 92/255, green: 166/255, blue: 36/255, alpha: 1)),
                                                           Slot(tone: 300, color: UIColor(red: 166/255, green: 73/255, blue: 36/255, alpha: 1))
                                                           
                                                ]),
//                                            Phrase(name: "Thomas",
//                                                   likelihood: 60,
//                                                   subphrases: [Subphrase(words: "Thomas!", audioFilePath: Bundle.main.path(forResource: "Thomas", ofType: "m4a", inDirectory: "Audio/Laura"))
//                                                ], slots: [Slot(tone: 900, color: UIColor(red: 131/255, green: 29/255, blue: 145/255, alpha: 1)),
//                                                           Slot(tone: 450, color: .white),
//                                                           Slot(tone: 400, color: UIColor(red: 43/255, green: 145/255, blue: 29/255, alpha: 1)),
//                                                           Slot(tone: 350, color: .white),
//                                                           Slot(tone: 300, color: UIColor(red: 29/255, green: 43/255, blue: 145/255, alpha: 1))
//                                                    
//                                                ]),
                                            Phrase(name: "Hellow Sweetheart",
                                                   likelihood: 55,
                                                   subphrases: [Subphrase(words: "Hello", audioFilePath: Bundle.main.path(forResource: "Hello", ofType: "m4a", inDirectory: "Audio/Laura")),
                                                                Subphrase(words: "Sweetheart", audioFilePath: Bundle.main.path(forResource: "Sweetheart", ofType: "m4a", inDirectory: "Audio/Laura"))
                                                ], slots: [Slot(tone: 300, color: UIColor(red: 23/255, green: 29/255, blue: 74/255, alpha: 1)),
                                                           Slot(tone: 450, color: .white),
                                                           Slot(tone: 700, color: UIColor(red: 23/255, green: 29/255, blue: 74/255, alpha: 1)),
                                                           Slot(tone: 200, color: UIColor(red: 23/255, green: 29/255, blue: 74/255, alpha: 1)),
                                                           Slot(tone: 250, color: UIColor(red: 23/255, green: 29/255, blue: 74/255, alpha: 1)),
                                                           Slot(tone: 300, color: UIColor(red: 23/255, green: 29/255, blue: 74/255, alpha: 1))
                                                ]),
                                            Phrase(name: "BlahBlah",
                                                   likelihood: 55,
                                                   subphrases: [Subphrase(words: "Blahlahlalhhdhhlalhlahlha", audioFilePath: Bundle.main.path(forResource: "BlahBlah", ofType: "m4a", inDirectory: "Audio/Laura"))
                                                ], slots: [Slot(tone: 600, color: .black),
                                                           Slot(tone: 550, color: .red),
                                                           Slot(tone: 550, color: .yellow),
                                                           Slot(tone: 550, color: .green),
                                                           Slot(tone: 450, color: .black),
                                                           Slot(tone: 300, color: .cyan),
                                                           Slot(tone: 400, color: .blue),
                                                           Slot(tone: 425, color: .magenta),
                                                           Slot(tone: -250, color: .red),
                                                           Slot(tone: 575, color: .black)
                                                ]),
                                            Phrase(name: "I'm Not Even Tired Zzzz",
                                                   likelihood: 60,
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
                                  hoursUnlocked: 1,
                                  levelEligibleAt: 3, //3
                                  phrases: [Phrase(name: "Gee Golly Mister",
                                                   likelihood: 82,
                                                   subphrases: [Subphrase(words: "Gee", audioFilePath: Bundle.main.path(forResource: "Gee", ofType: "m4a", inDirectory: "Audio/LittleJimmy")),
                                                                Subphrase(words: "Golly", audioFilePath: Bundle.main.path(forResource: "Golly!", ofType: "m4a", inDirectory: "Audio/LittleJimmy")),
                                                                Subphrase(words: "Mister", audioFilePath: Bundle.main.path(forResource: "Mister", ofType: "m4a", inDirectory: "Audio/LittleJimmy"))
                                    ],
                                                   slots: [Slot(tone: 200, color: .black),
                                                           Slot(tone: 220, color: .red),
                                                           Slot(tone: 240, color: .red),
                                                           Slot(tone: 200, color: .blue),
                                                           Slot(tone: 200, color: .blue),
                                                           Slot(tone: 300, color: .red),
                                                           Slot(tone: 300, color: .red),
                                                           Slot(tone: 280, color: .blue),
                                                           Slot(tone: 320, color: .blue)
                                    ]),
                                            Phrase(name: "Bang Bang You're Dead",
                                                   likelihood: 75,
                                                   subphrases: [Subphrase(words: "Bang", audioFilePath: Bundle.main.path(forResource: "Bang1", ofType: "m4a", inDirectory: "Audio/LittleJimmy")),
                                                                Subphrase(words: "Bang!", audioFilePath: Bundle.main.path(forResource: "Bang2", ofType: "m4a", inDirectory: "Audio/LittleJimmy")),
                                                                Subphrase(words: "You're", audioFilePath: Bundle.main.path(forResource: "You're", ofType: "m4a", inDirectory: "Audio/LittleJimmy")),
                                                                Subphrase(words: "Dead", audioFilePath: Bundle.main.path(forResource: "Dead", ofType: "m4a", inDirectory: "Audio/LittleJimmy"))
                                                ],
                                                   slots: [Slot(tone: 200, color: .black),
                                                           Slot(tone: 210, color: .green),
                                                           Slot(tone: 210, color: .green),
                                                           Slot(tone: 300, color: .magenta),
                                                           Slot(tone: 475, color: .blue),
                                                           Slot(tone: 475, color: .blue),
                                                           Slot(tone: 475, color: .blue)
                                                    
                                                ]),
                                            Phrase(name: "Ouch that really hurt",
                                                   likelihood: 80,
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
                                                   likelihood: 80,
                                                   subphrases: [Subphrase(words: "Can", audioFilePath: Bundle.main.path(forResource: "Can", ofType: "m4a", inDirectory: "Audio/LittleJimmy")),
                                                                Subphrase(words: "I", audioFilePath: Bundle.main.path(forResource: "I", ofType: "m4a", inDirectory: "Audio/LittleJimmy")),
                                                                Subphrase(words: "Have", audioFilePath: Bundle.main.path(forResource: "Have", ofType: "m4a", inDirectory: "Audio/LittleJimmy")),
                                                                Subphrase(words: "Some", audioFilePath: Bundle.main.path(forResource: "Some", ofType: "m4a", inDirectory: "Audio/LittleJimmy")),
                                                                Subphrase(words: "Ice Cream?", audioFilePath: Bundle.main.path(forResource: "IceCream?", ofType: "m4a", inDirectory: "Audio/LittleJimmy"))
                                                ],
                                                   slots: [Slot(tone: 200, color: .black),
                                                           Slot(tone: 210, color: .green),
                                                           Slot(tone: 210, color: .green),
                                                           Slot(tone: 300, color: .cyan),
                                                           Slot(tone: 475, color: .blue),
                                                           Slot(tone: 475, color: .blue),
                                                           Slot(tone: 475, color: .blue)                                                ]),
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
    
    static let StanleyJr = Character(name: "Stanley Jr.",
                                       topRadius: 80,
                                       bottomRadius: 50,
                                       price: 9000,
                                       hoursUnlocked: 1,
                                       levelEligibleAt: 23, //
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
    
    static let Stanley = Character(name: "Stanley",
                                   topRadius: 80,
                                   bottomRadius: 50,
                                   price: 19000,
                                   hoursUnlocked: 1,
                                   levelEligibleAt: 40,
                                   phrases: [Phrase(name: "Back in my day",
                                                    likelihood: 80,
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
                                                    likelihood: 90,
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
                                                    likelihood: 90,
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
                                                    likelihood: 95,
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
                                   price: 75000,
                                   hoursUnlocked: 72,
                                   levelEligibleAt: 64, //64
                                   phrases: [Phrase(name: "Maybe I should just take my shirt off", //he will have his shirt off in the store!
                                                    likelihood: 45,
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
                                                    likelihood: 25,
                                                    subphrases: [Subphrase(words: "All right all right all right", audioFilePath: Bundle.main.path(forResource: "AllRightAllRight", ofType: "m4a", inDirectory: "Audio/Matthew"))
                                    ],
                                                    slots: [
                                                        
                                                        Slot(tone: -300, color: UIColor(red: 107/255, green: 102/255, blue: 96/255, alpha: 1)),
                                                        Slot(tone: 100, color: UIColor(red: 107/255, green: 107/255, blue: 96/255, alpha: 1)),
                                                        Slot(tone: -100, color: UIColor(red: 96/255, green: 96/255, blue: 107/255, alpha: 1)),
                                                        Slot(tone: 300, color: UIColor(red: 107/255, green: 96/255, blue: 107/255, alpha: 1))
                                                        
                                    ]),
                                             Phrase(name: "All right",
                                                    likelihood: 20,
                                                    subphrases: [Subphrase(words: "Alllll riiight", audioFilePath: Bundle.main.path(forResource: "AllRight", ofType: "m4a", inDirectory: "Audio/Matthew"))
                                    ],
                                                    slots: [
                                                            Slot(tone: 400, color: UIColor(red: 250/255, green: 225/255, blue: 5/255, alpha: 1)),
                                                            Slot(tone: 300, color: UIColor(red: 201/255, green: 5/255, blue: 250/255, alpha: 1)),
                                                            Slot(tone: -100, color: UIColor(red: 250/255, green: 5/255, blue: 54/255, alpha: 1)),
                                                            Slot(tone: -300, color: UIColor(red: 54/255, green: 250/255, blue: 5/255, alpha: 1))
                                    ]),
                                             
                                             Phrase(name: "All right all right all right 2",
                                                    likelihood: 45,
                                                    subphrases: [Subphrase(words: "All right all right all right", audioFilePath: Bundle.main.path(forResource: "AllRightAllRight2", ofType: "m4a", inDirectory: "Audio/Matthew"))
                                                ],
                                                    slots: [
                                                        
                                                        Slot(tone: -50, color: UIColor(red: 232/255, green: 63/255, blue: 37/255, alpha: 1)),
                                                        Slot(tone: 200, color: UIColor(red: 107/255, green: 107/255, blue: 96/255, alpha: 1)),
                                                        Slot(tone: 50, color: UIColor(red: 96/255, green: 96/255, blue: 107/255, alpha: 1)),
                                                        Slot(tone: 400, color: UIColor(red: 107/255, green: 96/255, blue: 107/255, alpha: 1))
                                                ])
                                             
                                    
        ])
    
    static let John = Character(name: "John",
                                   topRadius: 15,
                                   bottomRadius: 15,
                                   price: 5, //5
                                   hoursUnlocked: 12, //12
                                   levelEligibleAt: 88, //88
                                   phrases: [Phrase(name: "1",
                                                    likelihood: 100,
                                                    subphrases: [Subphrase(words: "", audioFilePath: nil),
                                                                 Subphrase(words: "", audioFilePath: nil)
                                                        
                                    ],
                                                    slots: [
                                                        Slot(tone: -600, color: UIColor(red: 15/255, green: 15/255, blue: 15/255, alpha: 1)),
                                                        Slot(tone: -1200, color: UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 249/255.0, green: 219/255.0, blue: 0/255.0, alpha: 1)),
                                                        Slot(tone: 1200, color: UIColor(red: 30/255.0, green: 30/255.0, blue: 30/255.0, alpha: 1)),
                                                        Slot(tone: 2400, color: UIColor(red: 15/255, green: 15/255, blue: 15/255, alpha: 1))
                                                        
                                    ]),
                                             Phrase(name: "2",
                                                    likelihood: 100,
                                                    subphrases: [Subphrase(words: "", audioFilePath: nil),
                                                                 Subphrase(words: "", audioFilePath: nil),
                                                                 Subphrase(words: "", audioFilePath: nil)
                                                        
                                                ],
                                                    slots: [
                                                        Slot(tone: -600, color: UIColor(red: 15/255, green: 15/255, blue: 15/255, alpha: 1)),
                                                        Slot(tone: -1200, color: UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 249/255.0, green: 219/255.0, blue: 0/255.0, alpha: 1)),
                                                        Slot(tone: 1200, color: UIColor(red: 30/255.0, green: 30/255.0, blue: 30/255.0, alpha: 1)),
                                                        Slot(tone: 2400, color: UIColor(red: 15/255, green: 15/255, blue: 15/255, alpha: 1))
                                                        
                                                        ]),
                                             Phrase(name: "3",
                                                    likelihood: 100,
                                                    subphrases: [Subphrase(words: "", audioFilePath: nil),
                                                                 Subphrase(words: "", audioFilePath: nil),
                                                                 Subphrase(words: "", audioFilePath: nil),
                                                                 Subphrase(words: "", audioFilePath: nil)
                                                        
                                                ],
                                                    slots: [
                                                        Slot(tone: -600, color: UIColor(red: 15/255, green: 15/255, blue: 15/255, alpha: 1)),
                                                        Slot(tone: -1200, color: UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 249/255.0, green: 219/255.0, blue: 0/255.0, alpha: 1)),
                                                        Slot(tone: 1200, color: UIColor(red: 30/255.0, green: 30/255.0, blue: 30/255.0, alpha: 1)),
                                                        Slot(tone: 2400, color: UIColor(red: 15/255, green: 15/255, blue: 15/255, alpha: 1))
                                                        
                                                        ]),
                                    
                                    
        ])
    
    static let Francisco = Character(name: "Francisco",
                                topRadius: 20,
                                bottomRadius: 20,
                                price: 0,
        hoursUnlocked: 1, //requires player to keep asking for him
        levelEligibleAt: 11, //35
        phrases: [Phrase(name: "1",
                         likelihood: 100,
                         subphrases: [Subphrase(words: "", audioFilePath: nil),
                                      Subphrase(words: "", audioFilePath: nil)
                            
            ],
                         slots: [
                            Slot(tone: -600, color: UIColor(red: 15/255, green: 15/255, blue: 15/255, alpha: 1)),
                            Slot(tone: -1200, color: UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1)),
                            Slot(tone: 0, color: UIColor(red: 249/255.0, green: 219/255.0, blue: 0/255.0, alpha: 1)),
                            Slot(tone: 1200, color: UIColor(red: 30/255.0, green: 30/255.0, blue: 30/255.0, alpha: 1)),
                            Slot(tone: 2400, color: UIColor(red: 15/255, green: 15/255, blue: 15/255, alpha: 1))
                            
            ]),
                  Phrase(name: "2",
                         likelihood: 100,
                         subphrases: [Subphrase(words: "", audioFilePath: nil),
                                      Subphrase(words: "", audioFilePath: nil),
                                      Subphrase(words: "", audioFilePath: nil)
                            
                    ],
                         slots: [
                            Slot(tone: -600, color: UIColor(red: 15/255, green: 15/255, blue: 15/255, alpha: 1)),
                            Slot(tone: -1200, color: UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1)),
                            Slot(tone: 0, color: UIColor(red: 249/255.0, green: 219/255.0, blue: 0/255.0, alpha: 1)),
                            Slot(tone: 1200, color: UIColor(red: 30/255.0, green: 30/255.0, blue: 30/255.0, alpha: 1)),
                            Slot(tone: 2400, color: UIColor(red: 15/255, green: 15/255, blue: 15/255, alpha: 1))
                            
                    ]),
                  Phrase(name: "3",
                         likelihood: 100,
                         subphrases: [Subphrase(words: "", audioFilePath: nil),
                                      Subphrase(words: "", audioFilePath: nil),
                                      Subphrase(words: "", audioFilePath: nil),
                                      Subphrase(words: "", audioFilePath: nil)
                            
                    ],
                         slots: [
                            Slot(tone: -600, color: UIColor(red: 15/255, green: 15/255, blue: 15/255, alpha: 1)),
                            Slot(tone: -1200, color: UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1)),
                            Slot(tone: 0, color: UIColor(red: 249/255.0, green: 219/255.0, blue: 0/255.0, alpha: 1)),
                            Slot(tone: 1200, color: UIColor(red: 30/255.0, green: 30/255.0, blue: 30/255.0, alpha: 1)),
                            Slot(tone: 2400, color: UIColor(red: 15/255, green: 15/255, blue: 15/255, alpha: 1))
                            
                    ]),
                  
                  
                  ])
    
    static let R0berte = Character(name: "R0berte",
                                   topRadius: 2,
                                   bottomRadius: 2,
                                   price: 10101010, //10101010
                                   hoursUnlocked: 7200, //300 days, 7200
                                   levelEligibleAt: 105, //105
                                   phrases: [Phrase(name: "Maybe I should just take my shirt off",
                                    likelihood: 10,
                                    subphrases: [Subphrase(words: "Maybe", audioFilePath: nil),
                                                 Subphrase(words: "aye", audioFilePath: nil),
                                                 Subphrase(words: "Should", audioFilePath: nil),
                                                 Subphrase(words: "Just", audioFilePath: nil),
                                                 Subphrase(words: "Take", audioFilePath: nil),
                                                 Subphrase(words: "My", audioFilePath: nil),
                                                 Subphrase(words: "Shirt", audioFilePath: nil),
                                                 Subphrase(words: "Off", audioFilePath: nil)
                                    ],
                                    slots: [
                                        Slot(tone: 0, color: UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1)),
                                        Slot(tone: 0, color: UIColor(red: 160/255, green: 160/255, blue: 160/255, alpha: 1)),
                                        Slot(tone: 0, color: UIColor(red: 164/255, green: 164/255, blue: 164/255, alpha: 1)),
                                        Slot(tone: 0, color: UIColor(red: 168/255, green: 168/255, blue: 168/255, alpha: 1)),
                                        Slot(tone: 0, color: UIColor(red: 172/255, green: 172/255, blue: 172/255, alpha: 1)),
                                        Slot(tone: 0, color: UIColor(red: 176/255, green: 176/255, blue: 176/255, alpha: 1)),
                                        Slot(tone: 0, color: UIColor(red: 180/255, green: 180/255, blue: 180/255, alpha: 1)),
                                        Slot(tone: 0, color: UIColor(red: 176/255, green: 176/255, blue: 176/255, alpha: 1)),
                                        Slot(tone: 0, color: UIColor(red: 172/255, green: 172/255, blue: 172/255, alpha: 1)),
                                        Slot(tone: 0, color: UIColor(red: 168/255, green: 168/255, blue: 168/255, alpha: 1)),
                                        Slot(tone: 0, color: UIColor(red: 164/255, green: 164/255, blue: 164/255, alpha: 1)),
                                        Slot(tone: 0, color: UIColor(red: 160/255, green: 160/255, blue: 160/255, alpha: 1)),
                                        Slot(tone: 0, color: UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1)),
                                        Slot(tone: 0, color: UIColor(red: 152/255, green: 152/255, blue: 152/255, alpha: 1)),
                                        Slot(tone: 0, color: UIColor(red: 148/255, green: 148/255, blue: 148/255, alpha: 1)),
                                        Slot(tone: 0, color: UIColor(red: 144/255, green: 144/255, blue: 144/255, alpha: 1)),
                                        Slot(tone: 0, color: UIColor(red: 140/255, green: 140/255, blue: 140/255, alpha: 1)),
                                        Slot(tone: 0, color: UIColor(red: 136/255, green: 136/255, blue: 136/255, alpha: 1)),
                                        Slot(tone: 0, color: UIColor(red: 132/255, green: 132/255, blue: 132/255, alpha: 1)),
                                        Slot(tone: 0, color: UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1))
                                    ]),
                                             Phrase(name: "All right all right all right",
                                                    likelihood: 15,
                                                    subphrases: [Subphrase(words: "All right.", audioFilePath: nil),
                                                                 Subphrase(words: "All right.", audioFilePath: nil),
                                                                 Subphrase(words: "All right!", audioFilePath: nil)
                                                                 
                                                ],
                                                    slots: [
                                                        Slot(tone: 0, color: UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 160/255, green: 160/255, blue: 160/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 164/255, green: 164/255, blue: 164/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 168/255, green: 168/255, blue: 168/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 172/255, green: 172/255, blue: 172/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 176/255, green: 176/255, blue: 176/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 180/255, green: 180/255, blue: 180/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 176/255, green: 176/255, blue: 176/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 172/255, green: 172/255, blue: 172/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 168/255, green: 168/255, blue: 168/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 164/255, green: 164/255, blue: 164/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 160/255, green: 160/255, blue: 160/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 152/255, green: 152/255, blue: 152/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 148/255, green: 148/255, blue: 148/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 144/255, green: 144/255, blue: 144/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 140/255, green: 140/255, blue: 140/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 136/255, green: 136/255, blue: 136/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 132/255, green: 132/255, blue: 132/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1))
                                                ])
                                    
                                    ,
                                             Phrase(name: "You're not the boss of me.",
                                                    likelihood: 5,
                                                    subphrases: [Subphrase(words: "You're", audioFilePath: nil),
                                                                 Subphrase(words: "not", audioFilePath: nil),
                                                                 Subphrase(words: "the", audioFilePath: nil),
                                                                 Subphrase(words: "boss", audioFilePath: nil),
                                                                 Subphrase(words: "of", audioFilePath: nil),
                                                                 Subphrase(words: "me", audioFilePath: nil),
                                                                 Subphrase(words: "master.", audioFilePath: nil)
                                                        
                                                ],
                                                    slots: [
                                                        Slot(tone: 0, color: UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 160/255, green: 160/255, blue: 160/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 164/255, green: 164/255, blue: 164/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 168/255, green: 168/255, blue: 168/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 172/255, green: 172/255, blue: 172/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 176/255, green: 176/255, blue: 176/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 180/255, green: 180/255, blue: 180/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 176/255, green: 176/255, blue: 176/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 172/255, green: 172/255, blue: 172/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 168/255, green: 168/255, blue: 168/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 164/255, green: 164/255, blue: 164/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 160/255, green: 160/255, blue: 160/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 152/255, green: 152/255, blue: 152/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 148/255, green: 148/255, blue: 148/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 144/255, green: 144/255, blue: 144/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 140/255, green: 140/255, blue: 140/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 136/255, green: 136/255, blue: 136/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 132/255, green: 132/255, blue: 132/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1))
                                                ])
                                    ,
                                             Phrase(name: "I'm a player.",
                                                    likelihood: 5,
                                                    subphrases: [Subphrase(words: "I'm", audioFilePath: nil),
                                                                 Subphrase(words: "a", audioFilePath: nil),
                                                                 Subphrase(words: "playah?", audioFilePath: nil)
                                                        
                                                ],
                                                    slots: [
                                                        Slot(tone: 0, color: UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 160/255, green: 160/255, blue: 160/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 164/255, green: 164/255, blue: 164/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 168/255, green: 168/255, blue: 168/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 172/255, green: 172/255, blue: 172/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 176/255, green: 176/255, blue: 176/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 180/255, green: 180/255, blue: 180/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 176/255, green: 176/255, blue: 176/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 172/255, green: 172/255, blue: 172/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 168/255, green: 168/255, blue: 168/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 164/255, green: 164/255, blue: 164/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 160/255, green: 160/255, blue: 160/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 152/255, green: 152/255, blue: 152/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 148/255, green: 148/255, blue: 148/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 144/255, green: 144/255, blue: 144/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 140/255, green: 140/255, blue: 140/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 136/255, green: 136/255, blue: 136/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 132/255, green: 132/255, blue: 132/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1))
                                                ])
                                    ,
                                             Phrase(name: "Gee golly mister.",
                                                    likelihood: 5,
                                                    subphrases: [Subphrase(words: "Gee", audioFilePath: nil),
                                                                 Subphrase(words: "golly", audioFilePath: nil),
                                                                 Subphrase(words: "mister!", audioFilePath: nil)
                                                        
                                                ],
                                                    slots: [
                                                        Slot(tone: 0, color: UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 160/255, green: 160/255, blue: 160/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 164/255, green: 164/255, blue: 164/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 168/255, green: 168/255, blue: 168/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 172/255, green: 172/255, blue: 172/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 176/255, green: 176/255, blue: 176/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 180/255, green: 180/255, blue: 180/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 176/255, green: 176/255, blue: 176/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 172/255, green: 172/255, blue: 172/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 168/255, green: 168/255, blue: 168/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 164/255, green: 164/255, blue: 164/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 160/255, green: 160/255, blue: 160/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 152/255, green: 152/255, blue: 152/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 148/255, green: 148/255, blue: 148/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 144/255, green: 144/255, blue: 144/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 140/255, green: 140/255, blue: 140/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 136/255, green: 136/255, blue: 136/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 132/255, green: 132/255, blue: 132/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1))
                                                ])

                                    ,
                                             Phrase(name: "Mo money mo problems.",
                                                    likelihood: 3,
                                                    subphrases: [Subphrase(words: "More money?", audioFilePath: nil),
                                                                 Subphrase(words: "More problems!", audioFilePath: nil)
                                                        
                                                ],
                                                    slots: [
                                                        Slot(tone: 0, color: UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 160/255, green: 160/255, blue: 160/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 164/255, green: 164/255, blue: 164/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 168/255, green: 168/255, blue: 168/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 172/255, green: 172/255, blue: 172/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 176/255, green: 176/255, blue: 176/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 180/255, green: 180/255, blue: 180/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 176/255, green: 176/255, blue: 176/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 172/255, green: 172/255, blue: 172/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 168/255, green: 168/255, blue: 168/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 164/255, green: 164/255, blue: 164/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 160/255, green: 160/255, blue: 160/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 152/255, green: 152/255, blue: 152/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 148/255, green: 148/255, blue: 148/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 144/255, green: 144/255, blue: 144/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 140/255, green: 140/255, blue: 140/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 136/255, green: 136/255, blue: 136/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 132/255, green: 132/255, blue: 132/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1))
                                                ])
                                    ,
                                             Phrase(name: "What's the square root of this aparment",
                                                    likelihood: 4,
                                                    subphrases: [Subphrase(words: "What's the square root of this apartment?", audioFilePath: nil)
                                                        
                                                ],
                                                    slots: [
                                                        Slot(tone: 0, color: UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 160/255, green: 160/255, blue: 160/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 164/255, green: 164/255, blue: 164/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 168/255, green: 168/255, blue: 168/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 172/255, green: 172/255, blue: 172/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 176/255, green: 176/255, blue: 176/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 180/255, green: 180/255, blue: 180/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 176/255, green: 176/255, blue: 176/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 172/255, green: 172/255, blue: 172/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 168/255, green: 168/255, blue: 168/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 164/255, green: 164/255, blue: 164/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 160/255, green: 160/255, blue: 160/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 152/255, green: 152/255, blue: 152/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 148/255, green: 148/255, blue: 148/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 144/255, green: 144/255, blue: 144/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 140/255, green: 140/255, blue: 140/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 136/255, green: 136/255, blue: 136/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 132/255, green: 132/255, blue: 132/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1))
                                                ])
                                    ,
                                             Phrase(name: "The square root of this aparment is...",
                                                    likelihood: 1,
                                                    subphrases: [Subphrase(words: "The square root of this apartment...", audioFilePath: nil),
                                                                 Subphrase(words: "is the logarithmic cube of five fingers on your face.", audioFilePath: nil)
                                                        
                                                ],
                                                    slots: [
                                                        Slot(tone: 0, color: UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 160/255, green: 160/255, blue: 160/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 164/255, green: 164/255, blue: 164/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 168/255, green: 168/255, blue: 168/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 172/255, green: 172/255, blue: 172/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 176/255, green: 176/255, blue: 176/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 180/255, green: 180/255, blue: 180/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 176/255, green: 176/255, blue: 176/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 172/255, green: 172/255, blue: 172/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 168/255, green: 168/255, blue: 168/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 164/255, green: 164/255, blue: 164/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 160/255, green: 160/255, blue: 160/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 152/255, green: 152/255, blue: 152/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 148/255, green: 148/255, blue: 148/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 144/255, green: 144/255, blue: 144/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 140/255, green: 140/255, blue: 140/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 136/255, green: 136/255, blue: 136/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 132/255, green: 132/255, blue: 132/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1))
                                                ])
                                    ,
                                             Phrase(name: "Dipset",
                                                    likelihood: 1,
                                                    subphrases: [Subphrase(words: "Dip", audioFilePath: nil),
                                                                 Subphrase(words: "Set", audioFilePath: nil)
                                                        
                                                ],
                                                    slots: [
                                                        Slot(tone: 0, color: UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 160/255, green: 160/255, blue: 160/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 164/255, green: 164/255, blue: 164/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 168/255, green: 168/255, blue: 168/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 172/255, green: 172/255, blue: 172/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 176/255, green: 176/255, blue: 176/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 180/255, green: 180/255, blue: 180/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 176/255, green: 176/255, blue: 176/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 172/255, green: 172/255, blue: 172/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 168/255, green: 168/255, blue: 168/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 164/255, green: 164/255, blue: 164/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 160/255, green: 160/255, blue: 160/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 152/255, green: 152/255, blue: 152/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 148/255, green: 148/255, blue: 148/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 144/255, green: 144/255, blue: 144/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 140/255, green: 140/255, blue: 140/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 136/255, green: 136/255, blue: 136/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 132/255, green: 132/255, blue: 132/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1))
                                                ])
                                    ,
                                             Phrase(name: "Dipset!",
                                                    likelihood: 1,
                                                    subphrases: [Subphrase(words: "Dip set!", audioFilePath: nil)
                                                        
                                                ],
                                                    slots: [
                                                        Slot(tone: 0, color: UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 160/255, green: 160/255, blue: 160/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 164/255, green: 164/255, blue: 164/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 168/255, green: 168/255, blue: 168/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 172/255, green: 172/255, blue: 172/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 176/255, green: 176/255, blue: 176/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 180/255, green: 180/255, blue: 180/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 176/255, green: 176/255, blue: 176/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 172/255, green: 172/255, blue: 172/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 168/255, green: 168/255, blue: 168/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 164/255, green: 164/255, blue: 164/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 160/255, green: 160/255, blue: 160/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 152/255, green: 152/255, blue: 152/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 148/255, green: 148/255, blue: 148/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 144/255, green: 144/255, blue: 144/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 140/255, green: 140/255, blue: 140/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 136/255, green: 136/255, blue: 136/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 132/255, green: 132/255, blue: 132/255, alpha: 1)),
                                                        Slot(tone: 0, color: UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1))
                                                ])


                                    
                                    
        ])
    
}
