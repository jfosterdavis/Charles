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

    var parentVC: UIViewController!
    var collectionViewData: [Character]!
    
    @IBOutlet weak var storeCollectionView: UICollectionView!
    
    @IBOutlet weak var playerScoreLabel: UILabel!
    
    var score: Int = 0
    @IBOutlet weak var unlockFredButton: UIButton!
    @IBOutlet weak var dismissButton: UIButton!
    
    //Characters
    var alwaysUnlockedCharacterNames = [String]()
    
    //CoreData FRC Keys
    let keyUnlockedCharacter = "keyUnlockedCharacter"
    
    //Errors
    enum StoreError: Error {
        case invalidFeatureKey(key: String)
        case characterAlreadyUnlocked
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //set up this collection view with the CoreData parent
        self.collectionView = storeCollectionView
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        //set the score label
        updateScoreLabel()
        
        //setup unlocked character names
        for character in Characters.AlwaysUnlockedSet {
            alwaysUnlockedCharacterNames.append(character.name)
        }
        
        //setup CoreData
        _ = setupFetchedResultsController(frcKey: keyUnlockedCharacter, entityName: "UnlockedCharacter", sortDescriptors: [],  predicate: nil)
        
        //initialize data for the collectionView
        collectionViewData = getAllCharactersDisplayableInStore()
    }
    
    @IBAction func dismissButtonPressed(_ sender: Any) {
        let pVC = self.parentVC as! DataViewController
        pVC.storeClosed()
        self.dismiss(animated: true, completion: nil)
    }
    
    /******************************************************/
    /*******************///MARK: UICollectionViewDataSource
    /******************************************************/
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //returns number of items in the collection
        return collectionViewData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //        switch segmentedControl.selectedSegmentIndex {
        //        case 0:
        //TODO: replace as! UITAbleViewCell witha  custom cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "characterCell", for: indexPath as IndexPath) as! CustomStoreCollectionViewCell
        let character = self.collectionViewData[indexPath.row]
        
        cell.characterNameLabel.text = character.name
        let price = character.price
        var priceLabelText = ""
        if price! <= 0 {
            priceLabelText = "Free!"
        } else {
            priceLabelText = String(describing: price!)
        }
        
        cell.priceLabel.text = priceLabelText

        
        cell.loadAppearance(from: character.phrases![0])
        
        //set the status of this character.  Is it unlocked or affordable?
        
        //if it is unlocked
        if try! checkForUnlockFeature(featureKey: keyUnlockedCharacter, featureId: character.name) {
            //it is unlocked, so set the status to unlocked
            cell.setStatusUnlocked()
        } else if !isCharacterAffordable(character: character) {  //check if it is affordable
            cell.setStatusUnaffordable()
        } else {  //the character is not unlocked and is affordable
            cell.setStatusAffordable()
        }
        
        
        return cell
        //        default: break
        //
        //        }
    }
    
    /******************************************************/
    /*******************///MARK: UIcollectionViewDelegate
    /******************************************************/
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)  {
    
        let character = self.collectionViewData[indexPath.row]
        
        guard !isCharacterAffordable(character: character) else {
            print ("You cannot afford this item")
            return
        }
        
        let newCharacter = unlockCharacter(named: character.name)
        
        if newCharacter != nil {
            //deduct the price
            score = score - character.price!
            updateScoreLabel()
            
            //remove from the store
            //collectionViewData.remove(at: indexPath.row)
            //don't remove, instead shade it differently
            
            collectionView.reloadData()
            
            //TODO: deduct value from actual CoreData points
            
            print("Character \(newCharacter!.name) has been unlocked!")
        }
        
    
    }
    
    /******************************************************/
    /*******************///MARK: Buttons
    /******************************************************/


    @IBAction func unlockFredButtonPressed(_ sender: Any) {
        
        //unlock fred
        let fred = unlockCharacter(named: "Fred")
        if fred != nil {
            //fred was unlocked, so go tell someone
            print("Fred has been unlocked!")
        } else {
            //fred was not unlocked or was already unlocked
            print("Fred is already unlocked!")
        }
    }
    
    
