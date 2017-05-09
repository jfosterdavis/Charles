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
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    // MARK: AV Variables
    let synth = AVSpeechSynthesizer()
    var textUtterance = AVSpeechUtterance(string: "")
    
    
    
    var dataObject: Character = Character(name: "Blank Character")


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.dataLabel!.text = dataObject.name
    }

    @IBAction func buttonPress(_ sender: UIButton) {
        if sender == button1 {
            let toneToSpeak: Float = dataObject.phrases![0].slots![0].tone
            let subphraseToSpeak: String = dataObject.phrases![0].subphrases![0].words
            
            textUtterance = AVSpeechUtterance(string: subphraseToSpeak)
            textUtterance.rate = 0.3
            textUtterance.pitchMultiplier = toneToSpeak
            synth.speak(textUtterance)
        }
        
        if sender == button2 {
            let toneToSpeak: Float = dataObject.phrases![0].slots![1].tone
            let subphraseToSpeak: String = dataObject.phrases![0].subphrases![1].words
            
            textUtterance = AVSpeechUtterance(string: subphraseToSpeak)
            textUtterance.rate = 0.3
            textUtterance.pitchMultiplier = toneToSpeak
            synth.speak(textUtterance)
        }
        
        if sender == button3 {
            let toneToSpeak: Float = dataObject.phrases![0].slots![2].tone
            let subphraseToSpeak: String = dataObject.phrases![1].subphrases![2].words
            
            textUtterance = AVSpeechUtterance(string: subphraseToSpeak)
            textUtterance.rate = 0.3
            textUtterance.pitchMultiplier = toneToSpeak
            synth.speak(textUtterance)
        }
        
    }

}

