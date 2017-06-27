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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadClue(clue: clue)
        
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
        
        if !didLayout {
            
            let width:CGFloat = self.view.bounds.width * 0.92
            let height:CGFloat = width * 1.618 //golden ratio
            
            self.view.superview!.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6) //dim the background to focus on the modal
            let screen = self.view.superview!.bounds
            let frame = CGRect(x: 0, y: 0, width: width, height: height)
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
       
        
        self.view.roundCorners(with: 20)
        dismissButton.roundCorners(with: 20)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if delayDismissButton {
            dismissButton.fade(.in, withDuration: 3, delay: 5, completion: nil)
        }
    }
    
    func loadClue(clue: Clue) {
        self.clueTitle.text = clue.clueTitle
        
        self.part1.text = clue.part1
        
        
        if let part1Image = clue.part1Image {
            self.part1ImageView.image = part1Image
            
        } else {
            stackView.removeArrangedSubview(self.part1ImageView)
            self.part1ImageView.removeFromSuperview()
            self.part1ImageView.isHidden = true
        }
        
        if let part2 = clue.part2 {
            self.part2.text = part2
            
        } else {
            stackView.removeArrangedSubview(self.part2)
            self.part2.removeFromSuperview()
            self.part2.isHidden = true
        }
        if let part2Image = clue.part2Image {
            self.part2ImageView.image = part2Image
            
        } else {
            stackView.removeArrangedSubview(self.part2ImageView)
            self.part2ImageView.removeFromSuperview()
            self.part2ImageView.isHidden = true
        }
        
        if let part3 = clue.part3 {
            self.part3.text = part3
            
        } else {
            stackView.removeArrangedSubview(self.part3)
            self.part3.removeFromSuperview()
            self.part3.isHidden = true
        }
        if let part3Image = clue.part3Image {
            self.part3ImageView.image = part3Image
            
        } else {
            stackView.removeArrangedSubview(self.part3ImageView)
            self.part3ImageView.removeFromSuperview()
            self.part3ImageView.isHidden = true
        }
    }
    
    @IBAction func dismissButtonPressed(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
}
