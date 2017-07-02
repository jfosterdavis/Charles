//
//  InAppPurchaseCollectionViewCell.swift
//  Charles
//
//  Created by Jacob Foster Davis on 6/23/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation
import UIKit
import StoreKit

class InAppPurchaseCollectionViewCell: CustomPerkStoreCollectionViewCell {
    
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var saleImageView: UIImageView!
    var transactionPending: Bool = false
    
    var iapClue: AppStoreProductDetail? = nil
    var isOnSale = false
    
    func loadAppearance(fromAppStoreProduct product: SKProduct, fromASPD aspd: AppStoreProductDetail) {
        
        //empty all, don't use the stackview
        for subView in stackView.subviews {
            stackView.removeArrangedSubview(subView)
            
            //remove button from heirarchy
            subView.removeFromSuperview()
        }
        
        //create the ImageView
        perkIconImageView.image = aspd.icon
        
        //make the background color app store blue
        //perkIconImageView.backgroundColor = aspd.displayColor
        
        //color the border
        perkColorFrame.layer.borderWidth = 3 //make distinct from perks
        perkColorFrame.layer.borderColor = aspd.displayColor.cgColor
        perkColorFrame.roundCorners(with: 4) //make frame distinct from perks
        
        //stackView.addArrangedSubview(imageView)
        
        roundCorners(with: 4) //make corners distinct from perks
        
        perkGotFromCharacterIndicator.image = #imageLiteral(resourceName: "GroupChecked")
        perkGotFromCharacterIndicator.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 0.95) //an off-white
        perkGotFromCharacterIndicator.roundCorners(with: 6)
        
        //make background app store blue
        self.backgroundColor = UIColor(red: 26/255, green: 91/255, blue: 238/255, alpha: 1)
        
        perkIconBlocker.isHidden = true
        
        //default the shade on top unless others will change
        perkGotFromCharacterIndicator.layer.zPosition = 2
        perkGotFromCharacterIndicator.alpha = 0.65
        
        statusLabel.alpha = 0
        expirationStatusView.isHidden = true
        pieLockImageView.isHidden = true
        
        priceLabel.textColor = .white
        characterNameLabel.textColor = .white
        
        //set the on sale sticker
        if isOnSale {
            saleImageView.isHidden = false
        } else {
            saleImageView.isHidden = true
        }
        
        
        //ensure font is not bold.
        priceLabel.font = UIFont(name:"GurmukhiMN", size: 15.0)
        
        //check the activity indicator
        if transactionPending {
            activityIndicator.startAnimating()
            statusShade.isHidden = false
            statusShade.alpha = 0.4
            self.isUserInteractionEnabled = false
        } else {
            activityIndicator.stopAnimating()
            statusShade.isHidden = true
            statusShade.alpha = 0.0
            self.isUserInteractionEnabled = true
        }
        
    }
    
    override func showInfo() {
        //launch the clue if it exists
        
        print("IAP clue button pressed")
        
        if let aspd = self.iapClue, canShowInfo  {
            
            //create a clue based on the perk that was pressed
            let clue = Clue(clueTitle: aspd.name,
                                part1: nil,
                                part1Image: aspd.icon,
                                part2: aspd.gameDescription,
                                part3: "Points are used to hire companions and activate tools."
            )
            
            
            if let storyboard = self.storyboard {
                let topVC = topMostController()
                let clueVC = storyboard.instantiateViewController(withIdentifier: "BasicClueViewController") as! BasicClueViewController
                clueVC.clue = clue
                clueVC.delayDismissButton = false
                //set the background
                clueVC.view.backgroundColor = UIColor(red: 26/255, green: 91/255, blue: 238/255, alpha: 1) //in app blue
                clueVC.overrideTextColor = .white
                clueVC.overrideGoldenRatio = true
                clueVC.overrideStackViewDistribution = .fillEqually
                
                topVC.present(clueVC, animated: true, completion: nil)
            }
        }
    }
    
}
