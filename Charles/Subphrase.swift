//
//  Subphrase.swift
//  Charles
//
//  Created by Jacob Foster Davis on 5/7/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation

/**
 A Subphrase object contains the words and audiofile for part of the phrase.  Subphrase objects are contained in Phrase objects.
 
 - Objects:
   -  words: the words of the subphrase
   -  audio: an audio file.  If this is not present the words will be spoken by a computer.
 */
struct Subphrase {
    
    var words: String! //the words of the subphrase
    var audioFilePath: String? //an audio file.  If this is not present the words will be spoken by a computer.
    
    // MARK: Initializers
    init(words: String, audioFilePath: String?){
        self.words = words
        self.audioFilePath = audioFilePath
    }
}
