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

    @IBOutlet weak var dataLabel: UILabel!

    //page control
    @IBOutlet weak var pageControl: UIPageControl!
    var currentPage = 0
    var numPages = 1
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    //level progress
    @IBOutlet weak var levelProgressView: UIProgressView!
    
    
    
    //color objective and feedback
    @IBOutlet weak var objectiveFeedbackView: ColorMatchFeedbackView!
    var objectiveColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
    
    
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
    
    
    let minimumScoreToUnlockObjective = 1250
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
        
        //setup the score
        refreshScore()
        
        //setup the color feedback view to recieve touches
        registerTouchRecognizerColorFeedback()
      
        //delegates
        
        //add placeholder buttons to the array of buttons
        currentButtons = [button1, button2, button3]
        
        //set the page control
        refreshPageControl()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.dataLabel!.text = dataObject.name
        
        //set opacity of elements
        storeButton.alpha = 0
        
        
        //set up the game
        initialLoadGame()
        
        //if there is only one character, hide the page control, otherwise show
        if numPages > 1 {
            setPageControl(visible: true)
        } else {
            setPageControl(visible: false)
        }
        
        refreshLevelProgress()
        
        //stop the timer to avoide stacking penalties
        timer.invalidate()
        //start the timer
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //reloadButtons()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        //revealButtons()
        self.roundButtonCorners(topRadius: self.dataObject.topRadius, bottomRadius: self.dataObject.bottomRadius)
        
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
        let gesture = UITapGestureRecognizer(target: self, action: "colorFeedbackTouched:")

        self.objectiveFeedbackView.addGestureRecognizer(gesture)
    }
    
    func colorFeedbackTouched(_ sender:UITapGestureRecognizer) {
        self.objectiveFeedbackView.toggleOrientationAndAnimate()
    }
    
    /******************************************************/
    /*******************///MARK: Level Progress
    /******************************************************/

    func refreshLevelProgress() {
        
        //if the player isn't working on objectives, hide this progress bar
        if getCurrentScore() < minimumScoreToUnlockObjective {
            levelProgressView.isHidden = true
        } else {
            //figure out what level the player is on
            levelProgressView.isHidden = false

            if let progress = calculateProgressValue() {
                levelProgressView.setProgress(progress, animated: true)
            } else {
                levelProgressView.setProgress(0.0, animated: true)
            }
            
        }
        
        
    }
    
    //calculates the progress value for the progress meter based on the user's level and XP.  returns Float
    func calculateProgressValue() -> Float? {
        //get user's level
        let currentLevel = getUserCurrentLevel()
        
        guard currentLevel != nil else {
            //this may mean the user is too high of a level
            return nil
        }
        //get user's XP for this level
        guard let fc = frcDict[keyXP] else {
            return nil
            
        }
        
        guard let xps = fc.fetchedObjects as? [XP] else {
            return nil
        }
        var xpThisLevel = 0
        
        for xp in xps {
            if Int(xp.level) == currentLevel!.level {
                xpThisLevel = xpThisLevel + Int(xp.value)
            }
        }
        
        let progress: Float = Float(xpThisLevel) / Float(currentLevel!.xPRequired)
        
        return progress
        
    }
    
    /******************************************************/
    /*******************///MARK: Page Control
    /******************************************************/

    func refreshPageControl(){
        //set the page control
        self.pageControl.numberOfPages = numPages
        self.pageControl.currentPage = currentPage
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
        
        objectiveFeedbackView.alpha = 0.0
        if getCurrentScore() >= minimumScoreToUnlockObjective {
            loadObjective()
            
            refreshLevelProgress()
        }
    }
    
    /// reloads all UI elements neccessary to play the game after a phrase has been completed.  Reloads the buttons and the color feedback
    func reloadGame() {
        //load the buttons
        reloadButtons()
        
        //pick a random color to load
        let randomIndex = Int(arc4random_uniform(UInt32(ColorLibrary.Easy.count)))
        let randomColor = ColorLibrary.Easy[randomIndex]
        if getCurrentScore() >= minimumScoreToUnlockObjective || objectiveFeedbackView.alpha > 0.0 {
            reloadObjective(using: randomColor)
            
            refreshLevelProgress()
        }
    }
    
    ///Loads the objective user visual
    func loadObjective(){
        //load the objective
        let randomIndex = Int(arc4random_uniform(UInt32(ColorLibrary.Easy.count)))
        let randomColor = ColorLibrary.Easy[randomIndex]
        loadAndFadeInFeedbackObjective(using: randomColor)
        
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
    
//    ///removes all buttons, the loads up new buttons from the given Phrase.
//    func removeAndReloadButtons(from phrase: Phrase) {
//        
//        
//        //there should be no buttons, so now create some buttons
//        loadPhraseButtons(from: phrase)
//    }
    
    /// Round button corners.  Must be called in viewDidLayoutSubviews
    private func roundButtonCorners(topRadius: Int, bottomRadius: Int) {
        //round the corners of the top buttons
        var button = currentButtons[0]
        
        button.layer.masksToBounds = true
        var maskLayer = CAShapeLayer()
        
        //top left
        
        maskLayer.path = UIBezierPath(roundedRect: buttonStackView.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: topRadius, height: topRadius)).cgPath
        button.layer.mask = maskLayer
        
        //round the corners of the bottom button
        button = currentButtons[currentButtons.count - 1]
        
        //button.layer.masksToBounds = true
        //slotButton.roundCorners(corners: [.topLeft,.topRight], radius: 3)
        maskLayer = CAShapeLayer()
        
        maskLayer.path = UIBezierPath(roundedRect: button.bounds, byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize(width: bottomRadius, height: bottomRadius)).cgPath
        maskLayer.bounds = button.frame
        maskLayer.position = button.center
        
        button.layer.mask = maskLayer
    }
    