//    @IBAction func buyCharacter(_ sender: UIButton) {
//        let cell = sender.superview as! CustomStoreCollectionViewCell
//        
//        let price = cell.priceLabel.text
//        var priceInt = 0
//        
//        guard price != nil else {
//            print("price was nil")
//            return
//        }
//        
//        if price != "Free!" {
//            priceInt = Int(price!)!
//        }
//        
//        guard priceInt < score else {
//            print ("You cannot afford this item")
//            return
//        }
//        
//        
//        if let characterName = cell.characterNameLabel.text {
//            let newCharacter = unlockCharacter(named: characterName)
//            
//            if newCharacter != nil {
//                //deduct the price
//                score = score - priceInt
//                updateScoreLabel()
//                
//                print("Character \(newCharacter!.name) has been unlocked!")
//            }
//        }
//    }
    
    /******************************************************/
    /*******************///MARK: General Functions
    /******************************************************/

    func updateScoreLabel() {
        let scoreTemp = String(describing: score)
        
        playerScoreLabel.text = scoreTemp
    }
    
    func isCharacterAffordable(character: Character) -> Bool {
        
        let price = character.price!
        
        if price > score {
            print ("You cannot afford this item")
            return false
        } else {
            return true
        }
    }
    
    
    ///Checks the given CoreData set for the given FRCKey, for the given id of the feature to see if that feature is unlocked in the store or not.
    func checkForUnlockFeature(featureKey: String, featureId: String) throws -> Bool {
        guard let fc = frcDict[featureKey] else {
            fatalError("Can't find a fc with the key named \(featureKey)")
        }
        
        switch featureKey {
        case keyUnlockedCharacter:
            
            //look for the given string in the name field
            guard let characters = fc.fetchedObjects as? [UnlockedCharacter] else {
                fatalError("fc.fetchedObjects array didn't return an array of UnlockedCharacters.")
            }
            
            //if the name is in the alwaysunlocked list then don't bother with the rest
            guard !alwaysUnlockedCharacterNames.contains(featureId) else {
                return true
            }
            
            //if the character name is found in the set of unlocked characgters, or if the character object is found in the set of characters that are always unlocked
            for character in characters {
                if character.name! == featureId{
                    //character was found, return true
                    return true
                }
            }
            
            //character not found, return false
            return false
        default:
            throw StoreError.invalidFeatureKey(key: featureKey)
            
        }
    }
    
    /**
     unlocks the given character and either returns that UnlockedCharacter object or returns nil if the character is already unlocked
     */
    func unlockCharacter(named characterName: String) -> UnlockedCharacter? {
        //check to see if the character is already unlocked
        
        if let isUnlocked = try? checkForUnlockFeature(featureKey: keyUnlockedCharacter, featureId: characterName) {
            
            guard let fc = frcDict[keyUnlockedCharacter] else {
                fatalError("Can't find a fc with the key named \(keyUnlockedCharacter)")
            }
            
            guard let characters = fc.fetchedObjects as? [UnlockedCharacter] else {
                
                fatalError("fc.fetchedObjects array didn't return an array of UnlockedCharacter.")
            }
            
            if isUnlocked {
                //it is already unlocked, so return nil
                return nil
            } else {
                //it is not unlocked, so unlock it and return the character
                let newCharacter = UnlockedCharacter(entity: NSEntityDescription.entity(forEntityName: "UnlockedCharacter", in: stack.context)!, insertInto: fc.managedObjectContext)
                newCharacter.name = characterName
                print("Unlocked a new character named \(String(describing: newCharacter.name))")
                return newCharacter
                
            }
        }
        
        //got an error when checking for the feature, return nil
        return nil
        
        
    }
    
    /**
     returns the UnlockedCharacter object from the CoreData.  Perhaps to be deleted (thereby removing it).
     */
    func getUnlockedCharacter(named characterName:String) -> UnlockedCharacter? {
   
        let characterExists = try? checkForUnlockFeature(featureKey: keyUnlockedCharacter, featureId: characterName)
        
        if characterExists == false || characterExists == nil {
            return nil
        } else {
            //the character does exist, so get and return the UnlockedCharacter
            guard let fc = frcDict[keyUnlockedCharacter] else {
                fatalError("Can't find a fc with the key named \(keyUnlockedCharacter)")
            }
            
            guard let characters = fc.fetchedObjects as? [UnlockedCharacter] else {
                
                fatalError("fc.fetchedObjects array didn't return an array of UnlockedCharacter.")
            }
            
            for character in characters {
                if character.name == characterName {
                    return character
                }
            }
            
            //no character found
            return nil
        }
    }
    
    func getAllLockedCharacters() -> [Character] {
        
        let unlockableCharacters = Characters.UnlockableCharacters
        var allLockedCharacters: [Character] = []
        
        //add the characters that have not been unlocked
        for character in unlockableCharacters {
            //if the character is already unlocked, remove from the array
            
            let isUnlocked = try! checkForUnlockFeature(featureKey: keyUnlockedCharacter, featureId: character.name)
           
            if !isUnlocked {
                allLockedCharacters.append(character)
            }
        }
        
        return allLockedCharacters
        
    }
    
    func getAllCharactersDisplayableInStore() -> [Character] {
        
        return Characters.ValidCharacters

    }
    
}
