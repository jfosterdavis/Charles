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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadClue(clue: clue)
        
    }
    
    func loadClue(clue: Clue) {
        self.part1.text = clue.part1
        if let part1Image = clue.part1Image {
            self.part1ImageView.image = part1Image
        }
        if let part2 = clue.part2 {
            self.part2.text = part2
        }
        if let part2Image = clue.part2Image {
            self.part2ImageView.image = part2Image
        }
        if let part3 = clue.part3 {
            self.part3.text = part3
        }
        if let part3Image = clue.part3Image {
            self.part3ImageView.image = part3Image
        }
    }
    
    @IBAction func dismissButtonPressed(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
}
