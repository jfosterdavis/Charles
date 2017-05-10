//
//  DataViewController.swift
//  Charles
//
//  Created by Jacob Foster Davis on 5/7/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import UIKit
import AVFoundation

class DataViewController: UIViewController {

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
    
    var dataObject: Character = Character(name: "Blank Character")
    var currentPhrase: Phrase!
    var currentSubphraseIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
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
        
        //step through each slot and createa  button for it
        for slot in slots {
            //create a button
            let slotButton = createButton(from: slot)
            
            
            //add the button to the array of buttons
            currentButtons.append(slotButton)
            
            //add the button to the stackview
            buttonStackView.addArrangedSubview(slotButton)
            
            //create layout constraints for the button
            let widthConstraint = NSLayoutConstraint(item: slotButton, attribute: .width, relatedBy: .equal, toItem: buttonStackView, attribute: .width, multiplier: 1, constant: 0)
            widthConstraint.isActive = true
            buttonStackView.addConstraint(widthConstraint)
            
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
        let toneToSpeak: Float = currentPhrase.slots![currentButtons.index(of: sendingButton!)!].tone
        let subphraseToSpeak: String = currentPhrase.subphrases![currentSubphraseIndex].words
        textUtterance = AVSpeechUtterance(string: subphraseToSpeak)
        textUtterance.rate = 0.3
        textUtterance.pitchMultiplier = toneToSpeak
        
        //speak
        synth.speak(textUtterance)
        
        //iterate the subphrase
        
        currentSubphraseIndex += 1
        
        //reload another phrase if this was the last word
        if currentSubphraseIndex >= currentPhrase.subphrases!.count {
            currentSubphraseIndex = 0
            
            //reload a different phrase
            reloadButtons()
        }
        
    }

}

