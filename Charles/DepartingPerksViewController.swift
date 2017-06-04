//
//  DepartingPerksViewController.swift
//  Charles
//
//  Created by Jacob Foster Davis on 6/4/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DepartingPerksViewController: PerkStoreCollectionViewController {
    
    @IBOutlet weak var explainationLabel: UILabel!
    
    var departingPerks = [Perk]()
    
    override func viewDidLoad() {
        
        //setup CoreData
        _ = setupFetchedResultsController(frcKey: keyUnlockedPerk, entityName: "UnlockedPerk", sortDescriptors: [],  predicate: nil)
        
        self.collectionView = storeCollectionView
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        perkCollectionViewData = departingPerks
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "perkCell", for: indexPath as IndexPath) as! CustomPerkStoreCollectionViewCell
        let perk = self.perkCollectionViewData[indexPath.row]
        
        cell.characterNameLabel.text = perk.name
        
        cell.priceLabel.text = ""
        
        
        cell.loadAppearance(fromPerk: perk)
        return cell
    }
    
    @IBAction override func dismissButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
