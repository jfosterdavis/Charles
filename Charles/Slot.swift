//
//  Slot.swift
//  Charles
//
//  Created by Jacob Foster Davis on 5/7/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation
import UIKit

/**
 A Slot object contains the tone and color part of the phrase.  Slot objects are contained in Phrase objects.  For each slot object, an area on the screen will be displayed for the user to touch, and the words will be said based on the tone of this object.
 
 - Objects:
 -  words: the words of the subphrase
 -  audio: an audio file.  If this is not present the words will be spoken by a computer.
 */
struct Slot {
    
    var tone: Float! //the frequency the words should be spoken in
    var color: UIColor //color of the region of the slot
    
    // MARK: Initializers
    init(tone: Float, color: UIColor) {
        self.tone = tone
        self.color = color
    }
}
