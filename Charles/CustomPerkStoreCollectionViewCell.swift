//
//  CustomPerkStoreCollectionViewCell.swift
//  Charles
//
//  Created by Jacob Foster Davis on 5/29/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation
import UIKit

class CustomPerkStoreCollectionViewCell: CustomStoreCollectionViewCell {
    
    
    @IBOutlet weak var perkIconImageView: UIImageView!
    @IBOutlet weak var perkColorFrame: UIView!
    
    /// Adds buttons from the given phrase to the stackview
    func loadAppearance(fromPerk perk: Perk) {
        
        //empty all
        for subView in stackView.subviews {
            stackView.removeArrangedSubview(subView)
            
            //remove button from heirarchy
            subView.removeFromSuperview()
        }
        
        //create the ImageView
        perkIconImageView.image = perk.icon
        //perkIconImageView.backgroundColor = perk.displayColor
        
        //color the border
        perkColorFrame.layer.borderWidth = 4
        perkColorFrame.layer.borderColor = perk.displayColor.cgColor
        
        //stackView.addArrangedSubview(imageView)
                
        roundCorners()
        
        
        
    }

    
}
