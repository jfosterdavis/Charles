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
    let progressViewProgressTintColorDefault = UIColor(red: 0.0/255.0, green: 64.0/255.0, blue: 128.0/255.0, alpha: 1)
    let progressViewProgressTintColorXPPerkActive = UIColor(red: 114/255.0, green: 42/255.0, blue: 183/255.0, alpha: 1)
    @IBOutlet weak var feedbackColorMoss: UILabel! //a hidden view only used to copy its text color
    @IBOutlet weak var progressViewLightTextColor: UILabel! //another hidden view
    
    var playerLevelBaseline = 0 //tracks the player level when they start an objective to compare if they made progress or not
    var playerProgressBaseline = 0 //tracks the player progress within the playerLevelBaseline level when they start an objective to compare if they made progress or not
    //and way to refer to which of the baselines in functions that do the same thing
    enum Baseline {
        case level
        case progress
    }
    
    //perk increasedScore
    @IBOutlet weak var perkIncreasedScoreUserFeedback: UILabel!
    @IBOutlet weak var perkIncreasedScoreUserFeedbackImageView: UIImageView!
    
    //perk precisionadjustment
    @IBOutlet weak var perkPrecisionAdjustmentUserFeedback: UIView!
    @IBOutlet weak var perkPrecisionAdjustmentUserFeedbackImageView: UIImageView!
    
    //Investment perk feedback
    //@IBOutlet weak var perkInvestmentScoreUserFeedback: UIImageView!
    
    //increasedXP
    @IBOutlet weak var perkIncreasedXPUserFeedbackImageView: UIImageView!
    
    //adaptation perk adaptclothing
    @IBOutlet weak var perkAdaptationFeedbackImageView: UIImageView!
    
    
    //entire view background
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var topBackgroundView: UIView!
    
    
    
    
    
    
    //color objective and feedback
    @IBOutlet weak var objectiveFeedbackView: ColorMatchFeedbackView!
    var objectiveColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
    //Synesthesia background blinker
    @IBOutlet weak var synesthesiaBackgroundBlinker: UIView!
    @IBOutlet weak var synesthesiaBackgroundBlinkerImageView: UIImageView!
    
    
    
    @IBOutlet weak var buttonStackViewMaskView: UIView!
    @IBOutlet weak var buttonStackView: UIStackView!
    
    var currentButtons = [UIButton]()
    
    //is current interaction with the character enabled
    var characterInteractionEnabled = true
    
    // MARK: AV Variables
    //continue audio from outside apps
    let audioSession = AVAudioSession.sharedInstance()
    //game audio
    let synth = AVSpeechSynthesizer()
    var textUtterance = AVSpeechUtterance(string: "")
    var audioPlayer: AVAudioPlayer!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var changePitchEffect: AVAudioUnitTimePitch!
    //AV for Game Sounds (not character sounds_
    var audioPlayerGameSounds: AVAudioPlayer!
    var audioEngineGameSounds: AVAudioEngine!
    var audioPlayerNodeGameSounds: AVAudioPlayerNode!
    var changePitchEffectGameSounds: AVAudioUnitTimePitch!
    //Synesthesia
    var audioPlayerNodeSynesthesia: AVAudioPlayerNode!
    var synesthesiaReverb: AVAudioUnitReverb!
    var synesthesiaDistortion: AVAudioUnitDistortion!
    
    //CoreData
    let keyCurrentScore = "CurrentScore"
    let keyXP = "keyXP"
    
    // MARK: Score
    var timer = Timer()
    @IBOutlet weak var justScoredLabel: UILabel!
    @IBOutlet weak var justScoredMessageLabel: UILabel!
    var pointsToLoseEachCycle = 20
    
    //constants
    let minimumScoreToUnlockObjective = 600
    let minimumScoreToUnlockStore = 300
    let minimumLevelToUnlockPerkStore = 5
    
    //color stick view for Insight
    @IBOutlet weak var perkStickViewDeviation: InsightColorStickView!
    
    
    
    //Store
    @IBOutlet weak var storeButton: UIButton!
    @IBOutlet weak var perkStoreButton: UIButton!
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var parentVC: ModelController!
    var dataObject: Character!
    var currentPhrase: Phrase!
    var currentSubphraseIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //allow outside audio (like from Music App)
        do {
            try audioSession.setCategory(AVAudioSessionCategoryPlayback, with: [.duckOthers, .allowAirPlay])
            try audioSession.setActive(true)
        }catch{
            // handle error
        }
        
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
        
        //Synesthesia effects
        audioPlayerNodeSynesthesia = AVAudioPlayerNode()
        synesthesiaReverb = AVAudioUnitReverb()
        synesthesiaReverb.loadFactoryPreset(AVAudioUnitReverbPreset.plate)
        synesthesiaReverb.wetDryMix = 5
        audioEngine.attach(synesthesiaReverb)

        synesthesiaDistortion = AVAudioUnitDistortion()
        synesthesiaDistortion.loadFactoryPreset(AVAudioUnitDistortionPreset.speechWaves)
        synesthesiaDistortion.wetDryMix = 0
        audioEngine.attach(synesthesiaDistortion)
        
        
        
        //setup the same for the game sounds
        audioEngineGameSounds = AVAudioEngine()
        audioPlayerGameSounds = AVAudioPlayer()
        //setup node
        audioPlayerNodeGameSounds = AVAudioPlayerNode()
        audioEngineGameSounds.attach(audioPlayerNodeGameSounds)
        changePitchEffectGameSounds = AVAudioUnitTimePitch()
        audioEngineGameSounds.attach(changePitchEffectGameSounds)
        
        audioEngineGameSounds.connect(audioPlayerNodeGameSounds, to: changePitchEffectGameSounds, format: nil)
        audioEngineGameSounds.connect(changePitchEffectGameSounds, to: audioEngineGameSounds.outputNode, format: nil)
        
        //setup CoreData
        _ = setupFetchedResultsController(frcKey: keyCurrentScore, entityName: "CurrentScore", sortDescriptors: [],  predicate: nil)
        _ = setupFetchedResultsController(frcKey: keyXP, entityName: "XP", sortDescriptors: [],  predicate: nil)
        
        //set opacity of elements
        storeButton.alpha = 0
        storeButton.isEnabled = false
        thisLevelLabel.alpha = 0.0
        nextLevelLabel.alpha = 0
        scoreLabel.alpha = 0
        perkStoreButton.alpha = 0
        perkStoreButton.isEnabled = false
        perkIncreasedScoreUserFeedback.alpha = 0
        perkPrecisionAdjustmentUserFeedback.alpha = 0
        perkStickViewDeviation.alpha = 0
        perkIncreasedScoreUserFeedbackImageView.alpha = 0
        perkPrecisionAdjustmentUserFeedbackImageView.alpha = 0
        synesthesiaBackgroundBlinkerImageView.alpha = 0
        perkIncreasedXPUserFeedbackImageView.alpha = 0
        perkAdaptationFeedbackImageView.alpha = 0
        
        
        //setup the color feedback view to recieve touches
        registerTouchRecognizerColorFeedback()
      
        //delegates
        
        //add placeholder buttons to the array of buttons
        currentButtons = [button1, button2, button3]
        
        //load the background based on the level
        setBackground(from: getUserCurrentLevel(), animate: false)
        
        //set the page control
        refreshPageControl()
        
        //mask the stackview
        roundStackViewMask()
        
        //add a listener so can tell when app enters background
        NotificationCenter.default.addObserver(self, selector: #selector(appEnteredBackground), name:NSNotification.Name.UIApplicationDidEnterBackground, object: nil)

        
        //housekeeping
        checkXPAndConsolidateIfNeccessary(consolidateAt: 300)  //with 144 levels, should be plenty to prevent too much of this.
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
        perkStickViewDeviation.alpha = 0
        
        
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
        
//        perkPrecisionAdjustmentUserFeedback.roundCorners(with: 10)
//        storeButton.roundCorners(with: 5)
//        perkStoreButton.roundCorners(with: 5)
//        characterNameLabel.roundCorners(with: 5)
//        scoreLabel.roundCorners(with: 5)
        
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
    /*******************///MARK: Storyboard and Interface
    /******************************************************/

    
    
    func roundStackViewMask() {
        
        
        buttonStackViewMaskView.layer.masksToBounds = true
        let maskLayer = CAShapeLayer()
        
        maskLayer.path = UIBezierPath(roundedRect: buttonStackViewMaskView.bounds, byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize(width: 15, height: 15)).cgPath
        
        buttonStackViewMaskView.layer.mask = maskLayer
        
    }
    
    
    /******************************************************/
    /*******************///MARK: Misc
    /******************************************************/

    func storeClosed() {
                
        let pVC = self.parentVC!
        pVC.storeClosed()
        
        //fade in and out the store buttons
        //self.storeButton.isHidden = false
        //self.storeButton.alpha = 1
        
        //allow user to access the stores for a few seconds
        fadeViewInThenOut(view: self.storeButton, fadeOutAfterSeconds: 6.3)
        
        //only control the perk store if the player level is above minimum + 2
        if self.getUserCurrentLevel().level > (self.minimumLevelToUnlockPerkStore + 2) {
            fadeViewInThenOut(view: self.perkStoreButton, fadeOutAfterSeconds: 6.3)
        }
        
    }
    
    
    
    
    ///to be called by the entered background observer.  presses the store button.
    func appEnteredBackground(notification : NSNotification) {
        storeButtonPressed(self)
    }
    
    /******************************************************/
    /*******************///MARK: UI Button Actions
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
        
        //if this was called without the button, slide it in from bottom
        if sender as? DataViewController == self {
            storeViewController.modalTransitionStyle = .coverVertical
        }
    
        present(storeViewController, animated: true, completion: nil)
    
    }
    
    @IBAction func perkStoreButtonPressed(_ sender: Any) {
        
        //stop the timer
        timer.invalidate()
        
        
        // Create a new view controller and pass suitable data.
        let perkStoreViewController = self.storyboard!.instantiateViewController(withIdentifier: "PerkStore") as! PerkStoreCollectionViewController
        
        //link this VC
        perkStoreViewController.parentVC = self
        
        //pass the score
        perkStoreViewController.score = getCurrentScore()
        
        //if this was called without the button, slide it in from bottom
        if sender as? DataViewController == self {
            perkStoreViewController.modalTransitionStyle = .coverVertical
        }
        
        present(perkStoreViewController, animated: true, completion: nil)
    }
    
}
