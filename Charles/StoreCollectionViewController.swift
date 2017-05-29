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
    
    @IBOutlet weak var dismissButton: UIButton!
    
    var timer = Timer()
    
    
    
    var score: Int = 0
    
    //Characters
    var alwaysUnlockedCharacterNames = [String]()
    
    //CoreData FRC Keys
    let keyUnlockedCharacter = "keyUnlockedCharacter"
    let keyCurrentScore = "CurrentScore"
    
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
        _ = setupFetchedResultsController(frcKey: keyCurrentScore, entityName: "CurrentScore", sortDescriptors: [],  predicate: nil)
        
        //initialize data for the collectionView
        collectionViewData = getAllCharactersDisplayableInStore()
        
        //lock all expired characters
        lockAllExpiredCharacters()
        
        //round corners of the dismiss button
        dismissButton.roundCorners()
        
        //stop the timer to avoide stacking penalties
        timer.invalidate()
        //Every minute refresh the collectionView
        timer = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        //stop the timer to avoide stacking penalties
        timer.invalidate()
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
        
        //check that none of them have expired since this view has been open:
        lockAllExpiredCharacters()
        
        //set the status of this character.  Is it unlocked or affordable?
        
        //start the progress pie as hidden
        let expiryPie = cell.expirationStatusView as! PieTimerView
        expiryPie.isHidden = true
        cell.pieLockImageView.isHidden = true
        
        //if it is unlocked
        if try! checkForUnlockFeature(featureKey: keyUnlockedCharacter, featureId: character.name) {
            //it is unlocked, so set the status to unlocked
            cell.setStatusUnlocked()
            
            //if this character is unlockable and if we can get it
            if let unlockedChar = getUnlockedCharacter(named: character.name) {
                
                //calculate number of hours remaining and number of hours total
                let hours = getHoursOfExpiry(forCharacter: unlockedChar)
                
                if let hoursUntilExpiry = hours.0, let totalHoursUnlocked = hours.2, let minutesUntilExpiry = hours.1 {
                    //if there is only one hour left, show red in minutes
                    if hoursUntilExpiry <= 1 {
                        
                        let percentOfPieToFill = Float(minutesUntilExpiry) / 60 * 100.0
                        print("Expiry in \(minutesUntilExpiry) minutes.  Percentage left is \(percentOfPieToFill)")
                        //less than one minute, set color to red
                        expiryPie.setProgressColor(color: UIColor.red)
                        
                        //since it is unlocked, show the expiration status so the user will know if it is close to expiry
                        expiryPie.setProgress(percent: percentOfPieToFill)
                        
                    } else {
                    
                        
                        let percentOfPieToFill = Float(hoursUntilExpiry) / Float(totalHoursUnlocked) * 100.0
                        
                        //since it is unlocked, show the expiration status so the user will know if it is close to expiry
                        expiryPie.setProgress(percent: percentOfPieToFill)
                        
                        
                    }
                    //able to populate the pie, so show it
                    expiryPie.isHidden = false
                    cell.pieLockImageView.isHidden = false
                }
            
            }
            
           
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
    /*******************///MARK: Timer
    /******************************************************/

    func updateTimer() {
        collectionView.reloadData()
    }
    
    /******************************************************/
    /*******************///MARK: UIcollectionViewDelegate
    /******************************************************/
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)  {
    
        let character = self.collectionViewData[indexPath.row]
        
        guard isCharacterAffordable(character: character) else {
            print ("You cannot afford this item")
            return
        }
        
        let newCharacter = unlockCharacter(named: character.name)
        
        if newCharacter != nil {
            //deduct the price
            score = score - character.price!
            updateScoreLabel()
            
            //adjust the core data score
            reconcileScoreFromPurchase(purchasePrice: character.price!)
            
            //remove from the store
            //collectionViewData.remove(at: indexPath.row)
            //don't remove, instead shade it differently
            
            collectionView.reloadData()

            print("Character \(String(describing: newCharacter!.name)) has been unlocked!")
        }
        
    
    }
    
    /******************************************************/
    /*******************///MARK: Buttons
    /******************************************************/


    /******************************************************/
    /*******************///MARK: Core Data
    /******************************************************/
    /**
     get the current score, if there is not a score record, make one at 0
     */
    func getCurrentScore() -> Int {
        guard let fc = frcDict[keyCurrentScore] else {
            return -1
            
        }
        
        guard let currentScores = fc.fetchedObjects as? [CurrentScore] else {
            
            return -1
        }
        
        if (currentScores.count) == 0 {
            
            print("No CurrentScore exists.  Creating.")
            let newScore = CurrentScore(entity: NSEntityDescription.entity(forEntityName: "CurrentScore", in: stack.context)!, insertInto: fc.managedObjectContext)
            
            return Int(newScore.value)
        } else {
            
            //print(currentScores[0].value)
            let score = Int(currentScores[0].value)
            
            //if didn't find at end of loop, must not be an entry, so level 0
            return score
        }
        
        
    }
    
    ///Takes the given price and modifies the player's current score in core data to reflect the spending of the points
    func reconcileScoreFromPurchase(purchasePrice: Int) {
        let currentScore = getCurrentScore()
        
        let penalty = purchasePrice
        var newScore = currentScore - penalty
        
        if newScore < 0 {
            newScore = 0
        }
        if !(newScore == 0 && currentScore == 0) {
            _ = setCurrentScore(newScore: newScore)
        }
        
    }
    
    /// sets the current score, returns the newly set score
    func setCurrentScore(newScore: Int) -> Int {
        guard let fc = frcDict[keyCurrentScore] else {
            return -1
            
        }
        
        guard let currentScores = fc.fetchedObjects as? [CurrentScore] else {
            return -1
        }
        
        if (currentScores.count) == 0  {
            print("No CurrentScore exists.  Creating.")
            let currentScore = CurrentScore(entity: NSEntityDescription.entity(forEntityName: "CurrentScore", in: stack.context)!, insertInto: fc.managedObjectContext)
            currentScore.value = Int64(newScore)
            
            return Int(currentScore.value)
        } else {
            
            switch newScore {
            //TODO: if the score is already 0 don't set it again.
            case let x where x < 0:
                currentScores[0].value = Int64(0)
                return Int(currentScores[0].value)
            default:
                //set score for the first element
                currentScores[0].value = Int64(newScore)
                //print("There are \(currentScores.count) score entries in the database.")
                return Int(currentScores[0].value)
            }
            
            
        }
        
    }
    

    
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
            //print ("You cannot afford this item")
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
                if character.name == featureId{
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
            
//            guard let fc = frcDict[keyUnlockedCharacter] else {
//                fatalError("Can't find a fc with the key named \(keyUnlockedCharacter)")
//            }
//            
//            guard (fc.fetchedObjects as? [UnlockedCharacter]) != nil else {
//                
//                fatalError("fc.fetchedObjects array didn't return an array of UnlockedCharacter.")
//            }
            
            if isUnlocked {
                //it is already unlocked, so return nil
                return nil
            } else {
                //it is not unlocked, so unlock it and return the character
//                let newCharacter = UnlockedCharacter(entity: NSEntityDescription.entity(forEntityName: "UnlockedCharacter", in: stack.context)!, insertInto: fc.managedObjectContext)
                let newCharacter = UnlockedCharacter(name: characterName, expiresHours: 3, context: stack.context)
                //newCharacter.name = characterName
                print("Unlocked a new character named \(String(describing: newCharacter.name))")
                return newCharacter
                
            }
        }
        
        //got an error when checking for the feature, return nil
        return nil
        
        
    }
    
    ///locks all characters that are unlockable and have exceeded the expiration date
    func lockAllExpiredCharacters() {
        let expiredCharacters = getExpiredCharacters()
        
        for character in expiredCharacters {
            lockCharacter(unlockedCharacter: character)
        }
    }
    
    ///returns an array of all characters that are expired
    func getExpiredCharacters() -> [UnlockedCharacter] {
        
        let unlockedCharacters = getAllUnlockedCharacters()
        var expiredCharacters = [UnlockedCharacter]()
        
        for character in unlockedCharacters {
            //check each character's date.  If it is in the past, add it to the array of expired characters
            let now = Date()
            let expiryDate = character.datetimeExpires as Date
            
            if expiryDate < now {
                expiredCharacters.append(character)
            }
        }
        print("\(expiredCharacters.count) characters have expired")
        return expiredCharacters
    }
    
    func getAllUnlockedCharacters() -> [UnlockedCharacter] {
        guard let fc = frcDict[keyUnlockedCharacter] else {
            fatalError("Can't find a fc with the key named \(keyUnlockedCharacter)")
        }
        
        guard (fc.fetchedObjects as? [UnlockedCharacter]) != nil else {
            
            fatalError("fc.fetchedObjects array didn't return an array of UnlockedCharacter.")
        }
        
        let unlockedCharacters = fc.fetchedObjects as! [UnlockedCharacter]
        
        return unlockedCharacters
    }
    
    
    //locks character by deleting the entity in the unlocked characters model
    func lockCharacter(unlockedCharacter: UnlockedCharacter) {
        
        //check to see if this character is unlocked
        if let isUnlocked = try? checkForUnlockFeature(featureKey: keyUnlockedCharacter, featureId: unlockedCharacter.name) {
  
            if isUnlocked {
                //it is unlocked, so lock it by deleting
                let characterToDelete = getUnlockedCharacter(named: unlockedCharacter.name)
                
                if characterToDelete != nil {
                    // Get the stack
                    let delegate = UIApplication.shared.delegate as! AppDelegate
                    self.stack = delegate.stack
                    
                    if let context = self.frcDict[keyUnlockedCharacter]?.managedObjectContext {
                        
                        context.delete(characterToDelete!)
                        //self.stack.save()
                        
                    }
                }
                
            }
        }
        
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
    
    ///returns array of all valid characters that are not unlocked
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
    
    
    ///determines the number of hours until the character expires and the number of total hours the character is scheduled to be unlocked.  returns nil both value if the character is not unlocked (hoursUntilExpiry, minutesUntilExpiry, totalHours)
    func getHoursOfExpiry(forCharacter unlockedCharater: UnlockedCharacter) -> (Int?, Int?, Int?) {
        
        //validate the character is unlocked
        let isUnlocked = try! checkForUnlockFeature(featureKey: keyUnlockedCharacter, featureId: unlockedCharater.name)
        
        if isUnlocked {
            let startDate = unlockedCharater.datetimeUnlocked as Date
            let endDate = unlockedCharater.datetimeExpires as Date
            let now = Date()
            
            let totalHours = endDate.hours(from: startDate)
            let hoursUntilExpiry = endDate.hours(from: now) + 1
            let minutesUntilExpiry = endDate.minutes(from: now) + 1  //add one to include the present minute
            
            //let percentOfPieToFill = Float(hoursUntilExpiry) / Float(totalHours)
            return (hoursUntilExpiry, minutesUntilExpiry, totalHours )
            
        } else {
            return (nil, nil, nil)
        }
    }
    
    
    
}
