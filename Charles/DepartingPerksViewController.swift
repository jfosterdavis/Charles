////
////  DepartingPerksViewController.swift
////  Charles
////
////  Created by Jacob Foster Davis on 6/4/17.
////  Copyright © 2017 Zero Mu, LLC. All rights reserved.
////
//
//import Foundation
//import UIKit
//import CoreData
//
//class DepartingPerksViewController: StoreCollectionViewController {
//    
//    @IBOutlet weak var explainationLabel: UILabel!
//    
//    var departingPerks = [Perk]()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        //setup CoreData
////        _ = setupFetchedResultsController(frcKey: keyUnlockedPerk, entityName: "UnlockedPerk", sortDescriptors: [],  predicate: nil)
////        _ = setupFetchedResultsController(frcKey: keyCurrentScore, entityName: "CurrentScore", sortDescriptors: [],  predicate: nil)
//        
//        self.collectionView = storeCollectionView
//        self.collectionView.dataSource = self
//        self.collectionView.delegate = self
//        
//        collectionViewData = [Character]()
//        
//        perkCollectionViewData = departingPerks
//    }
//    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        
//        self.playerScoreLabel.text = String(describing: score.formattedWithSeparator)
//    }
//    
//    
////    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
////        
////        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "perkCell", for: indexPath as IndexPath) as! CustomPerkStoreCollectionViewCell
////        let perk = self.perkCollectionViewData[indexPath.row]
////        
////        cell.characterNameLabel.text = perk.name
////        
////        cell.priceLabel.text = ""
////        
////        
////        cell.loadAppearance(fromPerk: perk)
////        return cell
////    }
//    
//    @IBAction override func dismissButtonPressed(_ sender: Any) {
//        self.dismiss(animated: true, completion: nil)
//    }
//    
//}
