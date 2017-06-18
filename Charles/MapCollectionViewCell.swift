//
//  MapCollectionViewCell.swift
//  Charles
//
//  Created by Jacob Foster Davis on 6/18/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation
import UIKit

class MapCollectionViewCell: UICollectionViewCell {
    
    //label
    @IBOutlet weak var levelNumberTextLabel: UILabel!
    @IBOutlet weak var levelDescriptionTextLabel: UILabel!
    
    @IBOutlet weak var clueButton: UIButton!
    
    var clue: Clue?
    var storyboard: UIStoryboard?

    /// Adds buttons from the given phrase to the stackview
    func loadAppearance(from levelData: Level) {
        self.roundCorners(with: 8)
        levelNumberTextLabel.isHidden = false
        levelNumberTextLabel.text = String(describing: levelData.level)
        levelDescriptionTextLabel.isHidden = false
        levelDescriptionTextLabel.text = String(describing: levelData.levelDescription!)
        
        clueButton.roundCorners(with: 5)
        
        if self.clue != nil {
            //if there is a clue, make this visible, otherwise not
            clueButton.isHidden = false
            clueButton.isEnabled = true
        } else {
            clueButton.isHidden = true
            clueButton.isEnabled = false
        }
        
    }
    
    
    /******************************************************/
    /*******************///MARK: Status
    /******************************************************/
    
    ///sets the status to unlocked
    func setStatusNotAchieved() {
        //player has not achieved this yet so gray out important parts
        
        levelNumberTextLabel.text = "?"
        levelDescriptionTextLabel.isHidden = true
        
        //hide the clue
        clueButton.isHidden = true
        clueButton.isEnabled = false
    }
    
    @IBAction func clueButtonPressed(_ sender: Any) {
        //launch the clue if it exists
        
        if let clue = self.clue, let storyboard = self.storyboard {
            let topVC = topMostController()
            let clueVC = storyboard.instantiateViewController(withIdentifier: "BasicClueViewController") as! BasicClueViewController
            clueVC.clue = clue
            clueVC.delayDismissButton = false
            topVC.present(clueVC, animated: true, completion: nil)
        }
    }
}
