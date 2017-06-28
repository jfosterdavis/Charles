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
    @IBOutlet weak var perkClueButton: UIButton!
    @IBOutlet weak var characterView: CharacterView!
    @IBOutlet weak var characterClueButton: UIButton!
    
    @IBOutlet weak var readableShadedRegionView: UIView!
    
    @IBOutlet weak var infoTextLabel: UILabel!
    
    @IBOutlet weak var infoButtonsStackView: UIStackView!
    
    
    
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
    var perkClue: Perk?
    var characterClue: Character?
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
        perkClueButton.roundCorners(with: 5)
        characterClueButton.roundCorners(with: 8)
        
        //clues
        infoButtonsStackView.isHidden = false
        if self.clue != nil {
            //if there is a clue, make this visible, otherwise not
            clueButton.isHidden = false
            clueButton.isEnabled = true
        } else {
            clueButton.isHidden = true
            clueButton.isEnabled = false
        }
        
        //perk clue
        if self.perkClue != nil {
            //if there is a clue, make this visible, otherwise not
            perkClueButton.setImage(perkClue?.icon, for: .normal)
            perkClueButton.isHidden = false
            perkClueButton.isEnabled = true
        } else {
            perkClueButton.isHidden = true
            perkClueButton.isEnabled = false
        }
        
        //character clue
        if self.characterClue != nil {
            //if there is a clue, make this visible, otherwise not
            characterClueButton.isHidden = false
            characterClueButton.isEnabled = true
            
            //draw the character
            let phrase = characterClue!.phrases![0]
            characterView.phrase = phrase
            characterView.setNeedsDisplay()
            characterView.isHidden = false
        } else {
            characterClueButton.isHidden = true
            characterClueButton.isEnabled = false
            
            characterView.isHidden = true
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
        
        //reset stats colors
        puzzlesValueTextLabel.textColor = UIColor(red: 255/255, green: 126/255, blue: 55/255, alpha: 1)
        scoreValueTextLabel.textColor = UIColor(red: 255/255, green: 126/255, blue: 55/255, alpha: 1)
        
        self.setNeedsLayout()
        
    }
    
    
    /******************************************************/
    /*******************///MARK: Status
    /******************************************************/
    
    ///sets the status to unlocked
    func setStatusNotAchieved() {
        //player has not achieved this yet so gray out important parts
        
        levelNumberTextLabel.text = "?"
        levelDescriptionTextLabel.isHidden = true
        
        //hide the clues
        clueButton.isHidden = true
        clueButton.isEnabled = false
        
        //hide the characterClue
        perkClueButton.isHidden = true
        perkClueButton.isEnabled = false
        characterView.isHidden = true
        
        //hide the perkClue
        characterClueButton.isHidden = true
        characterClueButton.isEnabled = false
        
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
        
        //show the clues
        infoButtonsStackView.isHidden = false
        //clue
        if self.clue != nil {
            //if there is a clue, make this visible, otherwise not
            clueButton.isHidden = false
            //show info label
            //showInfoLabel()
        } else {
            clueButton.isHidden = true
        }
        
        //perk clue
        if self.perkClue != nil {
            //if there is a clue, make this visible, otherwise not
            perkClueButton.isHidden = false
            perkClueButton.setImage(perkClue?.icon, for: .normal)
            //show info label
            //showInfoLabel()
        } else {
            perkClueButton.isHidden = true
        }
        
        //character clue
        if self.characterClue != nil {
            //if there is a clue, make this visible, otherwise not
            characterClueButton.isHidden = false
            characterView.isHidden = false
            //show info label
            //showInfoLabel()
        } else {
            characterClueButton.isHidden = true
            characterView.isHidden = true
        }
        
        clueButton.isEnabled = enabled
        perkClueButton.isEnabled = enabled
        characterClueButton.isEnabled = enabled
        
        //levelDescriptionTextLabel.isHidden = true
        //levelDescriptionTextLabel.text = "Expect:"
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
        
        //color success green and failure red
        puzzlesValueTextLabel.textColor = .green
        scoreValueTextLabel.textColor = .red
        
        //show info label
        showInfoLabel(withMessage: "Up Next:")
        
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
            let newAlpha = shadedRegionBaselineAlpha + (0.75 * (1 - shadedRegionBaselineAlpha)) //the base plus most the distance to full
            readableShadedRegionView.fade(.inOrOut,
                                          resultAlpha: newAlpha,
                                          withDuration: 1,
                                          delay: 0,
                                          completion: nil)
            
            pulseToggle = false
        } else {
            //fade out
            let newAlpha = shadedRegionBaselineAlpha / 4 * 3
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
            //clueVC.modalPresentationStyle = .pageSheet
            topVC.present(clueVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func perkClueButtonPressed(_ sender: Any) {
        //launch the clue if it exists

        print("perk clue button pressed")
        
        if let perk = self.perkClue {
        
            //create a clue based on the perk that was pressed
            let perkClue = Clue(clueTitle: perk.name,
                                part1: nil,
                                part1Image: perk.icon,
                                part2: perk.gameDescription
                                )
        
        
            if let storyboard = self.storyboard {
                let topVC = topMostController()
                let clueVC = storyboard.instantiateViewController(withIdentifier: "BasicClueViewController") as! BasicClueViewController
                clueVC.clue = perkClue
                clueVC.delayDismissButton = false
                //set the background
                clueVC.view.backgroundColor = UIColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 1) //store background color
                clueVC.overrideTextColor = UIColor(red: 249/255, green: 234/255, blue: 188/255, alpha: 1) //paper color
                clueVC.overrideGoldenRatio = true
                
                topVC.present(clueVC, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func characterClueButtonPressed(_ sender: Any) {
        //launch the clue if it exists

        print("character clue button pressed")
        
        if let character = self.characterClue {
            
            //create an image from the CharacterView to display
            //define the frame (size) for the view
            let screen = self.superview!.bounds
            let width = screen.width / 3.6 //make image 1/3 size of CV
            let height = width
            let frame = CGRect(x: 0, y: 0, width: width, height: height)
            let x = (screen.size.width - frame.size.width) * 0.5
            let y = (screen.size.height - frame.size.height) * 0.5
            let mainFrame = CGRect(x: x, y: y, width: frame.size.width, height: frame.size.height)
            
            //setup the paramaters for it to draw
            let characterView = CharacterView()
            characterView.frame = mainFrame
            characterView.phrase = character.phrases![0]
            characterView.setNeedsDisplay()
            
            let characterViewImage = characterView.asImage()
            
            //create a clue based on the perk that was pressed
            let characterClue = Clue(clueTitle: character.name,
                                part1: nil,
                                part1Image: characterViewImage,
                                part2: character.gameDescription
            )
            
            
            
            
            
            if let storyboard = self.storyboard {
                let topVC = topMostController()
                let clueVC = storyboard.instantiateViewController(withIdentifier: "BasicClueViewController") as! BasicClueViewController
                clueVC.clue = characterClue
                clueVC.delayDismissButton = false
                //set the background to paper color
                clueVC.view.backgroundColor = UIColor(red: 249/255, green: 234/255, blue: 188/255, alpha: 1) //paper color
                clueVC.overrideTextColor = .black
                clueVC.overrideGoldenRatio = true
                
                topVC.present(clueVC, animated: true, completion: nil)
            }
        }
    }
}
