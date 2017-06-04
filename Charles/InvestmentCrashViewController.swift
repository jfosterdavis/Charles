//
//  InvestmentCrashViewController.swift
//  Charles
//
//  Created by Jacob Foster Davis on 6/3/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation
import UIKit

/******************************************************/
/*******************///MARK: This used in association with a crash related to the investment perk
/******************************************************/

class InvestmentCrashViewController: UIViewController {
    
    @IBOutlet weak var hexDollarImageView: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var dismissButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hexDollarImageView.alpha = 0
        dismissButton.alpha = 0
        dismissButton.isEnabled = false
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(animated)
        
        hexDollarImageView.fade(.in,
                                delay: 3)
        
        dismissButton.fade(.in,
                           resultAlpha: 1,
                           disable: false,
                           withDuration: 5,
                           delay: 7, completion: nil)
    }
    
    @IBAction func dismissButtonPressed(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
}
