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
    /*******************///MARK: The Color Feedback Thingy
    /******************************************************/

    /// removes all orientation, resets the orientation flag, and gives the color indicator the given color as the objective, and animates its presentation
    func reloadObjective(using color: UIColor) {
        
        if !self.objectiveFeedbackView.orientationUp {
            self.objectiveFeedbackView.toggleOrientationAndAnimate()
        }
        UIView.animate(withDuration: 0.5,
                       delay: 0.6,
                       options: [.curveEaseInOut],
                       animations: {
                        
                        self.objectiveFeedbackView.alpha = 0.0
        }, completion: { (finished:Bool) in
            if self.getCurrentScore() >= self.minimumScoreToUnlockObjective {
                self.loadAndFadeInFeedbackObjective(using: color)
            }
            
        })
        
    }
    
    func loadAndFadeInFeedbackObjective(using color: UIColor) {
        //remove rotation and reset orientation flag
        self.objectiveFeedbackView.resetOrientation()
        
        
        self.objectiveFeedbackView.objectiveRingColor = color
        self.objectiveFeedbackView.setNeedsDisplay()
        
        UIView.animate(withDuration: 0.5,
                       delay: 2.3,
                       options: [.curveEaseInOut],
                       animations: {
                        
                        self.objectiveFeedbackView.alpha = 1.0
        }, completion: nil)
    }
    
    
    /// Allow the color feedback view to register when it is touched and call colorFeedbackTouched
    func registerTouchRecognizerColorFeedback() {
        // 3. add action to myView
        let gesture = UITapGestureRecognizer(target: self, action: #selector(DataViewController.colorFeedbackTouched(_:)))

        self.objectiveFeedbackView.addGestureRecognizer(gesture)
    }
    
    func colorFeedbackTouched(_ sender:UITapGestureRecognizer) {
        self.objectiveFeedbackView.toggleOrientationAndAnimate()
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
    
    
   
    
    
    ///Consider's the player's level and returns a color for the objective
    func getGameColor(usingLevel playerLevel: Level) -> UIColor {
        
        //The level describes if predetermined sets are eligible, if a random color is elibigle, or both
        let predeterminedColors = playerLevel.eligiblePredefinedObjectives!
        let randomColorPrecision = playerLevel.eligibleRandomColorPrecision
        
        //if for some reason both are nil or empty, just return a random color of default precision
        if randomColorPrecision == nil && predeterminedColors.isEmpty {
            return ColorLibrary.totallyRandomColor()
        }
        
        if randomColorPrecision == nil {  //if we won't be generating a random color
            //pick a random set and then a random color from that set
            var randomIndex = Int(arc4random_uniform(UInt32(predeterminedColors.count)))
            let randomSet = predeterminedColors[randomIndex]
            
            //now from that set pick a color
            randomIndex = Int(arc4random_uniform(UInt32(randomSet.count)))
            let randomColorFromSet = randomSet[randomIndex]
            
            return randomColorFromSet
            
        } else if predeterminedColors.isEmpty {  //if there are no predetermined colors then just return a random one
            return ColorLibrary.totallyRandomColor(precision: randomColorPrecision!)
        } else { //color precision is defined, and there are also colors in the predetermined sets
            //randomly pick to go with a predetermined set or with a random color
            
            //pick a random set and then a random color from that set
            var randomIndex = Int(arc4random_uniform(UInt32(2)))
            
            if randomIndex == 1 {  //1 means that a color from the set was chosen, so randomly pick one and return
                //pick a random set and then a random color from that set
                randomIndex = Int(arc4random_uniform(UInt32(predeterminedColors.count)))
                let randomSet = predeterminedColors[randomIndex]
                
                //now from that set pick a color
                randomIndex = Int(arc4random_uniform(UInt32(randomSet.count)))
                let randomColorFromSet = randomSet[randomIndex]
                
                return randomColorFromSet
                
            } else {  //randomly decided to pick a random color so pick one and return
                return ColorLibrary.totallyRandomColor(precision: randomColorPrecision!)
            }
        }
        
    }
    
    
    
    ///Loads the objective user visual
    func loadObjective(){
        //load the objective
        
        //pick a random color to load
        guard let userLevel = getUserCurrentLevel() else {
            //users level may be too high and this is where advanced levels can be loaded
            //TODO: Load advanced levels
            fatalError("User may be at adanvced level but this hasn't been programmed yet!!!!")
        }
        let gameColor = getGameColor(usingLevel: userLevel)
        loadAndFadeInFeedbackObjective(using: gameColor)
        
        setAllUserInteraction(enabled: true)
    }
    
    func loadRandomPhrase() {
        //1. get a random phrase from the character
        currentPhrase = dataObject.selectRandomPhrase()
        guard currentPhrase != nil  else {
            //TODO: handle nil returned for random phrase
            print("Nil phrase returned")
            return
        }
    }
    
    func reloadButtons() {
        loadRandomPhrase()
        
        //2. load the buttons
        removeAndReloadButtons(from: currentPhrase)
    }

    /// creates a new button with the color indicated by the given Slot
    func createButton(from slot: Slot) -> UIButton {
        let newButton = UIButton(type: .system)
        newButton.backgroundColor = slot.color
        newButton.setTitle("", for: .normal)
        newButton.addTarget(self, action: #selector(buttonPress), for: .touchUpInside)
        return newButton
    }
    
    func roundStackViewMask() {
        
        
        buttonStackViewMaskView.layer.masksToBounds = true
        let maskLayer = CAShapeLayer()
        
        maskLayer.path = UIBezierPath(roundedRect: buttonStackViewMaskView.bounds, byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize(width: 15, height: 15)).cgPath
        
        buttonStackViewMaskView.layer.mask = maskLayer
        
    }
    
    /// Round button corners.  Must be called in viewDidLayoutSubviews
    private func roundButtonCorners(topRadius: Int, bottomRadius: Int) {
        
        let button = currentButtons[0]
        //round the corners of the top buttons
        button.layer.masksToBounds = true
        let maskLayer = CAShapeLayer()
        
        maskLayer.path = UIBezierPath(roundedRect: buttonStackView.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: topRadius, height: topRadius)).cgPath
        button.layer.mask = maskLayer
        
        //round the corners of the bottom button
//        button = currentButtons[currentButtons.count - 1]
//        
//        maskLayer = CAShapeLayer()
//        
//        maskLayer.path = UIBezierPath(roundedRect: button.bounds, byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize(width: bottomRadius, height: bottomRadius)).cgPath
//        //maskLayer.frame = button.bounds
//        //maskLayer.position = button.center
//        
//        button.layer.mask = maskLayer
    }
    
    /// fades the stackview out, removes old buttons, then Adds buttons from the given phrase to the stackview
    func removeAndReloadButtons(from phrase: Phrase) {
        
        var delay = 1.5
        if getCurrentScore() <= minimumScoreToUnlockObjective && objectiveFeedbackView.alpha < 1.0 {
            delay = 0.1
        }
        
        UIView.animate(withDuration: 0.5,
                       delay: delay,
                       options: [.curveEaseInOut],
                       animations: {
            //hide the stackview
            self.buttonStackView.alpha = 0.0
            
            
            
        }, completion: { (finished:Bool) in
            
            //first, remove all current buttons from the stackview
            self.removeAllButtons()
            
            //now add a new set of buttons
            self.addNewButtons(from: phrase)
            
            self.fadeInCharacter()
           
        })

    }
    
    
    //loads the character without animation
    func initialButtonLoad(from phrase: Phrase){
        removeAllButtons()
        
        addNewButtons(from: phrase)
        
        buttonStackView.alpha = 1.0
        
        setAllUserInteraction(enabled: true)
    }
    
    //fades in the stackView.  Assumes buttons are already loaded
    func fadeInCharacter() {
        
        UIView.animate(withDuration: 0.8,
                       delay: 0.0,
                       options: [.curveEaseInOut],
                       animations: {
            self.buttonStackView.alpha = 1
        }, completion: { (finished:Bool) in
            self.setAllUserInteraction(enabled: true)
            
            //refresh the view
            //self.viewDidLayoutSubviews()
            
        })
        
        
    }
    
    //adds buttons to the stackView from the given phrase
    func addNewButtons(from phrase: Phrase) {
        
        guard let slots = phrase.slots else {
            //TODO: handle phrase with nil slots
            return
            
        }
        
        var counter = 0
        //step through each slot and createa  button for it
        for slot in slots {
            //create a button
            let slotButton = self.createButton(from: slot)
            //slotButton.isHidden = true
            slotButton.isEnabled = false
            //add the button to the array of buttons
            self.currentButtons.append(slotButton)
            
            //add the button to the stackview
            self.buttonStackView.addArrangedSubview(slotButton)
            
            //create layout constraints for the button
            let widthConstraint = NSLayoutConstraint(item: slotButton, attribute: .width, relatedBy: .equal, toItem: self.buttonStackView, attribute: .width, multiplier: 1, constant: 0)
            widthConstraint.isActive = true
            self.buttonStackView.addConstraint(widthConstraint)
            
            counter += 1
        }
    }
    
    ///removes all buttons from the stackview
    func removeAllButtons() {
        //disable and fade out
        setAllUserInteraction(enabled: false)
        
        //disable the buttons
        for button in currentButtons {
            button.isEnabled = false
        }
        
        //fade out the stack
        //        UIView.animate(withDuration: 1.4, animations: {
        //            self.buttonStackView.alpha = 0.0
        //        })
        
        for button in currentButtons {
            guard buttonStackView.arrangedSubviews.index(of: button) != nil else {
                //TODO: Handle index not found
                return
            }
            
            buttonStackView.removeArrangedSubview(button)
            
            //remove button from heirarchy
            button.removeFromSuperview()
        }
        
        
        //remove all buttons from the local list
        currentButtons.removeAll()
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
    /*******************///MARK: Checking for expired characters
    /******************************************************/

    ///checks the store for expired characters.  If found they are removed and the storeClosed() function is called. Returns true if expired characters were found, false otherwise
    func checkForAndRemoveExpiredCharacters() {
        
        //create a store object to use its functions for checking if characters have expired
        let storeVC = self.storyboard!.instantiateViewController(withIdentifier: "Store") as! StoreCollectionViewController
        let expiredCharacters: [UnlockedCharacter] = storeVC.getExpiredCharacters()
        
        if !expiredCharacters.isEmpty {
            //there are expired characters.  lock them and reload the modelController
            storeVC.lockAllExpiredCharacters()
            
            //invoke the function to mimic functionality as though the store had just closed
            self.storeClosed()
            
//            loadPageData()
//            
//            //update the pagecontroller dots.
//            //I realize this is not the right way to manipulate the page control
//            //TODO: Impliment proper ways to manipulate the page control
//            currentVC.numPages = self.pageData.count
//            currentVC.refreshPageControl()
            
        }
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
    /*******************///MARK: Audio Functions
    /******************************************************/

    
    func resetAudioEngineAndPlayer() {
        //audioPlayer.stop()
        audioEngine.stop()
        audioPlayerNode.stop()
        //audioEngine.reset()
    }
    
    func speak(subphrase: Subphrase){
        
        
        textUtterance = AVSpeechUtterance(string: subphrase.words)
        textUtterance.rate = 0.3
        //textUtterance.pitchMultiplier = toneToSpeak
        
        //speak
        synth.speak(textUtterance)
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
    
    
    /******************************************************/
    /*******************///MARK: Core Data functions
    /******************************************************/
    
    /**
     get the current score, if there is not a score record, make one at 0
     */
    func getCurrentScore() -> Int {
        guard let fc = frcDict[keyCurrentScore] else {
            return -1
        
        }
        
        guard let currentScores = fc.fetchedObjects as? [CurrentScore] else {
        
            return -1
        }
        
        if (currentScores.count) == 0 {
        
            print("No CurrentScore exists.  Creating.")
            let newScore = CurrentScore(entity: NSEntityDescription.entity(forEntityName: "CurrentScore", in: stack.context)!, insertInto: fc.managedObjectContext)
            
            return Int(newScore.value)
        } else {
            
            //print(currentScores[0].value)
            let score = Int(currentScores[0].value)
            
            //if didn't find at end of loop, must not be an entry, so level 0
            return score
        }
        
        
    }
    
    /// sets the current score, returns the newly set score
    func setCurrentScore(newScore: Int) {
        guard let fc = frcDict[keyCurrentScore] else {
            fatalError("Could not get frcDict")
            
        }
        
        guard let currentScores = fc.fetchedObjects as? [CurrentScore] else {
            fatalError("Could not get array of currentScores")
        }
        
        if (currentScores.count) == 0  {
            print("No CurrentScore exists.  Creating.")
            let currentScore = CurrentScore(entity: NSEntityDescription.entity(forEntityName: "CurrentScore", in: stack.context)!, insertInto: fc.managedObjectContext)
            currentScore.value = Int64(newScore)
            
            return
        } else {
            
            switch newScore {
            //TODO: if the score is already 0 don't set it again.
            case let x where x < 0:
                currentScores[0].value = Int64(0)
                return
            default:
                //set score for the first element
                currentScores[0].value = Int64(newScore)
                //print("There are \(currentScores.count) score entries in the database.")
                return
            }
            
            
        }

    }
    
    
}

