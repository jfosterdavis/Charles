//
//  DepartingItemsViewController.swift
//  Charles
//
//  Created by Jacob Foster Davis on 6/4/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DepartingItemsViewController: StoreCollectionViewController {
    
    @IBOutlet weak var explainationLabel: UILabel!
    
    var departingCharacters = [Character]()
    var departingPerks = [Perk]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView = storeCollectionView
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        perkCollectionViewData = departingPerks
        
        collectionViewData = departingCharacters
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.playerScoreLabel.text = String(describing: score.formattedWithSeparator)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
            
        case "UICollectionElementKindSectionHeader":
            
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "departingSectionHeader", for: indexPath) as! SectionHeaderCollectionReusableView
            
            let section = indexPath.section
            
            switch section {
            case charactersSection:
                headerView.headerTitleLabel.text = "Departing Companions"
            case toolsSection:
                headerView.headerTitleLabel.text = "Expiring Tools"
            case iapsSection:
                headerView.headerTitleLabel.text = "Available In-App Purchases"
            default:
                headerView.headerTitleLabel.text = "Unknown Section"
            }
            
            return headerView
            
        default:
            assert(false, "Unexpected element kind")
            return UICollectionReusableView()
        }
    }
    
    //sections
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        //if there are inapp purchases to be displayed, return 2
        
        let iapCount = self.appStoreProducts.count
        let toolsCount = perkCollectionViewData.count
        let characterCount = collectionViewData.count
        
        var sectionCount = 0 //start with 0
        
        if characterCount > 0 {
            charactersSection = sectionCount
            sectionCount += 1
        } else {
            charactersSection = -1
        }
        
        if toolsCount > 0 {
            toolsSection = sectionCount
            sectionCount += 1
        } else {
            toolsSection = -1
        }
        
        if iapCount > 0 {
            iapsSection = sectionCount
            sectionCount += 1
        } else {
            iapsSection = -1
        }
        
        return sectionCount
    }
    
    
    @IBAction override func dismissButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