//    func revealButtons() {
//        
//        let intervals = currentPhrase.slots?.count
//        let frequency = 1.0/Float(intervals!)
//        let miliseconds = Int(frequency * 100)
//        
//        revealButtonsInSequence(buttons: currentButtons, delay: 200)
//    }
    
//    func revealButtonsInSequence(buttons: [UIButton], delay: Int) {
//        
//        guard !buttons.isEmpty else {
//            
//            for currentButton in currentButtons {
//                currentButton.isEnabled = true
//            }
//            return
//        }
//        
//        var mutableButtons = buttons
//        
//        let button = mutableButtons.popLast()
//        
//        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(delay), execute: {
//            button!.isHidden = false
//            
//            self.revealButtonsInSequence(buttons: mutableButtons, delay: delay)
//            self.roundButtonCorners(topRadius: self.dataObject.topRadius, bottomRadius: self.dataObject.bottomRadius)
//        })
//    }
    

    
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
            self.buttonStackView.alpha = 1.0
        }, completion: { (finished:Bool) in
            self.setAllUserInteraction(enabled: true)
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
    
    /******************************************************/
    /*******************///MARK: Buttons
    /******************************************************/

    
    @IBAction func buttonPress(_ sender: UIButton) {
        //2. Play the current subphrase with the tone of the pressed button.
        
        //if the audio is already playing, don't do anything:
//        guard audioPlayer.isPlaying == false else {
//            return
//        }
        
        //don't do anything if character is not enabled
        guard characterInteractionEnabled else {
            return
        }
        
        var sendingButton: UIButton?
        
        //prepare the subphrase.  if it is gone too far, reset
        if currentSubphraseIndex >= currentPhrase.subphrases!.count {
            currentSubphraseIndex = 0
            
        }
        
        //find the button that was pressed
        for button in currentButtons {
            if sender == button {
                sendingButton = button
            }
        }
        
        guard sendingButton != nil else {
            //TODO: handle nil
            return
        }
        
        //prepare to speak
        
        let subphraseToSound = currentPhrase.subphrases![currentSubphraseIndex]
        
        //determine if there is a valid .m4a file to play, otherwise speak the word
        if subphraseToSound.audioFilePath != nil {
            //try to find file
            let url = URL(fileURLWithPath: subphraseToSound.audioFilePath!)
            
            
            do {
                try audioPlayer = AVAudioPlayer(contentsOf: url)
                audioPlayer.enableRate = true
                
                resetAudioEngineAndPlayer()
                
//                try audioPlayer = AVAudioPlayer(contentsOf: url)
                let audioFile = try AVAudioFile(forReading: url)
            
                changePitchEffect.pitch = currentPhrase.slots![currentButtons.index(of: sendingButton!)!].tone
                
                audioPlayerNode.scheduleFile(audioFile, at: nil, completionHandler: nil)
                
                try audioEngine.start()
                audioPlayerNode.play()
                
                //audioPlayer.play()
            } catch {
                //there was an error, so speak it instead
                speak(subphrase: currentPhrase.subphrases![currentSubphraseIndex])
            }
            
        } else {
            speak(subphrase: currentPhrase.subphrases![currentSubphraseIndex])
        }
        
        var addThisColor: UIColor
        if let c = sendingButton!.backgroundColor {
            if c == UIColor.clear {
                addThisColor = UIColor.black
            } else {
                addThisColor = c
            }
        } else {
            
            addThisColor = UIColor.black
        }
        
        //check the orientation of the objectiveFeedbackView.  If it is normal, add, if not, subtract the color
        if objectiveFeedbackView.orientationUp {
            //add the color of the button pressed to the color indicator
            objectiveFeedbackView.addColorToProgress(color: addThisColor)
        } else {
            //subtract the color of the button pressed to the color indicator
            objectiveFeedbackView.subtractColorToProgress(color: addThisColor)
        }
        
        
        
        
        
        //iterate the subphrase
        
        currentSubphraseIndex += 1
        
        //reload another phrase if this was the last word
        if currentSubphraseIndex >= currentPhrase.subphrases!.count {
            currentSubphraseIndex = 0
            
            //if the user doesn't ahve enough points to go after objectives, make the transition quicker
            var delay = 1000
            if getCurrentScore() <= minimumScoreToUnlockObjective && objectiveFeedbackView.alpha < 1.0 {
                delay = 300
            }
            
            //give them some points for finishing a phrase
            var pointsJustScored = 0
            let scoreResults = calculateColorMatchPointsEarned()
            if objectiveFeedbackView.alpha > 0.0 {
                pointsJustScored = calculateBaseScore(phrase: currentPhrase) + scoreResults.0
            } else {
                pointsJustScored = calculateBaseScore(phrase: currentPhrase)
            }
            setCurrentScore(newScore: getCurrentScore() + pointsJustScored)
            
            //update the score
            refreshScore()
            
            //animate the justScored feedback
            presentJustScoredFeedback(justScored: pointsJustScored)
            
            if let scoreMessage = scoreResults.1, objectiveFeedbackView.alpha > 0.0 {
                presentJustScoredMessageFeedback(message: scoreMessage)
            }
            
            //don't let the user do anything while we show them feedback and reload
            setAllUserInteraction(enabled: false)
            
            
            //if the user is working on an objective, give xp points if they met minimum score threshold for that level
            if objectiveFeedbackView.alpha > 0 {
                let level = getUserCurrentLevel()
                //compare to match performance
                if let level = level, scoreResults.2 >= level.successThreshold {
                    giveXP(level: level.level, score: pointsJustScored, time: 0, toggles: 0)
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(delay), execute: {
                self.reloadGame()
            })
            
            
        }
        
    }
    
    ///calculates the points earned from a given color, a color which represents the deviation between the goal and the progress
    func calculateColorMatchPointsEarned() -> (Int, String?, Float) {
        
        //really this is just the main color, but just in case that changes this way is more solid
        let deviationColor = objectiveFeedbackView.calculateColorDeviation(color1: objectiveFeedbackView.objectiveRingColor, color2: objectiveFeedbackView.progressRingColor)
        let magnitude: CGFloat = 10.0
        var deviationRGBA = [CGFloat](repeating: 0.0, count: 4)
        
        deviationColor.getRed(&deviationRGBA[0], green: &deviationRGBA[1], blue: &deviationRGBA[2], alpha: &deviationRGBA[3])
        let redRaw = Int(magnitude - deviationRGBA[0] * magnitude)
        let greenRaw = Int(magnitude - deviationRGBA[1] * magnitude)
        let blueRaw = Int(magnitude - deviationRGBA[2] * magnitude)
        
        let unadjustedScore =  redRaw + greenRaw + blueRaw
        let multiplier: CGFloat = 4.0
        let scoreToAward = CGFloat(unadjustedScore) * multiplier
        print("Awarding \(scoreToAward) points for matching")
        
        
        let maxScore = magnitude * 3.0 * multiplier
        var pointMessage: String? = nil
        let scorePercent = Int(scoreToAward/maxScore*100.0)
        
        switch scorePercent {
        case 100:
            pointMessage = "Perfect Match!"
        case let x where x > 90:
            pointMessage = "\(scorePercent)% Superb!"
        case let x where x > 80:
            pointMessage = "\(scorePercent)% Great!"
        default:
            pointMessage = "\(scorePercent)% Match"
        }
        return (Int(scoreToAward), pointMessage, Float(Float(scorePercent)/100.0))
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
        
        justScoredLabel.text = "+\(String(describing: justScored))"
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
    func presentJustScoredMessageFeedback(message: String) {
        
        //make invisible in case in the middle of a feedback
        justScoredMessageLabel.alpha = 0
        
        justScoredMessageLabel.text = "\(message)"
        self.justScoredMessageLabel.isHidden = false
        UIView.animate(withDuration: 0.2,
                       delay: 0.3,
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

    ///checks the store for expired characters and return true if there are expired characters
    func isExpiredCharacters() -> Bool {
        
        //create a store object to use its functions for checking if characters have expired
        let storeVC = self.storyboard!.instantiateViewController(withIdentifier: "Store") as! StoreCollectionViewController
        let expiredCharacters: [UnlockedCharacter] = storeVC.getExpiredCharacters()
        
        if expiredCharacters.count > 0 {
            return true
        } else {
            return false
        }
    }
    
    
    ///if there are expired characters, this will launch the store so the store can use already written functions to remove them
    func checkForAndRemoveExpiredCharactersByLaunchingStore() {
        if isExpiredCharacters() {
            storeButtonPressed(self)
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
    /*******************///MARK: Scoring
    /******************************************************/

    func refreshScore() {
        let currentScore = getCurrentScore()
        
        scoreLabel.text = String(describing: currentScore)
        
        //set the alpha of the label to be the equivalent of the score /1000
        //alpha of the store icon will be such that 500 is the minimum score to start showing.  Lowest priced item will be 500.
        if currentScore >= minimumScoreToUnlockStore + 500 {
            scoreLabel.alpha = 1.0
            storeButton.alpha = 1.0
        } else {
            
            let newAlpha: CGFloat = CGFloat(Float(currentScore) / Float(minimumScoreToUnlockStore + 500))
            
            self.scoreLabel.alpha = newAlpha
            
            //fade in the store
            UIView.animate(withDuration: 0.3, animations: {
                
                self.storeButton.alpha = 2*newAlpha - 1 //this makes store button visible at 500 and solid at 1000. y=mx+b
                if self.storeButton.alpha == 0 {
                    self.storeButton.isEnabled = false
                } else {
                    self.storeButton.isEnabled = true
                }
            }, completion: nil)
            
        }
    }
    
    /// calculates the base score, which is 100 - the liklihood of the phrase just completed
    func calculateBaseScore(phrase: Phrase) -> Int {
        return 100 - phrase.likelihood
    }
    
    /******************************************************/
    /*******************///MARK: Timer
    /******************************************************/

    func updateTimer() {
        //reduce the score
        let currentScore = getCurrentScore()
        
        if currentScore >= 0 {
            let penalty = 1
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
    func setCurrentScore(newScore: Int) -> Int {
        guard let fc = frcDict[keyCurrentScore] else {
            return -1
            
        }
        
        guard let currentScores = fc.fetchedObjects as? [CurrentScore] else {
            return -1
        }
        
        if (currentScores.count) == 0  {
            print("No CurrentScore exists.  Creating.")
            let currentScore = CurrentScore(entity: NSEntityDescription.entity(forEntityName: "CurrentScore", in: stack.context)!, insertInto: fc.managedObjectContext)
            currentScore.value = Int64(newScore)
            
            return Int(currentScore.value)
        } else {
            
            switch newScore {
            //TODO: if the score is already 0 don't set it again.
            case let x where x < 0:
                currentScores[0].value = Int64(0)
                return Int(currentScores[0].value)
            default:
                //set score for the first element
                currentScores[0].value = Int64(newScore)
                //print("There are \(currentScores.count) score entries in the database.")
                return Int(currentScores[0].value)
            }
            
            
        }

    }
    
    /// sets the current score, returns the newly set score
    func giveXP(value: Int = 1, earnedDatetime: Date = Date(), level: Int, score: Int, time: Int, toggles: Int, metaInt1: Int? = nil, metaInt2: Int? = nil, metaString1: String? = nil, metaString2: String? = nil) {
        guard let fc = frcDict[keyXP] else {
            return
            
        }
        
        guard let xps = fc.fetchedObjects as? [XP] else {
            return
        }
        
        //create a new score object
        let newXP = XP(entity: NSEntityDescription.entity(forEntityName: "XP", in: stack.context)!, insertInto: fc.managedObjectContext)
        newXP.value = Int64(value)
        newXP.earnedDatetime = earnedDatetime as NSDate
        newXP.level = Int64(level)
        newXP.score = Int64(score)
        newXP.time = Int64(time)
        newXP.toggles = Int64(toggles)
        if let int1 = metaInt1 {
            newXP.metaInt1 = Int64(int1)
        }
        if let int2 = metaInt1 {
            newXP.metaInt2 = Int64(int2)
        }
        
        newXP.metaString1 = metaString1
        newXP.metaString2 = metaString2
        
    }
    
    ///returns the total amount of user XP
    func calculateUserXP() -> Int {
        guard let fc = frcDict[keyXP] else {
            fatalError("Counldn't get frcDict")
            
        }
        
        guard let xps = fc.fetchedObjects as? [XP] else {
            fatalError("Counldn't get XP")
        }
        
        var sum = 0
        for xp in xps {
            sum = sum + Int(xp.value)
        }
        
        return sum
    }
    
    ///returns the user's current level determine programmatically.  returns nil if user's level is off the charts high
    func getUserCurrentLevel() -> Level? {
        let userXP = calculateUserXP()
        let userLevel = Levels.getLevel(from: userXP)
        
        if let lvl = userLevel {
            return lvl
        } else {
            return nil
        }
    }

}

