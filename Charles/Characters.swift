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
    static let ValidCharacters: [Character] = [Dan, Benton, LittleJimmy,  Laura, Bessie, Charles, Fred, StanleyJr, Stanley, Earl, Dawson, Matthew, R0berte, Sparkle, John]
    static let NewPlayerCharacterSet: [Character] = [Dan]
    static let AlwaysUnlockedSet: [Character] = NewPlayerCharacterSet
    static let UnlockableCharacters: [Character] = [Benton, LittleJimmy,  Laura, Bessie, Charles, Fred, StanleyJr, Stanley,  Earl, Dawson, Matthew, R0berte, Sparkle, John]
    
    /******************************************************/
    /*******************///MARK: Characters
    /******************************************************/

    // MARK: Charles
    static let Charles = Character(name: "Charlės",
                                   gameDescription: "A charismatic and productivė do-goodėr under a smooth-talking facadė.  Twin to Frėd.",
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
                               gameDescription: "Profėssor Emėritus and Hėadmastėr of the Nubal Acadėmy, Dan wėlcomės all nėw arrivals with cryptic lėssons and sharp rėbukės.",
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
    static let Fred = Character(name: "Frėd",
                                gameDescription: "A dramatic yėt ėstudious hard-working producėr rėsėmbling man and boy.  Twin to Charlės.",
                                topRadius: 15,
                                bottomRadius: 15,
                                price: 10200,
                                hoursUnlocked: 96,
                                levelEligibleAt: 16, //16, one after charles
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
    
    static let Benton = Character(name: "Bėnton",
                                  gameDescription: "Thė nicėst guy you'll ėvėr mėėt.  Hė has a big hėart and is always quick with a complimėnt.",
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
                                 gameDescription: "Hėr bėauty can makė unbėarablė sounds mėlt away into a sėrėnė hypėrsėnsational altėrnativė.",
                                  topRadius: 50,
                                  bottomRadius: 25,
                                  price: 5000,
                                  hoursUnlocked: 168,
                                  levelEligibleAt: 5,
                                  phrases: [
//                                    Phrase(name: "Rookie",
//                                                   likelihood: 60,
//                                                   subphrases: [Subphrase(words: "Rookie!", audioFilePath: Bundle.main.path(forResource: "Rookie", ofType: "m4a", inDirectory: "Audio/Laura"))
//                                    ],
//                                                   slots: [//Slot(tone: 700, color: .red),
//                                                            Slot(tone: 700, color: UIColor(red: 29/255, green: 43/255, blue: 145/255, alpha: 1)),
//                                                           Slot(tone: 650, color: .white),
//                                                           Slot(tone: 600, color: UIColor(red: 73/255, green: 29/255, blue: 145/255, alpha: 1)),
//                                                           Slot(tone: 550, color: .white),
//                                                           Slot(tone: 500, color: UIColor(red: 29/255, green: 101/255, blue: 145/255, alpha: 1))
//                                    ]),
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
                                    
//                                            Phrase(name: "BlahBlah",
//                                                   likelihood: 55,
//                                                   subphrases: [Subphrase(words: "Blahlahlalhhdhhlalhlahlha", audioFilePath: Bundle.main.path(forResource: "BlahBlah", ofType: "m4a", inDirectory: "Audio/Laura"))
//                                                ], slots: [Slot(tone: 900, color: UIColor(red: 131/255, green: 29/255, blue: 145/255, alpha: 1)),
//                                                                                                                      Slot(tone: 450, color: .white),
//                                                                                                               Slot(tone: 400, color: UIColor(red: 43/255, green: 145/255, blue: 29/255, alpha: 1)),
//                                                                                                               Slot(tone: 350, color: .white),
//                                                                                                               Slot(tone: 300, color: UIColor(red: 29/255, green: 43/255, blue: 145/255, alpha: 1))
//                                                ]),
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
    
    
    static let LittleJimmy = Character(name: "Littlė Jimmy",
                                       gameDescription: "A rambuncious youth that livės a whimsiclė and innocėnt lifė.",
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
    
    static let StanleyJr = Character(name: "Stanlėy Jr.",
                                     gameDescription: "Son of Stanlėy, but ablė to rėap grėatėr rėturns.  Wėars his fathėr's clothės but isn't as charismatic or insightful.",
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
                                                 Phrase(name: "Huh What",
                                                        likelihood: 60,
                                                        subphrases: [Subphrase(words: "Huh?", audioFilePath: Bundle.main.path(forResource: "Huh", ofType: "m4a", inDirectory: "Audio/Stanley")),
                                                                    Subphrase(words: "What?", audioFilePath: Bundle.main.path(forResource: "What", ofType: "m4a", inDirectory: "Audio/Stanley"))
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
//                                                 Phrase(name: "What?",
//                                                        likelihood: 60,
//                                                        subphrases: [Subphrase(words: "What?", audioFilePath: Bundle.main.path(forResource: "What", ofType: "m4a", inDirectory: "Audio/Stanley"))
//                                                    ],
//                                                        slots: [Slot(tone: 50, color: .brown),
//                                                                Slot(tone: -30, color: UIColor(red: 125/255, green: 84/255, blue: 31/255, alpha: 1)),
//                                                               Slot(tone: -50, color: UIColor(red: 125/255, green: 31/255, blue: 125/255, alpha: 1)),
//                                                                Slot(tone: -50, color: UIColor(red: 125/255, green: 31/255, blue: 125/255, alpha: 1)),
//                                                                Slot(tone: -50, color: UIColor(red: 125/255, green: 31/255, blue: 125/255, alpha: 1)),
//                                                                Slot(tone: -50, color: UIColor(red: 125/255, green: 31/255, blue: 125/255, alpha: 1)),
//                                                                Slot(tone: 20, color: UIColor(red: 125/255, green: 108/255, blue: 31/255, alpha: 1)),
//                                                                Slot(tone: 20, color: UIColor(red: 125/255, green: 108/255, blue: 31/255, alpha: 1)),
//                                                                Slot(tone: 20, color: UIColor(red: 125/255, green: 108/255, blue: 31/255, alpha: 1)),
//                                                                Slot(tone: -30, color: UIColor(red: 125/255, green: 84/255, blue: 31/255, alpha: 1)),
//                                                                Slot(tone: -30, color: UIColor(red: 125/255, green: 84/255, blue: 31/255, alpha: 1)),
//
//                                                                Slot(tone: -100, color: .black)
//                                                    ]),
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
    
    static let Stanley = Character(name: "Stanlėy",
                                   gameDescription: "Although some mock his drab and drėary appėarancė, nonė can dėny his insight in most any situation.",
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
                                             Phrase(name: "Huh What",
                                                    likelihood: 90,
                                                    subphrases: [Subphrase(words: "Huh?", audioFilePath: Bundle.main.path(forResource: "Huh", ofType: "m4a", inDirectory: "Audio/Stanley")),
                                                                 Subphrase(words: "What?", audioFilePath: Bundle.main.path(forResource: "What", ofType: "m4a", inDirectory: "Audio/Stanley"))
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
//                                             Phrase(name: "What?",
//                                                    likelihood: 90,
//                                                    subphrases: [Subphrase(words: "What?", audioFilePath: Bundle.main.path(forResource: "What", ofType: "m4a", inDirectory: "Audio/Stanley"))
//                                                ],
//                                                    slots: [Slot(tone: 50, color: .brown),
//                                                            Slot(tone: -30, color: UIColor(red: 125/255, green: 84/255, blue: 31/255, alpha: 1)),
//                                                            Slot(tone: -50, color: UIColor(red: 125/255, green: 31/255, blue: 125/255, alpha: 1)),
//                                                            Slot(tone: -50, color: UIColor(red: 125/255, green: 31/255, blue: 125/255, alpha: 1)),
//                                                            Slot(tone: -50, color: UIColor(red: 125/255, green: 31/255, blue: 125/255, alpha: 1)),
//                                                            Slot(tone: -50, color: UIColor(red: 125/255, green: 31/255, blue: 125/255, alpha: 1)),
//                                                            Slot(tone: 20, color: UIColor(red: 125/255, green: 108/255, blue: 31/255, alpha: 1)),
//                                                            Slot(tone: 20, color: UIColor(red: 125/255, green: 108/255, blue: 31/255, alpha: 1)),
//                                                            Slot(tone: 20, color: UIColor(red: 125/255, green: 108/255, blue: 31/255, alpha: 1)),
//                                                            Slot(tone: -30, color: UIColor(red: 125/255, green: 84/255, blue: 31/255, alpha: 1)),
//                                                            Slot(tone: -30, color: UIColor(red: 125/255, green: 84/255, blue: 31/255, alpha: 1)),
//
//                                                            Slot(tone: -100, color: .black)
//                                                ]),
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
    
    static let Matthew = Character(name: "Matthėw",
                                   gameDescription: "His prioritiės: ėncountėrs with the opposite gėndėr, cars, and the bėnėfits of natural substances.",
                                   topRadius: 10,
                                   bottomRadius: 10,
                                   price: 85000, //8500
                                   hoursUnlocked: 72,
                                   levelEligibleAt: 59, //59 chemical
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
                                                    subphrases: [Subphrase(words: "All right all right all right", audioFilePath: Bundle.main.path(forResource: "AllRightAllRight", ofType: "m4a", inDirectory: "Audio/Matthew")),
                                                                 Subphrase(words: "All right all right all right", audioFilePath: Bundle.main.path(forResource: "AllRightAllRight2", ofType: "m4a", inDirectory: "Audio/Matthew"))
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
                                                    subphrases: [Subphrase(words: "All right all right all right", audioFilePath: Bundle.main.path(forResource: "AllRightAllRight2", ofType: "m4a", inDirectory: "Audio/Matthew")),
                                                                 Subphrase(words: "All right all right all right", audioFilePath: Bundle.main.path(forResource: "AllRightAllRight", ofType: "m4a", inDirectory: "Audio/Matthew"))
                                                ],
                                                    slots: [
                                                        
                                                        Slot(tone: -50, color: UIColor(red: 232/255, green: 63/255, blue: 37/255, alpha: 1)),
                                                        Slot(tone: 200, color: UIColor(red: 107/255, green: 107/255, blue: 96/255, alpha: 1)),
                                                        Slot(tone: 50, color: UIColor(red: 96/255, green: 96/255, blue: 107/255, alpha: 1)),
                                                        Slot(tone: 400, color: UIColor(red: 107/255, green: 96/255, blue: 107/255, alpha: 1))
                                                ])
                                             
                                    
        ])
    
    static let John = Character(name: "John",
                                gameDescription: "An unremakable laborer.",
                                   topRadius: 15,
                                   bottomRadius: 15,
                                   price: 5, //5
                                   hoursUnlocked: 1, //1 he comes and goes quickly
                                   levelEligibleAt: 122, //122 the public good
                                   phrases: [Phrase(name: "1",
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
                                             Phrase(name: "2",
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
                                     gameDescription: "A dėbonair playboy of ėxpensive tastės and grėėd, but a surė bėt whėn it comės to invėsting your monėy.",
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
    
    static let R0berte = Character(name: "R0bėrtė",
                                   gameDescription: "Quitė the tool.",
                                   topRadius: 2,
                                   bottomRadius: 2,
                                   price: 10101010, //10101010
                                   hoursUnlocked: 7200, //300 days, 7200
                                   levelEligibleAt: 83, //83 is control
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
                                             Phrase(name: "The square root of this apartment is...",
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
                                                                 Subphrase(words: "Set", audioFilePath: nil),
                                                                 Subphrase(words: "Dip set!", audioFilePath: nil)
                                                        
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
//                                    ,
//                                             Phrase(name: "Dipset!",
//                                                    likelihood: 1,
//                                                    subphrases: [Subphrase(words: "Dip set!", audioFilePath: nil)
//
//                                                ],
//                                                    slots: [
//                                                        Slot(tone: 0, color: UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1)),
//                                                        Slot(tone: 0, color: UIColor(red: 160/255, green: 160/255, blue: 160/255, alpha: 1)),
//                                                        Slot(tone: 0, color: UIColor(red: 164/255, green: 164/255, blue: 164/255, alpha: 1)),
//                                                        Slot(tone: 0, color: UIColor(red: 168/255, green: 168/255, blue: 168/255, alpha: 1)),
//                                                        Slot(tone: 0, color: UIColor(red: 172/255, green: 172/255, blue: 172/255, alpha: 1)),
//                                                        Slot(tone: 0, color: UIColor(red: 176/255, green: 176/255, blue: 176/255, alpha: 1)),
//                                                        Slot(tone: 0, color: UIColor(red: 180/255, green: 180/255, blue: 180/255, alpha: 1)),
//                                                        Slot(tone: 0, color: UIColor(red: 176/255, green: 176/255, blue: 176/255, alpha: 1)),
//                                                        Slot(tone: 0, color: UIColor(red: 172/255, green: 172/255, blue: 172/255, alpha: 1)),
//                                                        Slot(tone: 0, color: UIColor(red: 168/255, green: 168/255, blue: 168/255, alpha: 1)),
//                                                        Slot(tone: 0, color: UIColor(red: 164/255, green: 164/255, blue: 164/255, alpha: 1)),
//                                                        Slot(tone: 0, color: UIColor(red: 160/255, green: 160/255, blue: 160/255, alpha: 1)),
//                                                        Slot(tone: 0, color: UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1)),
//                                                        Slot(tone: 0, color: UIColor(red: 152/255, green: 152/255, blue: 152/255, alpha: 1)),
//                                                        Slot(tone: 0, color: UIColor(red: 148/255, green: 148/255, blue: 148/255, alpha: 1)),
//                                                        Slot(tone: 0, color: UIColor(red: 144/255, green: 144/255, blue: 144/255, alpha: 1)),
//                                                        Slot(tone: 0, color: UIColor(red: 140/255, green: 140/255, blue: 140/255, alpha: 1)),
//                                                        Slot(tone: 0, color: UIColor(red: 136/255, green: 136/255, blue: 136/255, alpha: 1)),
//                                                        Slot(tone: 0, color: UIColor(red: 132/255, green: 132/255, blue: 132/255, alpha: 1)),
//                                                        Slot(tone: 0, color: UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1))
//                                                ])


                                    
                                    
        ])
    
    // MARK: Dawson
    static let Dawson = Character(name: "Dawson",
                                   gameDescription: "An inquisitivė man obsėssėd with your pėrformancė.",
                                   topRadius: 12,
                                   bottomRadius: 8,
                                   price: 2007, //2007
                                   hoursUnlocked: 07,
                                   levelEligibleAt: 67, //67 survival
                                   phrases: [Phrase(name: "Hey Snake whatd you get on that test",
                                                    likelihood: 30,
                                                    subphrases: [Subphrase(words: "Hey", audioFilePath: Bundle.main.path(forResource: "Hey1", ofType: "m4a", inDirectory: "Audio/Dawson")),
                                                                 Subphrase(words: "Snake", audioFilePath: Bundle.main.path(forResource: "Snake1", ofType: "m4a", inDirectory: "Audio/Dawson")),
                                                                 Subphrase(words: "What'd", audioFilePath: Bundle.main.path(forResource: "Whatd1", ofType: "m4a", inDirectory: "Audio/Dawson")),
                                                                 Subphrase(words: "You", audioFilePath: Bundle.main.path(forResource: "You1", ofType: "m4a", inDirectory: "Audio/Dawson")),
                                                                 Subphrase(words: "Get", audioFilePath: Bundle.main.path(forResource: "Get1", ofType: "m4a", inDirectory: "Audio/Dawson")),
                                                                 Subphrase(words: "On", audioFilePath: Bundle.main.path(forResource: "On1", ofType: "m4a", inDirectory: "Audio/Dawson")),
                                                                 Subphrase(words: "That", audioFilePath: Bundle.main.path(forResource: "That1", ofType: "m4a", inDirectory: "Audio/Dawson")),
                                                                 Subphrase(words: "Test", audioFilePath: Bundle.main.path(forResource: "Test1", ofType: "m4a", inDirectory: "Audio/Dawson"))
                                                        
                                    ],
                                                    slots: [Slot(tone: 200, color: UIColor(red: 52/255, green: 29/255, blue: 145/255, alpha: 1)), //Navy Blue
                                                            Slot(tone: 100, color: UIColor(red: 52/255, green: 29/255, blue: 145/255, alpha: 1)), //Navy Blue
                                                            Slot(tone: 0, color: UIColor(red: 255/255, green: 247/255, blue: 28/255, alpha: 1)), //Navy Gold
                                                        Slot(tone: -100, color: UIColor(red: 52/255, green: 29/255, blue: 145/255, alpha: 1)), //Navy Blue
                                                        Slot(tone: -200, color: UIColor(red: 52/255, green: 29/255, blue: 145/255, alpha: 1)), //Navy Blue
                                                        Slot(tone: -300, color: UIColor(red: 255/255, green: 247/255, blue: 28/255, alpha: 1)), //Navy Gold
                                                        Slot(tone: -400, color: UIColor(red: 52/255, green: 29/255, blue: 145/255, alpha: 1)), //Navy Blue
                                                        Slot(tone: -500, color: UIColor(red: 52/255, green: 29/255, blue: 145/255, alpha: 1)), //Navy Blue
                                                        Slot(tone: -600, color: UIColor(red: 255/255, green: 247/255, blue: 28/255, alpha: 1)) //Navy Gold
                                                        
                                    ]),
                                             Phrase(name: "Hey Snake Howd you do on that test",
                                                    likelihood: 30,
                                                    subphrases: [Subphrase(words: "Hey", audioFilePath: Bundle.main.path(forResource: "Hey1", ofType: "m4a", inDirectory: "Audio/Dawson")),
                                                                 Subphrase(words: "Snake", audioFilePath: Bundle.main.path(forResource: "Snake1", ofType: "m4a", inDirectory: "Audio/Dawson")),
                                                                 Subphrase(words: "How'd", audioFilePath: Bundle.main.path(forResource: "Howd2", ofType: "m4a", inDirectory: "Audio/Dawson")),
                                                                 Subphrase(words: "You", audioFilePath: Bundle.main.path(forResource: "You2", ofType: "m4a", inDirectory: "Audio/Dawson")),
                                                                 Subphrase(words: "Do", audioFilePath: Bundle.main.path(forResource: "Do2", ofType: "m4a", inDirectory: "Audio/Dawson")),
                                                                 Subphrase(words: "On", audioFilePath: Bundle.main.path(forResource: "On2", ofType: "m4a", inDirectory: "Audio/Dawson")),
                                                                 Subphrase(words: "That", audioFilePath: Bundle.main.path(forResource: "That2", ofType: "m4a", inDirectory: "Audio/Dawson")),
                                                                 Subphrase(words: "Test", audioFilePath: Bundle.main.path(forResource: "Test2", ofType: "m4a", inDirectory: "Audio/Dawson"))
                                                        
                                                ],
                                                    slots: [Slot(tone: 600, color: .white),
                                                        Slot(tone: 500, color: UIColor(red: 52/255, green: 29/255, blue: 145/255, alpha: 1)), //Navy Blue
                                                        Slot(tone: 400, color: UIColor(red: 52/255, green: 29/255, blue: 145/255, alpha: 1)), //Navy Blue
                                                        Slot(tone: 300, color: UIColor(red: 255/255, green: 247/255, blue: 28/255, alpha: 1)), //Navy Gold
                                                        Slot(tone: 200, color: UIColor(red: 255/255, green: 247/255, blue: 28/255, alpha: 1)), //Navy Gold
                                                        Slot(tone: 100, color: UIColor(red: 52/255, green: 29/255, blue: 145/255, alpha: 1)), //Navy Blue
                                                        Slot(tone: 0, color: UIColor(red: 52/255, green: 29/255, blue: 145/255, alpha: 1)), //Navy Blue
                                                        Slot(tone: -100, color: UIColor(red: 255/255, green: 247/255, blue: 28/255, alpha: 1)), //Navy Gold
                                                        Slot(tone: -200, color: UIColor(red: 255/255, green: 247/255, blue: 28/255, alpha: 1)), //Navy Gold
                                                        Slot(tone: -300, color: UIColor(red: 52/255, green: 29/255, blue: 145/255, alpha: 1)), //Navy Blue
                                                        Slot(tone: -400, color: UIColor(red: 52/255, green: 29/255, blue: 145/255, alpha: 1)), //Navy Blue
                                                        Slot(tone: -500, color: UIColor(red: 255/255, green: 247/255, blue: 28/255, alpha: 1)), //Navy Gold
                                                        Slot(tone: -600, color: UIColor(red: 255/255, green: 247/255, blue: 28/255, alpha: 1)), //Navy Gold
                                                        Slot(tone: -700, color: .white)
                                                        
                                                ]),
                                             
                                             Phrase(name: "Howd you do on that test",
                                                    likelihood: 35,
                                                    subphrases: [
                                                                 Subphrase(words: "How'dYou", audioFilePath: Bundle.main.path(forResource: "HowdYou4", ofType: "m4a", inDirectory: "Audio/Dawson")),
                                                                 Subphrase(words: "Do", audioFilePath: Bundle.main.path(forResource: "Do4", ofType: "m4a", inDirectory: "Audio/Dawson")),
                                                                 Subphrase(words: "On", audioFilePath: Bundle.main.path(forResource: "On4", ofType: "m4a", inDirectory: "Audio/Dawson")),
                                                                 Subphrase(words: "That", audioFilePath: Bundle.main.path(forResource: "That4", ofType: "m4a", inDirectory: "Audio/Dawson")),
                                                                 Subphrase(words: "Test", audioFilePath: Bundle.main.path(forResource: "Test4", ofType: "m4a", inDirectory: "Audio/Dawson"))
                                                        
                                                ],
                                                    slots: [Slot(tone: 600, color: UIColor(red: 200/255, green: 37/255, blue: 31/255, alpha: 1)), //Navy Red
                                                        Slot(tone: 400, color: UIColor(red: 52/255, green: 29/255, blue: 145/255, alpha: 1)), //Navy Blue
                                                        Slot(tone: 300, color: UIColor(red: 255/255, green: 247/255, blue: 28/255, alpha: 1)), //Navy Gold
                                                ]),
                                             Phrase(name: "Howdyoudoonthattest",
                                                    likelihood: 1,
                                                    subphrases: [
                                                        Subphrase(words: "How'dYouDoOnThatTest", audioFilePath: Bundle.main.path(forResource: "HowdYouDoOnThatTest3", ofType: "m4a", inDirectory: "Audio/Dawson"))
                                                        
                                                ],
                                                    slots: [
                                                        Slot(tone: -400, color: UIColor(red: 52/255, green: 29/255, blue: 145/255, alpha: 1)) //Navy Blue
                                                ])
                                            
                                    
        ])
    
    // MARK: Bessie
    static let Bessie = Character(name: "Bėssiė",
                                  gameDescription: "Arguably the smartėst onė of thė bunch.",
                                  topRadius: 58,
                                  bottomRadius: 1,
                                  price: 8500, //8500
                                  hoursUnlocked: 168, //1 week
                                  levelEligibleAt: 9,
                                  phrases: [Phrase(name: "Moo",
                                                   likelihood: 10,
                                                   subphrases: [Subphrase(words: "Moo", audioFilePath: Bundle.main.path(forResource: "Moo1", ofType: "m4a", inDirectory: "Audio/Cow"))
                                                    
                                    ],
                                                   slots: [//Slot(tone: -500, color: UIColor(red: 99/255, green: 109/255, blue: 247/255, alpha: 1)), //blue sky
                                                            Slot(tone: -1000, color: UIColor(red: 227/255, green: 223/255, blue: 211/255, alpha: 1)), //face/horns
                                                    Slot(tone: -1000, color: UIColor(red: 227/255, green: 223/255, blue: 211/255, alpha: 1)), //face/horns
                                                            Slot(tone: -500, color: .white),
                                                           Slot(tone: -500, color: .white),
                                                           Slot(tone: -500, color: .white),
                                                           Slot(tone: -500, color: .white),
                                                           Slot(tone: -500, color: .black),
                                                           Slot(tone: -500, color: .white),
                                                           Slot(tone: -500, color: .white),
                                                           Slot(tone: -500, color: .black),
                                                           Slot(tone: -500, color: .black),
                                                           Slot(tone: -500, color: .white),
                                                           Slot(tone: -500, color: .white),
                                                           Slot(tone: -500, color: .white),
                                                           Slot(tone: -500, color: .white),
                                                           Slot(tone: 700, color: .black), //crotch
                                                           Slot(tone: -500, color: .white),
                                                           Slot(tone: -500, color: .brown), //feet
                                                           Slot(tone: -500, color: UIColor(red: 21/255, green: 140/255, blue: 5/255, alpha: 1)) //green grass
                                    ]),
                                            
                                            Phrase(name: "Moo",
                                                   likelihood: 10,
                                                   subphrases: [Subphrase(words: "Moo", audioFilePath: Bundle.main.path(forResource: "Moo4", ofType: "m4a", inDirectory: "Audio/Cow"))
                                                    
                                                ],
                                                   slots: [//Slot(tone: -500, color: UIColor(red: 99/255, green: 109/255, blue: 247/255, alpha: 1)), //blue sky
                                                    Slot(tone: -1000, color: UIColor(red: 227/255, green: 223/255, blue: 211/255, alpha: 1)), //face/horns
                                                    Slot(tone: -1000, color: UIColor(red: 227/255, green: 223/255, blue: 211/255, alpha: 1)), //face/horns
                                                    Slot(tone: -500, color: .white),
                                                    Slot(tone: -500, color: .white),
                                                    Slot(tone: -500, color: .black),
                                                    Slot(tone: -500, color: .white),
                                                    Slot(tone: -500, color: .white),
                                                    Slot(tone: -500, color: .black),
                                                    Slot(tone: -500, color: .white),
                                                    Slot(tone: -500, color: .white),
                                                    Slot(tone: -500, color: .white),
                                                    Slot(tone: -500, color: .white),
                                                    Slot(tone: -500, color: .black),
                                                    Slot(tone: -500, color: .black),
                                                    Slot(tone: -500, color: .white),
                                                    Slot(tone: 700, color: .black), //crotch
                                                    Slot(tone: -500, color: .white),
                                                    Slot(tone: -500, color: .brown), //feet
                                                    Slot(tone: -500, color: UIColor(red: 21/255, green: 140/255, blue: 5/255, alpha: 1)) //green grass
                                                ]),
                                            
                                            Phrase(name: "Moo",
                                                   likelihood: 10,
                                                   subphrases: [Subphrase(words: "Moo", audioFilePath: Bundle.main.path(forResource: "Moo2", ofType: "m4a", inDirectory: "Audio/Cow"))
                                                    
                                                ],
                                                   slots: [//Slot(tone: -500, color: UIColor(red: 99/255, green: 109/255, blue: 247/255, alpha: 1)), //blue sky
                                                    Slot(tone: -1000, color: UIColor(red: 227/255, green: 223/255, blue: 211/255, alpha: 1)), //face/horns
                                                    Slot(tone: -1000, color: UIColor(red: 227/255, green: 223/255, blue: 211/255, alpha: 1)), //face/horns
                                                    Slot(tone: -500, color: .white),
                                                    Slot(tone: -500, color: .brown),
                                                    Slot(tone: -500, color: .white),
                                                    Slot(tone: -500, color: .white),
                                                    Slot(tone: -500, color: .white),
                                                    Slot(tone: -500, color: .white),
                                                    Slot(tone: -500, color: .brown),
                                                    Slot(tone: -500, color: .brown),
                                                    Slot(tone: -500, color: .brown),
                                                    Slot(tone: -500, color: .white),
                                                    Slot(tone: -500, color: .brown),
                                                    Slot(tone: -500, color: .white),
                                                    Slot(tone: -500, color: .white),
                                                    Slot(tone: 700, color: .brown), //crotch
                                                    Slot(tone: -500, color: .white),
                                                    Slot(tone: -500, color: .black), //feet
                                                    Slot(tone: -500, color: UIColor(red: 21/255, green: 140/255, blue: 5/255, alpha: 1)) //green grass
                                                ]),
                                            Phrase(name: "Moo",
                                                   likelihood: 5,
                                                   subphrases: [Subphrase(words: "Moo!", audioFilePath: Bundle.main.path(forResource: "MooRough3", ofType: "m4a", inDirectory: "Audio/Cow"))
                                                    
                                                ],
                                                   slots: [//Slot(tone: -500, color: UIColor(red: 99/255, green: 109/255, blue: 247/255, alpha: 1)), //blue sky
                                                    Slot(tone: -800, color: UIColor(red: 227/255, green: 223/255, blue: 211/255, alpha: 1)), //face/horns
                                                    Slot(tone: -800, color: UIColor(red: 227/255, green: 223/255, blue: 211/255, alpha: 1)), //face/horns
                                                    Slot(tone: -300, color: .red),
                                                    Slot(tone: -300, color: .white),
                                                    Slot(tone: -300, color: .white),
                                                    Slot(tone: -300, color: .black),
                                                    Slot(tone: -300, color: .black),
                                                    Slot(tone: -300, color: .white),
                                                    Slot(tone: -300, color: .white),
                                                    Slot(tone: -300, color: .black),
                                                    Slot(tone: -300, color: .black),
                                                    Slot(tone: -300, color: .white),
                                                    Slot(tone: -300, color: .white),
                                                    Slot(tone: -300, color: .white),
                                                    Slot(tone: -300, color: .white),
                                                    Slot(tone: 700, color: .black), //crotch
                                                    Slot(tone: -300, color: .white),
                                                    Slot(tone: -300, color: .brown), //feet
                                                    Slot(tone: -500, color: UIColor(red: 21/255, green: 140/255, blue: 5/255, alpha: 1)) //green grass
                                                ]),
                                            
                                            Phrase(name: "Moo",
                                                   likelihood: 9,
                                                   subphrases: [Subphrase(words: "Moo", audioFilePath: Bundle.main.path(forResource: "TheLongMoo5", ofType: "m4a", inDirectory: "Audio/Cow"))
                                                    
                                                ],
                                                   slots: [//Slot(tone: -500, color: UIColor(red: 99/255, green: 109/255, blue: 247/255, alpha: 1)), //blue sky
                                                    Slot(tone: -1000, color: UIColor(red: 227/255, green: 223/255, blue: 211/255, alpha: 1)), //face/horns
                                                    Slot(tone: -1000, color: UIColor(red: 227/255, green: 223/255, blue: 211/255, alpha: 1)), //face/horns
                                                    Slot(tone: -500, color: .white),
                                                    Slot(tone: -500, color: .white),
                                                    Slot(tone: -500, color: .white),
                                                    Slot(tone: -500, color: .brown),
                                                    Slot(tone: -500, color: .brown),
                                                    Slot(tone: -500, color: .white),
                                                    Slot(tone: -500, color: .white),
                                                    Slot(tone: -500, color: .white),
                                                    Slot(tone: -500, color: .brown),
                                                    Slot(tone: -500, color: .white),
                                                    Slot(tone: -500, color: .white),
                                                    Slot(tone: -500, color: .brown),
                                                    Slot(tone: -500, color: .brown),
                                                    Slot(tone: 700, color: .white), //crotch
                                                    Slot(tone: -500, color: .white),
                                                    Slot(tone: -500, color: .black), //feet
                                                    Slot(tone: -500, color: UIColor(red: 21/255, green: 140/255, blue: 5/255, alpha: 1)) //green grass
                                                ])
                                    
                                    
        ])
    
    // MARK: Sparkle
    static let Sparkle = Character(name: "Sparklė",
                                  gameDescription: "Shė motivatės the motivators.  No challėngė gėts hėr down!",
                                  topRadius: 15,
                                  bottomRadius: 15,
                                  price: 175000, //175000
        hoursUnlocked: 960, //40 Days
        levelEligibleAt: 106, //106
        phrases: [Phrase(name: "Keep up the good work",
                         likelihood: 20,
                         subphrases: [Subphrase(words: "Keep", audioFilePath: Bundle.main.path(forResource: "Keep1", ofType: "m4a", inDirectory: "Audio/Sparkle")),
                                      Subphrase(words: "Up", audioFilePath: Bundle.main.path(forResource: "Up1", ofType: "m4a", inDirectory: "Audio/Sparkle")),
                                      Subphrase(words: "The", audioFilePath: Bundle.main.path(forResource: "The1", ofType: "m4a", inDirectory: "Audio/Sparkle")),
                                      Subphrase(words: "Good", audioFilePath: Bundle.main.path(forResource: "Good1", ofType: "m4a", inDirectory: "Audio/Sparkle")),
                                      Subphrase(words: "Work", audioFilePath: Bundle.main.path(forResource: "Work1", ofType: "m4a", inDirectory: "Audio/Sparkle"))
                            
            ],
                         slots: [
                            Slot(tone: 800, color: UIColor(red: 230/255, green: 58/255, blue: 242/255, alpha: 1)), //bright green
                            Slot(tone: 800, color: UIColor(red: 230/255, green: 58/255, blue: 242/255, alpha: 1)), //bright green
                            Slot(tone: 700, color: UIColor(red: 82/255, green: 252/255, blue: 3/255, alpha: 1)), //pink
                            Slot(tone: 700, color: UIColor(red: 82/255, green: 252/255, blue: 3/255, alpha: 1)), //pink
                            Slot(tone: 600, color: UIColor(red: 245/255, green: 237/255, blue: 17/255, alpha: 1)), //bright yellow
                            Slot(tone: 600, color: UIColor(red: 245/255, green: 237/255, blue: 17/255, alpha: 1)), //bright yellow
                            Slot(tone: 500, color: UIColor(red: 177/255, green: 249/255, blue: 10/255, alpha: 1)), //yellow greenish
                            Slot(tone: 500, color: UIColor(red: 177/255, green: 249/255, blue: 10/255, alpha: 1)), //yellow greenish
                            Slot(tone: 400, color: UIColor(red: 31/255, green: 114/255, blue: 247/255, alpha: 1)), //bright blue
                            Slot(tone: 400, color: UIColor(red: 31/255, green: 114/255, blue: 247/255, alpha: 1)) //bright blue
                            
            ]),
    
                  Phrase(name: "That was amazing",
                         likelihood: 20,
                         subphrases: [Subphrase(words: "That", audioFilePath: Bundle.main.path(forResource: "That2", ofType: "m4a", inDirectory: "Audio/Sparkle")),
                                      Subphrase(words: "Was", audioFilePath: Bundle.main.path(forResource: "Was2", ofType: "m4a", inDirectory: "Audio/Sparkle")),
                                      Subphrase(words: "Amazing", audioFilePath: Bundle.main.path(forResource: "Amazing2", ofType: "m4a", inDirectory: "Audio/Sparkle"))
                                      
                                      ],
                         slots: [
                            Slot(tone: 800, color: UIColor(red: 230/255, green: 58/255, blue: 242/255, alpha: 1)), //bright green
                            Slot(tone: 800, color: UIColor(red: 230/255, green: 58/255, blue: 242/255, alpha: 1)), //bright green
                            Slot(tone: 700, color: UIColor(red: 82/255, green: 252/255, blue: 3/255, alpha: 1)), //pink
                            Slot(tone: 700, color: UIColor(red: 82/255, green: 252/255, blue: 3/255, alpha: 1)), //pink
                            Slot(tone: 700, color: UIColor(red: 82/255, green: 252/255, blue: 3/255, alpha: 1)), //pink
                            Slot(tone: 700, color: UIColor(red: 82/255, green: 252/255, blue: 3/255, alpha: 1)), //pink
                            Slot(tone: 600, color: UIColor(red: 245/255, green: 237/255, blue: 17/255, alpha: 1)), //bright yellow
                            Slot(tone: 600, color: UIColor(red: 245/255, green: 237/255, blue: 17/255, alpha: 1)), //bright yellow
                            Slot(tone: 500, color: UIColor(red: 177/255, green: 249/255, blue: 10/255, alpha: 1)), //yellow greenish
                            Slot(tone: 500, color: UIColor(red: 177/255, green: 249/255, blue: 10/255, alpha: 1)), //yellow greenish
                            Slot(tone: 500, color: UIColor(red: 177/255, green: 249/255, blue: 10/255, alpha: 1)), //yellow greenish
                            Slot(tone: 500, color: UIColor(red: 177/255, green: 249/255, blue: 10/255, alpha: 1)), //yellow greenish
                            Slot(tone: 400, color: UIColor(red: 31/255, green: 114/255, blue: 247/255, alpha: 1)), //bright blue
                            Slot(tone: 400, color: UIColor(red: 31/255, green: 114/255, blue: 247/255, alpha: 1)) //bright blue
                            
                    ]),
    
                  Phrase(name: "You are doing great",
                         likelihood: 20,
                         subphrases: [Subphrase(words: "You", audioFilePath: Bundle.main.path(forResource: "You3", ofType: "m4a", inDirectory: "Audio/Sparkle")),
                                      Subphrase(words: "Are", audioFilePath: Bundle.main.path(forResource: "Are3", ofType: "m4a", inDirectory: "Audio/Sparkle")),
                                      Subphrase(words: "Doing", audioFilePath: Bundle.main.path(forResource: "Doing3", ofType: "m4a", inDirectory: "Audio/Sparkle")),
                                      Subphrase(words: "Great", audioFilePath: Bundle.main.path(forResource: "Great3", ofType: "m4a", inDirectory: "Audio/Sparkle"))
                            
                    ],
                         slots: [
                            Slot(tone: 900, color: UIColor(red: 230/255, green: 58/255, blue: 242/255, alpha: 1)), //bright green
                            Slot(tone: 900, color: UIColor(red: 230/255, green: 58/255, blue: 242/255, alpha: 1)), //bright green
                            Slot(tone: 800, color: UIColor(red: 82/255, green: 252/255, blue: 3/255, alpha: 1)), //pink
                            Slot(tone: 800, color: UIColor(red: 82/255, green: 252/255, blue: 3/255, alpha: 1)), //pink
                            Slot(tone: 700, color: UIColor(red: 245/255, green: 237/255, blue: 17/255, alpha: 1)), //bright yellow
                            Slot(tone: 700, color: UIColor(red: 245/255, green: 237/255, blue: 17/255, alpha: 1)) //bright yellow
                    ]),
    
                  Phrase(name: "You are very talented",
                         likelihood: 20,
                         subphrases: [Subphrase(words: "You", audioFilePath: Bundle.main.path(forResource: "You3", ofType: "m4a", inDirectory: "Audio/Sparkle")),
                                      Subphrase(words: "Are", audioFilePath: Bundle.main.path(forResource: "Are4", ofType: "m4a", inDirectory: "Audio/Sparkle")),
                                      Subphrase(words: "Very", audioFilePath: Bundle.main.path(forResource: "Very4", ofType: "m4a", inDirectory: "Audio/Sparkle")),
                                      Subphrase(words: "Talented", audioFilePath: Bundle.main.path(forResource: "Talented4", ofType: "m4a", inDirectory: "Audio/Sparkle"))
                            
                    ],
                         slots: [
                            Slot(tone: 900, color: UIColor(red: 230/255, green: 58/255, blue: 242/255, alpha: 1)), //bright green
                            Slot(tone: 800, color: UIColor(red: 82/255, green: 252/255, blue: 3/255, alpha: 1)), //pink
                            Slot(tone: 800, color: UIColor(red: 82/255, green: 252/255, blue: 3/255, alpha: 1)), //pink
                            Slot(tone: 800, color: UIColor(red: 82/255, green: 252/255, blue: 3/255, alpha: 1)), //pink
                            Slot(tone: 800, color: UIColor(red: 82/255, green: 252/255, blue: 3/255, alpha: 1)), //pink
                            Slot(tone: 700, color: UIColor(red: 245/255, green: 237/255, blue: 17/255, alpha: 1)) //bright yellow
                    ]),
    
                  Phrase(name: "You make me want to shine",
                         likelihood: 20,
                         subphrases: [Subphrase(words: "You", audioFilePath: Bundle.main.path(forResource: "You5", ofType: "m4a", inDirectory: "Audio/Sparkle")),
                                      Subphrase(words: "Make", audioFilePath: Bundle.main.path(forResource: "Make5", ofType: "m4a", inDirectory: "Audio/Sparkle")),
                                      Subphrase(words: "Me", audioFilePath: Bundle.main.path(forResource: "Me5", ofType: "m4a", inDirectory: "Audio/Sparkle")),
                                      Subphrase(words: "Want", audioFilePath: Bundle.main.path(forResource: "Want6", ofType: "m4a", inDirectory: "Audio/Sparkle")),
                                      Subphrase(words: "To", audioFilePath: Bundle.main.path(forResource: "To5", ofType: "m4a", inDirectory: "Audio/Sparkle")),
                                      Subphrase(words: "Shine", audioFilePath: Bundle.main.path(forResource: "Shine5", ofType: "m4a", inDirectory: "Audio/Sparkle"))
                            
                    ],
                         slots: [
                            Slot(tone: 800, color: UIColor(red: 230/255, green: 58/255, blue: 242/255, alpha: 1)), //bright green
                            Slot(tone: 700, color: UIColor(red: 245/255, green: 237/255, blue: 17/255, alpha: 1)), //bright yellow
                            Slot(tone: 700, color: UIColor(red: 245/255, green: 237/255, blue: 17/255, alpha: 1)), //bright yellow
                            Slot(tone: 700, color: UIColor(red: 245/255, green: 237/255, blue: 17/255, alpha: 1)), //bright yellow
                            Slot(tone: 700, color: UIColor(red: 245/255, green: 237/255, blue: 17/255, alpha: 1)), //bright yellow
                            Slot(tone: 600, color: UIColor(red: 82/255, green: 252/255, blue: 3/255, alpha: 1)) //pink
                           
                    ]),
    
                  Phrase(name: "You make me want to sparkle",
                         likelihood: 1,
                         subphrases: [Subphrase(words: "You", audioFilePath: Bundle.main.path(forResource: "You5", ofType: "m4a", inDirectory: "Audio/Sparkle")),
                                      Subphrase(words: "Make", audioFilePath: Bundle.main.path(forResource: "Make6", ofType: "m4a", inDirectory: "Audio/Sparkle")),
                                      Subphrase(words: "Me", audioFilePath: Bundle.main.path(forResource: "Me6", ofType: "m4a", inDirectory: "Audio/Sparkle")),
                                      Subphrase(words: "Want", audioFilePath: Bundle.main.path(forResource: "Want6", ofType: "m4a", inDirectory: "Audio/Sparkle")),
                                      Subphrase(words: "To", audioFilePath: Bundle.main.path(forResource: "To5", ofType: "m4a", inDirectory: "Audio/Sparkle")),
                                      Subphrase(words: "Sparkle", audioFilePath: Bundle.main.path(forResource: "Sparkle6", ofType: "m4a", inDirectory: "Audio/Sparkle"))
                            
                    ],
                         slots: [
                            Slot(tone: 800, color: UIColor(red: 82/255, green: 252/255, blue: 3/255, alpha: 1)), //pink
                            Slot(tone: 700, color: UIColor(red: 230/255, green: 58/255, blue: 242/255, alpha: 1)), //bright green
                            Slot(tone: 600, color: UIColor(red: 245/255, green: 237/255, blue: 17/255, alpha: 1)), //bright yellow
                            Slot(tone: 500, color: UIColor(red: 177/255, green: 249/255, blue: 10/255, alpha: 1)), //yellow greenish
                            Slot(tone: 400, color: UIColor(red: 245/255, green: 237/255, blue: 17/255, alpha: 1)), //bright yellow
                            Slot(tone: 300, color: UIColor(red: 31/255, green: 114/255, blue: 247/255, alpha: 1)), //bright blue
                            Slot(tone: 200, color: UIColor(red: 82/255, green: 252/255, blue: 3/255, alpha: 1)) //pink
                            
                    ]),
    
                  Phrase(name: "Youre the best",
                         likelihood: 20,
                         subphrases: [Subphrase(words: "You're", audioFilePath: Bundle.main.path(forResource: "Youre7", ofType: "m4a", inDirectory: "Audio/Sparkle")),
                                      Subphrase(words: "The", audioFilePath: Bundle.main.path(forResource: "The7", ofType: "m4a", inDirectory: "Audio/Sparkle")),
                                      Subphrase(words: "Best", audioFilePath: Bundle.main.path(forResource: "Best7", ofType: "m4a", inDirectory: "Audio/Sparkle"))
                    ],
                         slots: [
                            
                            Slot(tone: 700, color: UIColor(red: 245/255, green: 237/255, blue: 17/255, alpha: 1)), //bright yellow
                            Slot(tone: 600, color: UIColor(red: 177/255, green: 249/255, blue: 10/255, alpha: 1)), //yellow greenish
                            Slot(tone: 500, color: UIColor(red: 31/255, green: 114/255, blue: 247/255, alpha: 1)), //bright blue
                            Slot(tone: 400, color: UIColor(red: 230/255, green: 58/255, blue: 242/255, alpha: 1)), //bright green
                            Slot(tone: 300, color: UIColor(red: 82/255, green: 252/255, blue: 3/255, alpha: 1)) //pink
                            
                    ])
    ])
    
    // MARK: Earl
    static let Earl = Character(name: "Earl",
                                gameDescription: "Calm confirmation; manly motivation.  Cėrtifiėd to lowėr your blood prėssurė.",
                                   topRadius: 25,
                                   bottomRadius: 15,
                                   price: 75000, //75000
        hoursUnlocked: 960, //40 Days, 960
        levelEligibleAt: 50, //50
        phrases: [Phrase(name: "I knew you could do it",
                         likelihood: 70,
                         subphrases: [Subphrase(words: "I", audioFilePath: Bundle.main.path(forResource: "I1", ofType: "m4a", inDirectory: "Audio/Earl")),
                                      Subphrase(words: "Knew", audioFilePath: Bundle.main.path(forResource: "Knew1", ofType: "m4a", inDirectory: "Audio/Earl")),
                                      Subphrase(words: "You", audioFilePath: Bundle.main.path(forResource: "You1", ofType: "m4a", inDirectory: "Audio/Earl")),
                                      Subphrase(words: "Could", audioFilePath: Bundle.main.path(forResource: "Could1", ofType: "m4a", inDirectory: "Audio/Earl")),
                                      Subphrase(words: "Do", audioFilePath: Bundle.main.path(forResource: "Do1", ofType: "m4a", inDirectory: "Audio/Earl")),
                                      Subphrase(words: "It", audioFilePath: Bundle.main.path(forResource: "It1", ofType: "m4a", inDirectory: "Audio/Earl"))
                            
            ],
                         slots: [
                            Slot(tone: -25, color: UIColor(red: 66/255, green: 54/255, blue: 194/255, alpha: 1)), //calm dark blue
                            Slot(tone: -50, color: UIColor(red: 209/255, green: 99/255, blue: 44/255, alpha: 1)), //calm red orange
                            Slot(tone: -75, color: UIColor(red: 194/255, green: 125/255, blue: 41/255, alpha: 1)), //calm orange brown
                            Slot(tone: -100, color: UIColor(red: 54/255, green: 147/255, blue: 194/255, alpha: 1)) //calm light blue
                            
            ]),
                  
                  Phrase(name: "Really good",
                         likelihood: 70,
                         subphrases: [//Subphrase(words: "That", audioFilePath: Bundle.main.path(forResource: "That3", ofType: "m4a", inDirectory: "Audio/Earl")),
                                      //Subphrase(words: "Was", audioFilePath: Bundle.main.path(forResource: "Was3", ofType: "m4a", inDirectory: "Audio/Earl")),
                                      Subphrase(words: "Really", audioFilePath: Bundle.main.path(forResource: "Really2", ofType: "m4a", inDirectory: "Audio/Earl")),
                                      Subphrase(words: "Good", audioFilePath: Bundle.main.path(forResource: "Good2", ofType: "m4a", inDirectory: "Audio/Earl"))
                            
                    ],
                         slots: [
                            Slot(tone: -25, color: UIColor(red: 66/255, green: 54/255, blue: 194/255, alpha: 1)), //calm dark blue
                            Slot(tone: -50, color: UIColor(red: 209/255, green: 99/255, blue: 44/255, alpha: 1)), //calm red orange
                            Slot(tone: -50, color: UIColor(red: 209/255, green: 99/255, blue: 44/255, alpha: 1)), //calm red orange
                            Slot(tone: -75, color: UIColor(red: 194/255, green: 125/255, blue: 41/255, alpha: 1)), //calm orange brown
                            Slot(tone: -100, color: UIColor(red: 54/255, green: 147/255, blue: 194/255, alpha: 1)), //calm light blue
                            Slot(tone: -100, color: UIColor(red: 54/255, green: 147/255, blue: 194/255, alpha: 1)) //calm light blue
                            
                    ]),
                  
                  Phrase(name: "That Was amazing",
                         likelihood: 70,
                         subphrases: [Subphrase(words: "That", audioFilePath: Bundle.main.path(forResource: "That3", ofType: "m4a", inDirectory: "Audio/Earl")),
                                      Subphrase(words: "Was", audioFilePath: Bundle.main.path(forResource: "Was3", ofType: "m4a", inDirectory: "Audio/Earl")),
                                      Subphrase(words: "Amazing", audioFilePath: Bundle.main.path(forResource: "Amazing3", ofType: "m4a", inDirectory: "Audio/Earl"))
                            
                    ],
                         slots: [
                            Slot(tone: -25, color: UIColor(red: 66/255, green: 54/255, blue: 194/255, alpha: 1)), //calm dark blue
                            Slot(tone: -25, color: UIColor(red: 66/255, green: 54/255, blue: 194/255, alpha: 1)), //calm dark blue
                            Slot(tone: -50, color: UIColor(red: 209/255, green: 99/255, blue: 44/255, alpha: 1)), //calm red orange
                            Slot(tone: -75, color: UIColor(red: 194/255, green: 125/255, blue: 41/255, alpha: 1)), //calm orange brown
                            Slot(tone: -75, color: UIColor(red: 194/255, green: 125/255, blue: 41/255, alpha: 1)), //calm orange brown
                            Slot(tone: -100, color: UIColor(red: 54/255, green: 147/255, blue: 194/255, alpha: 1)), //calm light blue
                            
                    ]),
                  
                  Phrase(name: "That Was excellent",
                         likelihood: 1,
                         subphrases: [Subphrase(words: "That", audioFilePath: Bundle.main.path(forResource: "That4", ofType: "m4a", inDirectory: "Audio/Earl")),
                                      Subphrase(words: "Was", audioFilePath: Bundle.main.path(forResource: "Was4", ofType: "m4a", inDirectory: "Audio/Earl")),
                                      Subphrase(words: "Amazing", audioFilePath: Bundle.main.path(forResource: "Excellent4", ofType: "m4a", inDirectory: "Audio/Earl"))
                            
                    ],
                         slots: [
                            Slot(tone: -25, color: UIColor(red: 66/255, green: 54/255, blue: 194/255, alpha: 1)), //calm dark blue
                            Slot(tone: -25, color: UIColor(red: 66/255, green: 54/255, blue: 194/255, alpha: 1)), //calm dark blue
                            Slot(tone: -50, color: UIColor(red: 209/255, green: 99/255, blue: 44/255, alpha: 1)), //calm red orange
                            Slot(tone: -50, color: UIColor(red: 209/255, green: 99/255, blue: 44/255, alpha: 1)), //calm red orange
                            Slot(tone: -75, color: UIColor(red: 194/255, green: 125/255, blue: 41/255, alpha: 1)), //calm orange brown
                            Slot(tone: -75, color: UIColor(red: 194/255, green: 125/255, blue: 41/255, alpha: 1)), //calm orange brown
                            
                    ]),
                  
        ])
    
}
