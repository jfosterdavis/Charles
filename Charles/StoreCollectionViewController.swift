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
import StoreKit

class StoreCollectionViewController: CoreDataCollectionViewController, UICollectionViewDataSource {

    var parentVC: DataViewController!
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
    
    
    /******************************************************/
    /*******************///MARK: Perk Store and IAP properties
    /******************************************************/
    
    var perkCollectionViewData: [Perk]!
    //var inAppPurchasesData: []!
    var appStoreProductsRequest: SKProductsRequest!
    var appStoreProducts: [SKProduct]!
    
    var pendingTransactions = [SKPaymentTransaction]()
    
    //CoreData FRC Keys
    let keyUnlockedPerk = "keyUnlockedPerk"
    
    let enforcePerkLevel = true //helpful when testing.  When only perks with a level at or below the user current level are displayed in store.

    
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
        
        //Perk store and IAP
        self.appStoreProducts = [SKProduct]()
        
        //TODO: Check to see if user can buy things in app store.  if so, do load the products
        if SKPaymentQueue.canMakePayments() {
            displayInAppStoreProducts()
        } else {
            print("IAPs not enabled")
        }
        
        
        //setup CoreData
        _ = setupFetchedResultsController(frcKey: keyUnlockedPerk, entityName: "UnlockedPerk", sortDescriptors: [],  predicate: nil)
        
        //initialize data for the collectionView
        perkCollectionViewData = getAllPerksDisplayableInStore()
        
        //lock all expired characters
        lockAllExpiredPerks()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //get notified for queue events
        SKPaymentQueue.default().add(self)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateTimer()
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        //stop the timer to avoide stacking penalties
        timer.invalidate()
        
        //remove self as notified of payment queue
        SKPaymentQueue.default().remove(self)
    }
    
    @IBAction func dismissButtonPressed(_ sender: Any) {
        let pVC = self.parentVC
        pVC?.storeClosed()
        self.dismiss(animated: true, completion: nil)
    }
    
    
    /******************************************************/
    /*******************///MARK: Timer
    /******************************************************/

    func updateTimer() {
        //check that none of them have expired since this view has been open:
        lockAllExpiredCharacters()
        
        lockAllExpiredPerks()
        
        collectionView.reloadData()
        self.collectionView.collectionViewLayout.invalidateLayout()
    }
    
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
            stack.save()
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
            fatalError("Can't get the frcDict \(keyCurrentScore)")
            
        }
        
        guard let currentScores = fc.fetchedObjects as? [CurrentScore] else {
            fatalError("nil in the current score!")
        }
        
        if (currentScores.count) == 0  {
            print("No CurrentScore exists.  Creating.")
            let currentScore = CurrentScore(entity: NSEntityDescription.entity(forEntityName: "CurrentScore", in: stack.context)!, insertInto: fc.managedObjectContext)
            currentScore.value = Int64(newScore)
            stack.save()
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
        let scoreTemp = String(describing: score.formattedWithSeparator)
        
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
            
        case keyUnlockedPerk:
            
            //look for the given string in the name field
            guard let perks = fc.fetchedObjects as? [UnlockedPerk] else {
                fatalError("fc.fetchedObjects array didn't return an array of UnlockedPerks.")
            }
            
            //if the character name is found in the set of unlocked characgters, or if the character object is found in the set of characters that are always unlocked
            for perk in perks {
                if perk.name == featureId{
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
                //get the amount of time this character will be hired for.
                let character = Characters.UnlockableCharacters.filter { $0.name == characterName }[0]
                
                // Get the stack
                let delegate = UIApplication.shared.delegate as! AppDelegate
                self.stack = delegate.stack
                
                let newCharacter = UnlockedCharacter(name: characterName, expiresHours: character.hoursUnlocked, context: stack.context)
                //newCharacter.name = characterName
                print("Unlocked a new character named \(String(describing: newCharacter.name))")
                return newCharacter
                
            }
        }
        
        //got an error when checking for the feature, return nil
        return nil
        
        
    }
    
        
    ///locks all characters that are unlockable and have exceeded the expiration date.
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
        
        var fc = frcDict[keyUnlockedCharacter]
        
        if fc == nil {
            //try to load it again since this can be called by outside
            _ = setupFetchedResultsController(frcKey: keyUnlockedCharacter, entityName: "UnlockedCharacter", sortDescriptors: [],  predicate: nil)
            
            fc = frcDict[keyUnlockedCharacter]
            
            //but if still not loaded
            guard fc != nil else {
                fatalError("Can't find a fc with the key named \(keyUnlockedCharacter)")
            }
            
        }
        
        guard (fc!.fetchedObjects as? [UnlockedCharacter]) != nil else {
            
            fatalError("fc.fetchedObjects array didn't return an array of UnlockedCharacter.")
        }
        
        let unlockedCharacters = fc!.fetchedObjects as! [UnlockedCharacter]
        
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
    
    ///is the player a high enough level
    func isPlayerLevelRequirementMet(character: Character) -> Bool {
        //get player level
        //figure out what level the player is on
        let userXP = parentVC.calculateUserXP()
        let currentLevelAndProgress = Levels.getLevelAndProgress(from: userXP)
        let playerLevel = currentLevelAndProgress.0.level
            if playerLevel >= character.levelEligibleAt {
                return true
            } else {
                return false
            }
        
       
    }
    
        
}
