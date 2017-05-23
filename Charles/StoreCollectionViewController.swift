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
    
    @IBOutlet weak var unlockFredButton: UIButton!
    @IBOutlet weak var dismissButton: UIButton!
    
    //CoreData FRC Keys
    let keyUnlockedCharacters = "keyUnlockedCharacters"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //set up this collection view with the CoreData parent
        //self.collectionView = storeCollectionView
        
        //setup CoreData
        _ = setupFetchedResultsController(frcKey: keyUnlockedCharacters, entityName: "UnlockedCharacters", sortDescriptors: [],  predicate: nil)
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

    @IBAction func unlockFredButtonPressed(_ sender: Any) {
        
        guard let fc = frcDict[keyUnlockedCharacters] else {
            return
            
        }
        
        guard let characters = fc.fetchedObjects as? [UnlockedCharacters] else {
            
            return
        }
        
        //if Fred is not in the arracy of Unlocked Characters, then add him
        var wasFredFound = false
        for character in characters {
            if character.name == "Fred2" {
                wasFredFound = true
                break
            }
        }
        
        if !wasFredFound {
            
            let newCharacter = UnlockedCharacters(entity: NSEntityDescription.entity(forEntityName: "UnlockedCharacters", in: stack.context)!, insertInto: fc.managedObjectContext)
            newCharacter.name = "Fred"
            print("Unlockd a new character named \(String(describing: newCharacter.name))")
        }

        
    }
    
    
}
