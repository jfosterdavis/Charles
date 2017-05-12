//
//  StoreCollectionViewController.swift
//  Charles
//
//  Created by Jacob Foster Davis on 5/11/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class StoreCollectionViewController: CoreDataCollectionViewController, UICollectionViewDataSource {

    

    @IBOutlet weak var storeCollectionView: UICollectionView!
    
    @IBOutlet weak var dismissButton: UIButton!
    
    override func viewDidLoad() {
        
        //set up this collection view with the CoreData parent
        self.collectionView = storeCollectionView
    }
    
    @IBAction func dismissButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /******************************************************/
    /*******************///MARK: UICollectionViewDataSource
    /******************************************************/
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //returns number of items in the collection
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //        switch segmentedControl.selectedSegmentIndex {
        //        case 0:
        //TODO: replace as! UITAbleViewCell witha  custom cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "statOverviewCell", for: indexPath as IndexPath) as! CustomStoreCollectionViewCell
        //let stat = self.statsOverviewCollectionData[indexPath.row]
        
        //cell.statDescription.text = stat.description
        //cell.statNumber.text = String(stat.number)
        
        
        return cell
        //        default: break
        //
        //        }
    }

    
    
}
