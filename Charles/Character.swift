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
    
    /// returns a phrase from the list of phrases based on the given liklihoods contined within the object
    func selectRandomPhrase() -> Phrase? {
        //1. Determine which phrase will be spoken and loaded
        var tickets = 0 //the number of tickets in the hat, from which we will pull one
        var chosenPhrase: Phrase = Phrase(name: "Temporary Phrase", likelihood: 0)
        
        if let phrases = self.phrases {
            for phrase in phrases {
                tickets += phrase.likelihood //add a number of tickets to the hat
            }
            
            
            if tickets > 0 { //if there are tickets, pick one of them
                let drawnTicket = Utilities.random(range: 1...tickets) //draw a ticket
                
                var drawCounter = 0
                //figure out which ticket this belongs to
                repeat {
                    for phrase in phrases {
                        drawCounter += phrase.likelihood
                        if drawnTicket <= drawCounter {
                            chosenPhrase = phrase
                            break
                        }
                    }
                } while drawnTicket >= drawCounter
                return chosenPhrase
                
            } else {
                //TODO: Handle case of no tickets
                
                return nil
            }
        } else {
            //TODO: Handle no phrases in the object
            return nil
        }
        
        
    }
}
