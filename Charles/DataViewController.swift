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

class DataViewController: CoreDataViewController {

    @IBOutlet weak var dataLabel: UILabel!

    //page control
    @IBOutlet weak var pageControl: UIPageControl!
    var currentPage = 0
    var numPages = 1
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var buttonStackView: UIStackView!
    
    var currentButtons = [UIButton]()
    
    // MARK: AV Variables
    let synth = AVSpeechSynthesizer()
    var textUtterance = AVSpeechUtterance(string: "")
    var audioPlayer: AVAudioPlayer!
    var audioEngine: AVAudioEngine!
    
    //CoreData
    var keyCurrentScore = "CurrentScore"
    
    // MARK: Score
    var timer = Timer()
    
    //Store
    @IBOutlet weak var storeButton: UIButton!
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    var dataObject: Character!
    var currentPhrase: Phrase!
    var currentSubphraseIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //audio
        audioEngine = AVAudioEngine()
        
        //setup CoreData
        _ = setupFetchedResultsController(frcKey: keyCurrentScore, entityName: "CurrentScore", sortDescriptors: [],  predicate: nil)
        
        //setup the score
        refreshScore()
      
        //delegates
        
        //add placeholder buttons to the array of buttons
        currentButtons = [button1, button2, button3]
        
        //set the page control
        self.pageControl.numberOfPages = numPages
        self.pageControl.currentPage = currentPage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.dataLabel!.text = dataObject.name
        
        reloadButtons()
   
        //stop the timer to avoide stacking penalties
        timer.invalidate()
        //start the timer
        timer = Timer.scheduledTimer(timeInterval: 0.12, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        //stop the timer to avoide stacking penalties
        timer.invalidate()
    }
    
    
    func reloadButtons() {
        //1. get a random phrase from the character
        currentPhrase = dataObject.selectRandomPhrase()
        guard currentPhrase != nil  else {
            //TODO: handle nil returned for random phrase
            print("Nil phrase returned")
            return
        }
        
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
    
    ///removes all buttons, the loads up new buttons from the given Phrase.
    func removeAndReloadButtons(from phrase: Phrase) {
        //first, remove all current buttons from the stackview
        removeAllButtons()
        
        //there should be no buttons, so now create some buttons
        loadPhraseButtons(from: phrase)
    }
    
    ///removes all buttons from the stackview
    func removeAllButtons() {
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
    
    /// Adds buttons from the given phrase to the stackview
    func loadPhraseButtons(from phrase: Phrase) {
     
        guard let slots = phrase.slots else {
        //TODO: handle phrase with nil slots
            return
        
        }
        
        //buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        var counter = 0
        //step through each slot and createa  button for it
        for slot in slots {
            //create a button
            let slotButton = createButton(from: slot)
            
            //TODO: make the top corners of the first button rounded
            if counter == 0 {
                //if it is the first slot, round the top corners
                //round corners
                slotButton.layer.masksToBounds = true
                //slotButton.layer.cornerRadius = CGFloat(6.0)
                
                let maskPAth1 = UIBezierPath(roundedRect: slotButton.bounds,
                                             byRoundingCorners: [.topLeft],
                                             cornerRadii:CGSize(width: 8.0, height: 8.0))
                let maskLayer1 = CAShapeLayer()
                maskLayer1.frame = slotButton.bounds
                maskLayer1.path = maskPAth1.cgPath
                //slotButton.layer.mask = maskLayer1
            }
            
            
            
            //add the button to the array of buttons
            currentButtons.append(slotButton)
            
            //add the button to the stackview
            buttonStackView.addArrangedSubview(slotButton)
            
            //create layout constraints for the button
            let widthConstraint = NSLayoutConstraint(item: slotButton, attribute: .width, relatedBy: .equal, toItem: buttonStackView, attribute: .width, multiplier: 1, constant: 0)
            widthConstraint.isActive = true
            buttonStackView.addConstraint(widthConstraint)
            
            counter += 1
        }
        
        
        
        
    }
    
    @IBAction func buttonPress(_ sender: UIButton) {
        //2. Play the current subphrase with the tone of the pressed button.
        
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
            
                //setup node
                let audioPlayerNode = AVAudioPlayerNode()
                audioEngine.attach(audioPlayerNode)
                
                
                //change pitch
                let changePitchEffect = AVAudioUnitTimePitch()
                //changePitchEffect.pitch = 1000
                changePitchEffect.pitch = currentPhrase.slots![currentButtons.index(of: sendingButton!)!].tone
                audioEngine.attach(changePitchEffect)
                
                audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
                audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
                
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
        
        
        
        //iterate the subphrase
        
        currentSubphraseIndex += 1
        
        //reload another phrase if this was the last word
        if currentSubphraseIndex >= currentPhrase.subphrases!.count {
            currentSubphraseIndex = 0
            
            //give them some points for finishing a phrase
            setCurrentScore(newScore: getCurrentScore() + calculateBaseScore(phrase: currentPhrase))
            
            //update the score
            refreshScore()
            
            //reload a different phrase
            reloadButtons()
        }
        
    }
    
    /******************************************************/
    /*******************///MARK: Audio Functions
    /******************************************************/

    
    func resetAudioEngineAndPlayer() {
        //audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
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
        if currentScore >= 1000 {
            scoreLabel.alpha = 1.0
            storeButton.alpha = 1.0
        } else {
            let newAlpha: CGFloat = CGFloat(Float(currentScore) / 1000.0)
            scoreLabel.alpha = newAlpha
            storeButton.alpha = 2*newAlpha - 1 //this makes store button visible at 500 and solid at 1000. y=mx+b
            if storeButton.alpha == 0 {
                storeButton.isEnabled = false
            } else {
                storeButton.isEnabled = true
            }
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
            setCurrentScore(newScore: newScore)
            refreshScore()
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
        
        if (fc.sections?.count)! == 0  {
            print("No CurrentScore exists.  Creating.")
            let currentScore = CurrentScore(entity: NSEntityDescription.entity(forEntityName: "CurrentScore", in: stack.context)!, insertInto: fc.managedObjectContext)
            currentScore.value = Int64(newScore)
            
            return Int(currentScore.value)
        } else {
            //set score for the first element
            currentScores[0].value = Int64(newScore)
            
            return Int(currentScores[0].value)
        }

    }

}

