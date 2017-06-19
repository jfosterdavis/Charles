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
    
    /******************************************************/
    /*******************///MARK: Stats
    /******************************************************/
    
    @IBOutlet weak var statsStackView: UIStackView!
    
    @IBOutlet weak var puzzlesTitleTextLabel: UILabel!
    @IBOutlet weak var puzzlesValueTextLabel: UILabel!
    
    @IBOutlet weak var scoreTitleTextLabel: UILabel!
    @IBOutlet weak var scoreValueTextLabel: UILabel!
    
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
        
        //load stats labels
        puzzlesTitleTextLabel.text = "Rounds"
        scoreTitleTextLabel.text = "Net"
        
        //show the stats
        statsStackView.isHidden = false
        
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
        
        //hide the stats
        statsStackView.isHidden = true
    }
    
    ///sets the status to not achieved, but will then allow clues to be shown.  Clue will be enabled if flag is set to true
    func setStatusNotAchievedButCluesOnly(enabled: Bool = false) {
        setStatusNotAchieved()
        
        //show the clue
        clueButton.isHidden = false
        clueButton.isEnabled = enabled
    }
    
    ///replaces the statistics with the success and failure criteria
    func replaceStatsLabelsWithCriteriaAndShow() {
        
        //load stats labels
        puzzlesTitleTextLabel.text = "Success"
        scoreTitleTextLabel.text = "Failure"
        
        //show the stats
        statsStackView.isHidden = false
        
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
