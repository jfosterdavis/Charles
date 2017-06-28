//
//  BasicClueViewController.swift
//  Charles
//
//  Created by Jacob Foster Davis on 6/16/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation
import UIKit

/******************************************************/
/*******************///MARK: A basic clue is one with up to 5 paragraphs that appear in order, with a title.  Presented to user over time to help them understand the game.
/******************************************************/

class BasicClueViewController: UIViewController {
    
    @IBOutlet weak var dismissButton: UIButton!
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var clueTitle: UILabel!
    
    @IBOutlet weak var part1: UILabel!
    @IBOutlet weak var part1ImageView: UIImageView!
    @IBOutlet weak var part2: UILabel!
    @IBOutlet weak var part2ImageView: UIImageView!
    @IBOutlet weak var part3: UILabel!
    @IBOutlet weak var part3ImageView: UIImageView!
    
    var clue: Clue!
    
    var delayDismissButton = true
    
    var didLayout = false
    
    var overrideTextColor: UIColor? = nil
    var overrideGoldenRatio = false
    var overrideStackViewDistribution: UIStackViewDistribution? = nil
    
    var numNilSections = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        if delayDismissButton {
            dismissButton.isHidden = true
            dismissButton.isEnabled = true
            dismissButton.alpha = 0
        } else {
            dismissButton.isHidden = false
            dismissButton.isEnabled = true
            dismissButton.alpha = 1
        }
        
        //view.backgroundColor = .clear
        //view.isOpaque = false
        
        
        
        //self.preferredContentSize = CGSize(width: 100, height: 150)
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        if let newDistribution = overrideStackViewDistribution {
            stackView.distribution = newDistribution
        }
        
        loadClue(clue: clue)
        
        if !didLayout {
            
            let width:CGFloat = self.view.bounds.width * 0.92
            let height:CGFloat = width * 1.618 //golden ratio
            
            let adjustedHeight:CGFloat
            
            if overrideGoldenRatio {
            
            let heightToRemove = CGFloat(numNilSections) * (height * (1.0/6.0)) - 100
                //allows some versions to get smaller
                //remove 1/6 - height of title and top bottom margins of the height for every nil section
                adjustedHeight = height - heightToRemove
            } else {
                adjustedHeight = height
            }
            
            
            self.view.superview!.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6) //dim the background to focus on the modal
            let screen = self.view.superview!.bounds
            let frame = CGRect(x: 0, y: 0, width: width, height: adjustedHeight)
            let x = (screen.size.width - frame.size.width) * 0.5
            let y = (screen.size.height - frame.size.height) * 0.5
            let mainFrame = CGRect(x: x, y: y, width: frame.size.width, height: frame.size.height)
            
            self.view.frame = mainFrame
            
            didLayout = true
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        if let part1Image = part1ImageView {
//            part1Image.roundCorners(with: 3)
//        }
//        if let part2Image = part2ImageView {
//            part2Image.roundCorners(with: 3)
//        }
//        if let part3Image = part3ImageView {
//            part3Image.roundCorners(with: 3)
//        }
        //stackView.roundCorners(with: 4)
       
        let radius = dismissButton.bounds.width / 2
        self.view.roundCorners(with: radius)
        dismissButton.roundCorners(with: radius)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if delayDismissButton {
            dismissButton.fade(.in, withDuration: 3, delay: 5, completion: nil)
        }
    }
    
    func loadClue(clue: Clue) {
        self.numNilSections = 0
        
        self.clueTitle.text = clue.clueTitle
        
        if let textColor = overrideTextColor {
            self.clueTitle.textColor = textColor
        }
        
        if let part1 = clue.part1 {
            self.part1.text = part1
            self.part1.backgroundColor = self.view.backgroundColor
            if let textColor = overrideTextColor {
                self.part1.textColor = textColor
            }
            
        } else {
            stackView.removeArrangedSubview(self.part1)
            self.part1.removeFromSuperview()
            self.part1.isHidden = true
            self.numNilSections += 1
        }
        
        if let part1Image = clue.part1Image {
            self.part1ImageView.image = part1Image
            self.part1ImageView.backgroundColor = self.view.backgroundColor
            
            
        } else {
            stackView.removeArrangedSubview(self.part1ImageView)
            self.part1ImageView.removeFromSuperview()
            self.part1ImageView.isHidden = true
            self.numNilSections += 1
        }
        
        if let part2 = clue.part2 {
            self.part2.text = part2
            self.part2.backgroundColor = self.view.backgroundColor
            if let textColor = overrideTextColor {
                self.part2.textColor = textColor
            }
            
        } else {
            stackView.removeArrangedSubview(self.part2)
            self.part2.removeFromSuperview()
            self.part2.isHidden = true
            self.numNilSections += 1
        }
        if let part2Image = clue.part2Image {
            self.part2ImageView.image = part2Image
            self.part2ImageView.backgroundColor = self.view.backgroundColor
            
            
        } else {
            stackView.removeArrangedSubview(self.part2ImageView)
            self.part2ImageView.removeFromSuperview()
            self.part2ImageView.isHidden = true
            self.numNilSections += 1
        }
        
        if let part3 = clue.part3 {
            self.part3.text = part3
            self.part3.backgroundColor = self.view.backgroundColor
            if let textColor = overrideTextColor {
                self.part3.textColor = textColor
            }
            
        } else {
            stackView.removeArrangedSubview(self.part3)
            self.part3.removeFromSuperview()
            self.part3.isHidden = true
            self.numNilSections += 1
        }
        if let part3Image = clue.part3Image {
            self.part3ImageView.image = part3Image
            self.part3ImageView.backgroundColor = self.view.backgroundColor
            
            
        } else {
            stackView.removeArrangedSubview(self.part3ImageView)
            self.part3ImageView.removeFromSuperview()
            self.part3ImageView.isHidden = true
            self.numNilSections += 1
        }
    }
    
    @IBAction func dismissButtonPressed(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
}
