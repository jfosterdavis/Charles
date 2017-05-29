//
//  DataViewController.swift
//  Charles
//
//  Created by Jacob Foster Davis on 5/7/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import UIKit
import AVFoundation
import CoreData

class DataViewController: CoreDataViewController, StoreReactor {

    @IBOutlet weak var characterNameLabel: UILabel!

    //page control
    @IBOutlet weak var pageControl: UIPageControl!
    var currentPage = 0
    var numPages = 1
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    //level progress
    @IBOutlet weak var levelProgressView: UIProgressView!
    @IBOutlet weak var thisLevelLabel: UILabel!
    @IBOutlet weak var nextLevelLabel: UILabel!
    @IBOutlet weak var levelDescriptionLabel: UILabel!
    @IBOutlet weak var feedbackColorMoss: UILabel! //a hidden view only used to copy its text color
    var playerLevelBaseline = 0 //tracks the player level when they start an objective to compare if they made progress or not
    var playerProgressBaseline = 0 //tracks the player progress within the playerLevelBaseline level when they start an objective to compare if they made progress or not
    //and way to refer to which of the baselines in functions that do the same thing
    enum Baseline {
        case level
        case progress
    }
    
    
    //color objective and feedback
    @IBOutlet weak var objectiveFeedbackView: ColorMatchFeedbackView!
    var objectiveColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
    
    
    @IBOutlet weak var buttonStackViewMaskView: UIView!
    @IBOutlet weak var buttonStackView: UIStackView!
    
    var currentButtons = [UIButton]()
    
    //is current interaction with the character enabled
    var characterInteractionEnabled = true
    
    // MARK: AV Variables
    let synth = AVSpeechSynthesizer()
    var textUtterance = AVSpeechUtterance(string: "")
    var audioPlayer: AVAudioPlayer!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var changePitchEffect: AVAudioUnitTimePitch!
    
    //CoreData
    let keyCurrentScore = "CurrentScore"
    let keyXP = "keyXP"
    
    // MARK: Score
    var timer = Timer()
    @IBOutlet weak var justScoredLabel: UILabel!
    @IBOutlet weak var justScoredMessageLabel: UILabel!
    var pointsToLoseEachCycle = 20
    
    
    let minimumScoreToUnlockObjective = 1000
    let minimumScoreToUnlockStore = 500
    
    
    //Store
    @IBOutlet weak var storeButton: UIButton!
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var parentVC: CoreDataNSObject!
    var dataObject: Character!
    var currentPhrase: Phrase!
    var currentSubphraseIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //audio
        audioEngine = AVAudioEngine()
        audioPlayer = AVAudioPlayer()
        //setup node
        audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attach(audioPlayerNode)
        changePitchEffect = AVAudioUnitTimePitch()
        audioEngine.attach(changePitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        //setup CoreData
        _ = setupFetchedResultsController(frcKey: keyCurrentScore, entityName: "CurrentScore", sortDescriptors: [],  predicate: nil)
        _ = setupFetchedResultsController(frcKey: keyXP, entityName: "XP", sortDescriptors: [],  predicate: nil)
        
        //set opacity of elements
        storeButton.alpha = 0
        thisLevelLabel.alpha = 0.0
        nextLevelLabel.alpha = 0
        scoreLabel.alpha = 0
        
        
        
        //setup the color feedback view to recieve touches
        registerTouchRecognizerColorFeedback()
      
        //delegates
        
        //add placeholder buttons to the array of buttons
        currentButtons = [button1, button2, button3]
        
        //set the page control
        refreshPageControl()
        
        //mask the stackview
        roundStackViewMask()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.characterNameLabel!.text = dataObject.name
        
        //set opacity of elements
        //storeButton.alpha = 0
        
        
        //set up the game
        initialLoadGame()
        
        //setup the score
        refreshScore()
        
        //if there is only one character, hide the page control, otherwise show
        if numPages > 1 {
            setPageControl(visible: true)
        } else {
            setPageControl(visible: false)
        }
        
        //stop the timer to avoide stacking penalties
        timer.invalidate()
        //start the timer
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //reloadButtons()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        //round the button corners
        self.roundButtonCorners(topRadius: self.dataObject.topRadius, bottomRadius: self.dataObject.bottomRadius)
        
        roundStackViewMask()
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        //stop the timer to avoide stacking penalties
        timer.invalidate()
    }
    
    
    
    
    
    
    
    
    /******************************************************/
    /*******************///MARK: Page Control
    /******************************************************/

    func refreshPageControl(){
        //set the page control
        self.pageControl.numberOfPages = numPages
        self.pageControl.currentPage = currentPage
        self.pageControl.updateCurrentPageDisplay()
    }
    
    func setPageControl(visible: Bool) {
        self.pageControl.isHidden = !visible
    }
    
    /******************************************************/
    /*******************///MARK: Creating main display/interface
    /******************************************************/

    //loads the game for the first time since the user turned or looked at this page
    func initialLoadGame() {
        
        
        
        loadRandomPhrase()
        
        initialButtonLoad(from: currentPhrase)
        
        setUserLevelAndProgressBaselines()
        
        //initialize status of the progressbar.  initializing it will prevent animation
        if let progress = calculateProgressValue() {
            self.levelProgressView.setProgress(progress, animated: false)
        }
        refreshLevelProgress()
        
        checkForAndRemoveExpiredCharacters()
        
        objectiveFeedbackView.alpha = 0.0
        if getCurrentScore() >= minimumScoreToUnlockObjective {
            
            
            loadObjective()
            
            
        }
    }
    
