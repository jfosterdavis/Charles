//
//  CharacterView.swift
//  Charles
//
//  Created by Jacob Foster Davis on 6/27/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation
import UIKit
@IBDesignable

///Used to get the character's appearance for display purposes (not interaction)
class CharacterView:UIView
{
    @IBInspectable var roundCorners: Bool = true
        {
        didSet {}
    }
    
    @IBInspectable var cornerRadius: CGFloat = 5.0
        {
        didSet {}
    }
    
    var phrase: Phrase? = Phrase(name: "Pawned his head",
                                 likelihood: 88,
                                 subphrases: [Subphrase(words: "Pawned", audioFilePath: Bundle.main.path(forResource: "Pawned", ofType: "m4a", inDirectory: "Audio/Dan")),
                                              Subphrase(words: "his", audioFilePath: Bundle.main.path(forResource: "His", ofType: "m4a", inDirectory: "Audio/Dan")),
                                              Subphrase(words: "Head", audioFilePath: Bundle.main.path(forResource: "Head", ofType: "m4a", inDirectory: "Audio/Dan"))],
                                 slots: [Slot(tone: 300, color: .white),
                                         Slot(tone: 300, color: .green),
                                         Slot(tone: 300, color: .green),
                                         Slot(tone: 600, color: .blue),
                                         Slot(tone: 600, color: .blue),
                                         Slot(tone: -600, color: .orange),
                                         Slot(tone: -600, color: .orange),
                                         Slot(tone: -300, color: .red),
                                         Slot(tone: -300, color: .red),
                                         Slot(tone: -375, color: .black),
                                         ])
    var stackView: UIStackView = UIStackView()
    
    override func draw(_ rect: CGRect)
    {
        //remove all subviews to start with clean slate
        for subView in self.subviews {
            
            //remove button from heirarchy
            subView.removeFromSuperview()
        }
        
        
        //create fresh stackView
        stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stackView)
        
        //autolayout the stackview
        let viewsDictionary = ["stackView":stackView]
        let stackView_H = NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-0-[stackView]-0-|",  //horizontal constraint 0 points from left and right side
            options: NSLayoutFormatOptions(rawValue: 0),
            metrics: nil,
            views: viewsDictionary)

        let stackView_V = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-0-[stackView]-0-|", //vertical constraint 0 points from top and bottom
            options: NSLayoutFormatOptions(rawValue:0),
            metrics: nil,
            views: viewsDictionary)
        self.addConstraints(stackView_H)
        self.addConstraints(stackView_V)
        
        
        
        //create the outfit
        if let phrase = self.phrase {
            guard let slots = phrase.slots else {
                //TODO: handle phrase with nil slots
                return
                
            }
            
            //empty all buttons
            for subView in stackView.subviews {
                stackView.removeArrangedSubview(subView)
                
                //remove button from heirarchy
                subView.removeFromSuperview()
            }
            
            //buttonStackView.translatesAutoresizingMaskIntoConstraints = false
            var counter = 0
            //step through each slot and createa  button for it
            for slot in slots {
                //create a button
                let slotButton = createButton(from: slot)
                //add the button to the array of buttons
                //currentButtons.append(slotButton)
                
                //add the button to the stackview
                stackView.addArrangedSubview(slotButton)
                
                //create layout constraints for the button
                let widthConstraint = NSLayoutConstraint(item: slotButton, attribute: .width, relatedBy: .equal, toItem: stackView, attribute: .width, multiplier: 1, constant: 0)
                widthConstraint.isActive = true
                stackView.addConstraint(widthConstraint)
                
                counter += 1
            }
            
            
            self.backgroundColor = UIColor(red: 249/255, green: 234/255, blue: 188/255, alpha: 1)
        }
        
        if roundCorners {
            self.roundCorners(with: cornerRadius)
        }
        
    }
    
    /// creates a new button with the color indicated by the given Slot
    func createButton(from slot: Slot) -> UIButton {
        let newButton = UIButton(type: .system)
        newButton.backgroundColor = slot.color
        newButton.setTitle("", for: .normal)
        
        //disable buttons in this interface
        newButton.isEnabled = false
        newButton.isUserInteractionEnabled = false
        return newButton
    }
    

    
}
