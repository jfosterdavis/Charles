//
//  Character.swift
//  Charles
//
//  Created by Jacob Foster Davis on 5/7/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation


/**
 A Character object contains all the phrases, tones, and colors for a character in Charles.
 
 - Objects:
   - name: name of the character
   - phrases: an array of phrase objects
 */
class Character: NSObject {
    
    var name: String! //the name of the character (will be displayed)
    
    var phrases: [Phrase]? //an array of phrase objects
    
    // MARK: Initializers
    init(name: String) {
        super.init()
        
        self.name = name
    }
}