    /// reloads all UI elements neccessary to play the game after a phrase has been completed.  Reloads the buttons and the color feedback
    func reloadGame() {
        //load the buttons
        reloadButtons()
        
        refreshLevelProgress()
        
        checkForAndRemoveExpiredCharacters()
        
        if getCurrentScore() >= minimumScoreToUnlockObjective || objectiveFeedbackView.alpha > 0.0 {
            
            //pick a random color to load
            guard let userLevel = getUserCurrentLevel() else {
                //users level may be too high and this is where advanced levels can be loaded
                //TODO: Load advanced levels
                fatalError("User may be at adanvced level but this hasn't been programmed yet!!!!")
            }
            
            let gameColor = getGameColor(usingLevel: userLevel)
            
            //set the baselines, then reload the objective
            setUserLevelAndProgressBaselines()
            
            reloadObjective(using: gameColor)
            
        }
    }
    
    
   
    
    
    
    
    
    
    
    
    func roundStackViewMask() {
        
        
        buttonStackViewMaskView.layer.masksToBounds = true
        let maskLayer = CAShapeLayer()
        
        maskLayer.path = UIBezierPath(roundedRect: buttonStackViewMaskView.bounds, byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize(width: 15, height: 15)).cgPath
        
        buttonStackViewMaskView.layer.mask = maskLayer
        
    }
    
    
    
    
    
    
    
    /******************************************************/
    /*******************///MARK: Store Closer
    /******************************************************/

    func storeClosed() {
                
        let pVC = self.parentVC as! ModelController
        pVC.storeClosed()
        
    }
    
    
    
    
    ///sets all buttons, except store button, to disabled or enabled
    func setAllUserInteraction(enabled: Bool) {

        characterInteractionEnabled = enabled
        
        for button in currentButtons {
            button.isEnabled = enabled
        }
        
        objectiveFeedbackView.isUserInteractionEnabled = enabled
        
    }
    
    
    ///flashes the amount of points the user just scored to the screen
    func presentJustScoredFeedback(justScored: Int) {
        
        //make invisible in case in the middle of a feedback
        justScoredLabel.alpha = 0
        var scoreModifier = "+"
        var presentableScoreValue = justScored
        
        //check if the score is negative to appropriate color
        if justScored < 0 {
            scoreModifier = "-"
            justScoredLabel.textColor = UIColor.red
            presentableScoreValue = presentableScoreValue * -1
        } else {
            justScoredLabel.textColor = feedbackColorMoss.textColor
        }
        
        justScoredLabel.text = "\(scoreModifier) \(String(describing: presentableScoreValue))"
        self.justScoredLabel.isHidden = false
        UIView.animate(withDuration: 0.2, animations: {
            
            self.justScoredLabel.alpha = 1.0
        }, completion: { (finished:Bool) in
            
            //now fade away again
            UIView.animate(withDuration: 2.7, animations: {
                self.justScoredLabel.alpha = 0.0
            }, completion: { (finished:Bool) in
                //self.justScoredLabel.isHidden = true
            })
        })
    }
    
    ///flashes the a message about the score the screen
    func presentJustScoredMessageFeedback(message: String, isGoodMessage: Bool = true) {
        
        //make invisible in case in the middle of a feedback
        justScoredMessageLabel.alpha = 0
        
        //color the message based on good or bad
        if isGoodMessage {
            justScoredMessageLabel.textColor = feedbackColorMoss.textColor
        } else { //color if the message is bad!
            justScoredMessageLabel.textColor = UIColor.red
        }
        
        justScoredMessageLabel.text = "\(message)"
        self.justScoredMessageLabel.isHidden = false
        UIView.animate(withDuration: 0.2,
                       delay: 0.2,
                        animations: {
            
            self.justScoredMessageLabel.alpha = 1.0
        }, completion: { (finished:Bool) in
            
            //now fade away again
            UIView.animate(withDuration: 2.0,
                           delay: 0.5,
                           animations: {
                self.justScoredMessageLabel.alpha = 0.0
            }, completion: { (finished:Bool) in
                //self.justScoredLabel.isHidden = true
            })
        })
    }
    
   
    
    
    /******************************************************/
    /*******************///MARK: Button Actions
    /******************************************************/

    @IBAction func storeButtonPressed(_ sender: Any) {
        //stop the timer
        timer.invalidate()
        
        
        // Create a new view controller and pass suitable data.
        let storeViewController = self.storyboard!.instantiateViewController(withIdentifier: "Store") as! StoreCollectionViewController
        
        //link this VC
        storeViewController.parentVC = self
        
        //pass the score
        storeViewController.score = getCurrentScore()
    
        present(storeViewController, animated: true, completion: nil)
    
    }
    
    
    

    
    /******************************************************/
    /*******************///MARK: Timer
    /******************************************************/

    func updateTimer() {
        //reduce the score
        let currentScore = getCurrentScore()
        
        if currentScore >= 0 {
            let penalty = pointsToLoseEachCycle
            var newScore = currentScore - penalty
            
            if newScore < 0 {
                newScore = 0
            }
            if !(newScore == 0 && currentScore == 0) {
                setCurrentScore(newScore: newScore)
                refreshScore()
            }
        }
    }
    
    
    
    
}

