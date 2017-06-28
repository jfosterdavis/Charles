//
//  CommonStoreCollectionViewCell.swift
//  Charles
//
//  Created by Jacob Foster Davis on 6/28/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation
import UIKit

class CommonStoreCollectionViewCell: UICollectionViewCell {

    var storyboard: UIStoryboard? = nil
    var canUserHighlight = true
    
    @IBAction func infoButtonPressed(_ sender: Any) {
    
        print("override infoButtonPressed in sublcass")
    }
    
}
