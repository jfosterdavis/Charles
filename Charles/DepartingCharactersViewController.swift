//
//  DepartingCharactersViewController.swift
//  Charles
//
//  Created by Jacob Foster Davis on 6/4/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DepartingCharactersViewController: StoreCollectionViewController {
    
    @IBOutlet weak var explainationLabel: UILabel!
    
    var departingCharacters = [Character]()
    
    override func viewDidLoad() {
        
        
        self.collectionView = storeCollectionView
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        //setup CoreData
        _ = setupFetchedResultsController(frcKey: keyUnlockedCharacter, entityName: "UnlockedCharacter", sortDescriptors: [],  predicate: nil)
        
        //round corners of the dismiss button
        dismissButton.roundCorners()
        
        collectionViewData = departingCharacters
    }
    
    
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        //        switch segmentedControl.selectedSegmentIndex {
//        //        case 0:
//        //TODO: replace as! UITAbleViewCell witha  custom cell
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "characterCell", for: indexPath as IndexPath) as! CustomStoreCollectionViewCell
//        let character = self.collectionViewData[indexPath.row]
//        
//        cell.characterNameLabel.text = character.name
//
//        cell.priceLabel.text = ""
//        
//        
//        cell.loadAppearance(from: character.phrases![0])
//        
//        return cell
//    }
    
    @IBAction override func dismissButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
