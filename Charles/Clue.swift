//
//  Clue.swift
//  Charles
//
//  Created by Jacob Foster Davis on 6/16/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation
import UIKit

/******************************************************/
/*******************///MARK: Data needed to present the user with a clue on how to play this flipping game.
/******************************************************/


class Clue: NSObject {
    
    var clueTitle: String
    var part1: String
    var part1Image: UIImage?
    var part2: String?
    var part2Image: UIImage?
    var part3: String?
    var part3Image: UIImage?
    
    
    // MARK: Initializers
    init(clueTitle: String,
         part1: String,
         part1Image: UIImage?,
         part2: String?,
         part2Image: UIImage?,
         part3: String?,
         part3Image: UIImage? ) {

        self.clueTitle = clueTitle
        self.part1 = part1
        if let part1Image = part1Image {
            self.part1Image = part1Image
        }
        if let part2 = part2 {
            self.part2 = part2
        }
        if let part2Image = part2Image {
            self.part2Image = part2Image
        }
        if let part3 = part3 {
            self.part3 = part3
        }
        if let part3Image = part3Image {
            self.part3Image = part3Image
        }
        
         super.init()
    }
}
