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
    
    @IBOutlet weak var readableShadedRegionView: UIView!
    
    @IBOutlet weak var infoTextLabel: UILabel!
    
    
    /******************************************************/
    /*******************///MARK: Stats
    /******************************************************/
    
    @IBOutlet weak var statsStackView: UIStackView!
    
    @IBOutlet weak var puzzlesTitleTextLabel: UILabel!
    @IBOutlet weak var puzzlesValueTextLabel: UILabel!
    
    @IBOutlet weak var scoreTitleTextLabel: UILabel!
    @IBOutlet weak var scoreValueTextLabel: UILabel!
    
    @IBOutlet weak var matchRateStackView: UIStackView!
    @IBOutlet weak var matchRateTitleTextLabel: UILabel!
    @IBOutlet weak var matchRateValueTextLabel: UILabel!
    
    
    
    var clue: Clue?
    var storyboard: UIStoryboard?
    var pulseToggle = false
    let shadedRegionBaselineAlpha:CGFloat = 0.7
    var timer = Timer()
    
    /// Adds buttons from the given phrase to the stackview
    func loadAppearance(from levelData: Level) {
        self.roundCorners(with: 8)
        readableShadedRegionView.roundCorners(with: 6)
        readableShadedRegionView.alpha = shadedRegionBaselineAlpha
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
        matchRateTitleTextLabel.text = "Accuracy"
        
        //show the stats
        statsStackView.isHidden = false
        
        //keep avg match hidden
        matchRateStackView.isHidden = false
        
        //background color
        backgroundColor = UIColor(red: 28/255, green: 28/255, blue: 28/255, alpha: 1)
        
        //don't pulse
        stopPulse()
        
        //hide info label
        infoTextLabel.isHidden = true
        
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
        
        //background color
        backgroundColor = UIColor(red: 28/255, green: 28/255, blue: 28/255, alpha: 1)
        
        //hide info label
        infoTextLabel.isHidden = true
        
    }
    
    ///sets the status to not achieved, but will then allow clues to be shown.  Clue will be enabled if flag is set to true
    func setStatusNotAchievedButCluesOnly(enabled: Bool = false) {
        setStatusNotAchieved()
        
        //show the clue
        
        if self.clue != nil {
            //if there is a clue, make this visible, otherwise not
            clueButton.isHidden = false
            //show info label
            showInfoLabel()
        } else {
            clueButton.isHidden = true
        }
        
        clueButton.isEnabled = enabled
        
        levelDescriptionTextLabel.isHidden = true
        levelDescriptionTextLabel.text = "Expect:"
    }
    
    ///replaces the statistics with the success and failure criteria
    func replaceStatsLabelsWithCriteriaAndShow(from levelData: Level) {
        
        //load stats labels
        let greaterThanOrEqualTo = "\u{2265}"
        let lessThanOrEqualTo = "\u{2264}"
        puzzlesTitleTextLabel.text = "Success \(greaterThanOrEqualTo)"
        scoreTitleTextLabel.text = "Failure \(lessThanOrEqualTo)"
        
        //title label
        //levelDescriptionTextLabel.isHidden = false
        //levelDescriptionTextLabel.text = "Upcoming"
        
        //show the stats
        statsStackView.isHidden = false
        
        //also show the level number
        levelNumberTextLabel.text = String(describing: levelData.level)
        
        //keep avg match hidden
        matchRateStackView.isHidden = true
        
        //show info label
        showInfoLabel()
        
    }
    
    ///shows the info label
    func showInfoLabel(withMessage message: String = "Info:"){
        infoTextLabel.text = message
        infoTextLabel.isHidden = false
    }
    
    ///pulses the shader to draw attention to itself
    func pulse() {
        
        if pulseToggle {
            
            //fade in
            let newAlpha = shadedRegionBaselineAlpha
            readableShadedRegionView.fade(.inOrOut,
                                          resultAlpha: newAlpha,
                                          withDuration: 1,
                                          delay: 0,
                                          completion: nil)
            
            pulseToggle = false
        } else {
            //fade out
            let newAlpha = shadedRegionBaselineAlpha / 3 * 2
            readableShadedRegionView.fade(.inOrOut,
                                          resultAlpha: newAlpha,
                                          withDuration: 0.5,
                                          delay: 0,
                                          completion: nil)
            pulseToggle = true
        }
        
        //set a timer to call this again
        
    }
    
    ///starts the pulse timer
    func startPulse() {
        //start the timer
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(pulse), userInfo: nil, repeats: true)
    }
    
    ///stops the pulse timer
    func stopPulse() {
        //stop timer
        timer.invalidate()
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
