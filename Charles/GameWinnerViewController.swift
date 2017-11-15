//
//  GameWinnerViewController.swift
//  Charles
//
//  Created by Jacob Foster Davis on 6/4/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation
import UIKit

/******************************************************/
/*******************///MARK: Shown to the user when the win the game
// Here give the user the chance to go back to level 10 with + 1M in cash
/******************************************************/

class GameWinnerViewController: MapCollectionViewController {

    //@IBOutlet weak var dismissButton: UIButton!
    
    @IBOutlet weak var performanceMosaicPerformanceView: PerformanceMosaicView!
    //var initialLevelToScrollTo = 11
    
    
    
    var timer = Timer()
    var userLevel: Int!
    
    var parentVC: DataViewController!
    
    var option1Level = 1
    var option2Level = 1
    var option3Level = 1
    
    @IBOutlet weak var option1Button: UIButton!
    @IBOutlet weak var option2Button: UIButton!
    @IBOutlet weak var option3Button: UIButton!
    
    //@IBOutlet weak var shareButton: UIButton!
    
    override func viewDidLoad() {
        //super.viewDidLoad()
        
        //setupCoreData FRCs
        _ = setupFetchedResultsController(frcKey: keyXP, entityName: "XP", sortDescriptors: [],  predicate: nil)
        
        dismissButton.roundCorners(with: 5)
        shareButton.roundCorners(with: 5)
        
        includeDollarSignWhenSharing = true
        graphicImageView.isHidden = false //always show the icon in this screen
        graphicImageView.alpha = 0
        dismissButton.alpha = 0
        option1Button.alpha = 0
        option2Button.alpha = 0
        option3Button.alpha = 0
        shareButton.alpha = 0
        disableAllButtons()
        
        
        //based on user level, give player options for option 2 and 3.  Option 1 sould stay at 0
        option2Level = Int(userLevel / 2) //option 2 goes back halfway
        //option2Button.setTitle(String(describing: option2Level), for: UIControlState.normal)
        
        option3Level = Utilities.random(range: 1...(userLevel - 1)) //option 3 is a random level
        //option3Button.setTitle(String(describing: option3Level), for: UIControlState.normal)
        
        //load the mosaic
        initialLevelToScrollTo = userLevel
        playerHasFinishedInitialLevelToScrollTo = true
        performanceMosaicPerformanceView.tileData = getMosaicData()
        performanceMosaicPerformanceView.setNeedsDisplay()
    }
    
    override func viewDidLayoutSubviews() {
        dismissButton.roundCorners()
        shareButton.roundCorners()
        option1Button.roundCorners()
        option2Button.roundCorners()
        option3Button.roundCorners()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        graphicImageView.fade(.inOrOut,
                              resultAlpha: 0.70,
                              withDuration: 10,
                              delay: 1,
                              completion: {(finished:Bool) in
                                //let the graphic receive taps for fun
                                let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped(tapGestureRecognizer:)))
                                self.graphicImageView.isUserInteractionEnabled = true
                                self.graphicImageView.addGestureRecognizer(tapGestureRecognizer)
        })
        
        //start the timer
        timer = Timer.scheduledTimer(timeInterval: 12, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
       
        //slowly fade each button in and enable
        option1Button.fade(.in,
                           withDuration: 5,
                           delay: 20,
                           completion: {(finished:Bool) in self.option1Button.isEnabled = true})
        
        option2Button.fade(.in,
                           withDuration: 5,
                           delay: 23,
                           completion: {(finished:Bool) in self.option2Button.isEnabled = true})
        
        option3Button.fade(.in,
                           withDuration: 5,
                           delay: 26,
                           completion: {(finished:Bool) in self.option3Button.isEnabled = true})
        
        dismissButton.fade(.in,
                           withDuration: 8,
                           delay: 35,
                           completion: {(finished:Bool) in self.dismissButton.isEnabled = true})
        
        shareButton.fade(.in,
                           withDuration: 8,
                           delay: 38,
                           completion: {(finished:Bool) in self.shareButton.isEnabled = true})
        
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        //stop the timer to avoide stacking penalties
        timer.invalidate()
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        timer.invalidate()
        //start the timer
        timer = Timer.scheduledTimer(timeInterval: 12, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        pulse(view: tappedImage)
        
    }
    
    func disableAllButtons() {
        dismissButton.isEnabled = false
        shareButton.isEnabled = false
        option1Button.isEnabled = false
        option2Button.isEnabled = false
        option3Button.isEnabled = false
    }
    
    
    @IBAction func choiceButtonPressed(_ sender: UIButton) {
        disableAllButtons() //the choice is made!
        
        
        //determine level to go to
        var destinationLevel = 1
        var bonusCash = 0
        switch sender {
        case let x where x == option1Button:
            destinationLevel = option1Level
        case let x where x == option2Button:
            destinationLevel = option2Level
        case let x where x == option3Button:
            destinationLevel = option3Level
            //give bonus cash for being adventurous
            bonusCash = 500000
        default:
            destinationLevel = option1Level
        }
        
        //determine cash to give player
        //player would get 30M for going to level 1
        let cashPrize = (30000000 / destinationLevel) + bonusCash
        
        //give player this new cash
        let currentScore = parentVC.getCurrentScore()
        let resultScore = currentScore + cashPrize
        parentVC.setCurrentScore(newScore: resultScore)
        
        
        //set the user to the new level
        parentVC.reducePlayerLevel(to: destinationLevel)
        
        fadeAwayAndDismiss()
    }
    
    @IBAction override func dismissButtonPressed(_ sender: Any) {
        disableAllButtons() //the choice is made.
        fadeAwayAndDismiss()
    }
    
//    @IBAction func shareButtonPressed(_ sender: Any) {
//        let imageToShare = getSharabaleMosaicImage()
//        
//        let objectsToShare = [imageToShare] as [Any]
//        
//        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
//        
//        //Excluded Activities
//        activityVC.excludedActivityTypes = [.addToReadingList, .openInIBooks, .postToVimeo, .postToWeibo, .postToTencentWeibo]
//        
//        
//        //activityVC.popoverPresentationController?.sourceView = self as? UIView
//        self.present(activityVC, animated: true, completion: nil)
//        
//    }
    
    func fadeAwayAndDismiss() {
        //slowly fade each button in and enable
        option1Button.fade(.out,
                           withDuration: 2,
                           delay: 1.5,
                           completion: {(finished:Bool) in self.dismiss(animated: true, completion: nil)})
        
        option2Button.fade(.out,
                           withDuration: 2,
                           delay: 1,
                           completion: nil)
        
        option3Button.fade(.out,
                           withDuration: 2,
                           delay: 0.5,
                           completion: nil)
        
        shareButton.fade(.out,
                           withDuration: 2,
                           delay: 0,
                           completion: nil)
        
        dismissButton.fade(.out,
                           withDuration: 2,
                           delay: 0,
                           completion: nil)
    }
    
    @objc func updateTimer() {
        pulse(view: graphicImageView)
    }
    
    func pulse(view: UIView) {
        view.fade(.inOrOut,
                  resultAlpha: 1,
                              
                              withDuration: 1)
        
        view.fade(.inOrOut,
                              resultAlpha: 0.70,
                              withDuration: 2,
                              delay: 0.1)
        
    }
    
}
