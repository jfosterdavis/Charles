//
//  Phrase.swift
//  Charles
//
//  Created by Jacob Foster Davis on 5/7/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation


/**
 A Phrase object contains a single phrase and the associated tones and colors for a Character in Charles.  Phrase objects are contained in Character objects.  Phrase objects contain Subphrase objects and Slot objects.
 
 - Objects:
   - name: name of the phrase
   - likelihood: a number between 0 and 100 (inclusive) that will represent the likelihood the phrase will be called, relative to other phrases
   - subphrases: array of Subphrase objects
   - slots: array of Slot objects
 */
class Phrase: NSObject {
    
    var name: String! //the name of the phrase
    var likelihood: Int! //a number between 0 and 100 (inclusive) that will represent the likelihood the phrase will be called, relative to other phrases
    
    var subphrases: [Subphrase]? //array of Subphrase objects
    var slots: [Slot]? //array of Slot objects
    
    // MARK: Initializers
    init(name: String, likelihood: Int, subphrases: [Subphrase]?, slots: [Slot]?) {
        super.init()
        
        self.name = name
        self.likelihood = likelihood
        self.subphrases = subphrases
        self.slots = slots
    }
}
