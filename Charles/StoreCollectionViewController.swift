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
    /*******************///MARK: UIcollectionViewDelegate
    /******************************************************/
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)  {
    
        
        //check if this is a perk or an inAppPurchase
        //store contains perk objects and products from app store
        let characterItems: [Any] = self.collectionViewData as [Any]
        let perkItems: [Any] = self.perkCollectionViewData as [Any]
        let appStoreItems: [Any] = self.appStoreProducts as [Any]
        let allItemsInStore: [Any] = perkItems + appStoreItems
        
        let section = indexPath.section
        
        //now check the item to see if we have a perk or an app store item
        switch section {
            
        case 0: //Character
            let character = characterItems[indexPath.row] as! Character
            
            guard isCharacterAffordable(character: character) else {
                print ("You cannot afford this item")
                return
            }
            
            guard isPlayerLevelRequirementMet(character: character) else {
                print ("You must be a certain level to hire this character. \(character.levelEligibleAt)")
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

        case 1: //Perk
            let currentItem = perkItems[indexPath.row]
            
            let perk = currentItem as! Perk
            
            guard isPerkAffordable(perk: perk) else {
                print ("You cannot afford this item")
                return
            }
            
            guard isPerkRequiredCharacterPresent(perk: perk) else {
                print ("You need a certain party member to unlock this. \(perk.requiredPartyMembers)")
                return
            }
            
            let newPerk = unlockPerk(named: perk.name)
            
            if newPerk != nil {
                //deduct the price
                score = score - perk.price!
                updateScoreLabel()
                
                //adjust the core data score
                reconcileScoreFromPurchase(purchasePrice: perk.price!)
                
                collectionView.reloadData()
                self.collectionView.collectionViewLayout.invalidateLayout()
                
                print("Perk \(String(describing: newPerk!.name)) has been unlocked!")
            }
        case 2:  //SKProduct
            let currentItem = appStoreItems[indexPath.row]
            
            //start the buying process from the app store.
            let product = currentItem as! SKProduct
            
            requestPayment(for:product)
            
        default:
            //some other type of item has been shown, throw error
            fatalError("Found unexpected section in Perk store: \(section)")
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
    
    func isPerkAffordable(perk: Perk) -> Bool {
        
        let price = perk.price!
        
        if price > score {
            //print ("You cannot afford this item")
            return false
        } else {
            return true
        }
    }
    
    func isPerkRequiredCharacterPresent(perk: Perk) -> Bool {
        
        if perk.requiredPartyMembers.isEmpty {
            return true
        } else {
            //ask the store if they are unlocked
            let store = self.storyboard!.instantiateViewController(withIdentifier: "Store") as! StoreCollectionViewController
            let unlockedCharacters = store.getAllUnlockedCharacters()
            
            for unlockedCharacter in unlockedCharacters {
                //check for any of the required party members
                for perkPartyMember in perk.requiredPartyMembers {
                    if unlockedCharacter.name == perkPartyMember.name {
                        return true
                    }
                }
            }
            //nobody required was found
            return false
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
    
    func unlockPerk(named perkName: String) -> UnlockedPerk? {
        //check to see if the character is already unlocked
        
        if let isUnlocked = try? checkForUnlockFeature(featureKey: keyUnlockedPerk, featureId: perkName) {
            
            if isUnlocked {
                //it is already unlocked, so return nil
                return nil
            } else {
                //it is not unlocked, so unlock it and return the character
                //get the actual perk object to find amount of time to unlock
                var thePerk: Perk? = nil
                for perk in Perks.UnlockablePerks {
                    if perk.name == perkName {
                        thePerk = perk
                    }
                }
                
                var minutesToUnlock = 30
                if let thePerk = thePerk {
                    minutesToUnlock = thePerk.minutesUnlocked
                }
                
                // Get the stack
                let delegate = UIApplication.shared.delegate as! AppDelegate
                self.stack = delegate.stack
                
                let newPerk = UnlockedPerk(name: perkName, expiresMinutes: minutesToUnlock, context: stack.context)
                
                print("Unlocked a new Perk named \(String(describing: newPerk.name))")
                return newPerk
                
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
    
    /******************************************************/
    /*******************///MARK: Perks
    /******************************************************/

    func lockAllExpiredPerks() {
        let expiredPerks = getExpiredPerks()
        
        /******************************************************/
        /*******************///MARK: PERK INVESTMENT
        /******************************************************/
        //if the big payoff investment has expired, player will lose 50% of all money plus 5% for all active (and expiring) investment perks.  Then lock all perks.
        //let vC = self.storyboard!.instantiateViewController(withIdentifier: "DataViewController") as! DataViewController
        //add to the points earned
        let applicableInvestmentPerks = parentVC.getAllPerks(ofType: .investment, withStatus: .unlocked)
        
        if !applicableInvestmentPerks.isEmpty {
            //there are active investment perks
            var foundExpiringBigPayoff = false
            for (perk, unlockedPerk) in applicableInvestmentPerks {
                //check to see if the big payoff is among the expired perks
                if perk === Perks.Investment5 {  //the big payoff is Investment5
                    //the big payoff is active
                    
                    for expiredPerk in expiredPerks {
                        if expiredPerk === unlockedPerk {
                            ///the big payoff is one of the expired perks
                            print("The big payoff is expiring.")
                            foundExpiringBigPayoff = true
                        }
                    }
                }
            }
            
            if foundExpiringBigPayoff {
                parentVC.investmentCrash(activeInvestmentPerks: applicableInvestmentPerks)
            } else {
                //normal locking routine
                for perk in expiredPerks {
                    lockPerk(unlockedPerk: perk)
                }
            }
            /******************************************************/
            /*******************///MARK: END PERK INVESTMENT
            /******************************************************/
        } else {
            
            
            //normal locking routine
            for perk in expiredPerks {
                lockPerk(unlockedPerk: perk)
            }
        }
    }
    
    ///returns an array of all characters that are expired
    func getExpiredPerks() -> [UnlockedPerk] {
        
        let unlockedPerks = getAllUnlockedPerks()
        var expiredPerks = [UnlockedPerk]()
        
        for perk in unlockedPerks {
            //check each perk's date.  If it is in the past, add it to the array of expired characters
            let now = Date()
            let expiryDate = perk.datetimeExpires as Date
            
            if expiryDate < now {
                expiredPerks.append(perk)
            }
        }
        print("\(expiredPerks.count) perks have expired")
        return expiredPerks
    }
    
    func getAllUnlockedPerks() -> [UnlockedPerk] {
        
        var fc = frcDict[keyUnlockedPerk]
        
        if fc == nil {
            //try to load it again since this can be called by outside
            _ = setupFetchedResultsController(frcKey: keyUnlockedPerk, entityName: "UnlockedPerk", sortDescriptors: [],  predicate: nil)
            
            fc = frcDict[keyUnlockedPerk]
            
            //but if still not loaded
            guard fc != nil else {
                fatalError("Can't find a fc with the key named \(keyUnlockedPerk)")
            }
            
        }
        
        guard (fc!.fetchedObjects as? [UnlockedPerk]) != nil else {
            
            fatalError("fc.fetchedObjects array didn't return an array of UnlockedPerk.")
        }
        
        let unlockedPerks = fc!.fetchedObjects as! [UnlockedPerk]
        
        return unlockedPerks
    }
    
    
    
    
    
    //TODO: Go through all these functions and make them handle all types instead of repeatig them
    //locks character by deleting the entity in the unlocked characters model
    func lockPerk(unlockedPerk: UnlockedPerk) {
        
        //check to see if this character is unlocked
        if let isUnlocked = try? checkForUnlockFeature(featureKey: keyUnlockedPerk, featureId: unlockedPerk.name) {
            
            if isUnlocked {
                //it is unlocked, so lock it by deleting
                let perkToDelete = getUnlockedPerk(named: unlockedPerk.name)
                
                if perkToDelete != nil {
                    // Get the stack
                    let delegate = UIApplication.shared.delegate as! AppDelegate
                    self.stack = delegate.stack
                    
                    if let context = self.frcDict[keyUnlockedPerk]?.managedObjectContext {
                        
                        context.delete(perkToDelete!)
                        
                    }
                }
                
            }
        }
        
    }
    
    /**
     returns the UnlockedCharacter object from the CoreData.  Perhaps to be deleted (thereby removing it).
     */
    
    /******************************************************/
    /*******************///MARK: NEED THIS OVERRIDE
    /******************************************************/
    
    //TODO: Change all of this returning a string crap into passing actual objects
    func getUnlockedPerk(named perkName:String) -> UnlockedPerk? {
        
        let perkExists = try? checkForUnlockFeature(featureKey: keyUnlockedPerk, featureId: perkName)
        
        if perkExists == false || perkExists == nil {
            return nil
        } else {
            //the perk does exist, so get and return the UnlockedPerk
            guard let fc = frcDict[keyUnlockedPerk] else {
                fatalError("Can't find a fc with the key named \(keyUnlockedPerk)")
            }
            
            guard let perks = fc.fetchedObjects as? [UnlockedPerk] else {
                
                fatalError("fc.fetchedObjects array didn't return an array of UnlockedPerk.")
            }
            
            for perk in perks {
                if perk.name == perkName {
                    return perk
                }
            }
            
            //no perk found
            return nil
        }
    }
    
    ///returns array of all valid characters that are not unlocked
    func getAllLockedPerks() -> [Perk] {
        
        let unlockablePerks = Perks.UnlockablePerks
        var allLockedPerks: [Perk] = []
        
        //add the perk that have not been unlocked
        for perk in unlockablePerks {
            //if the perk is already unlocked, remove from the array
            
            let isUnlocked = try! checkForUnlockFeature(featureKey: keyUnlockedPerk, featureId: perk.name)
            
            if !isUnlocked {
                allLockedPerks.append(perk)
            }
        }
        
        return allLockedPerks
        
    }
    
    
    /******************************************************/
    /*******************///MARK: NEED THIS OVERRIDE
    /******************************************************/
    
    func getAllPerksDisplayableInStore() -> [Perk] {
        
        //only show perks avialable based on the user's current level
        if enforcePerkLevel {
            var applicablePerks = [Perk]()
            
            let userLevel = parentVC.getUserCurrentLevel()
            
            for perk in Perks.ValidPerks {
                //only perks with a level to be enforced are non-optional
                if let perkLevel = perk.levelEligibleAt {
                    if perkLevel <= userLevel.level {
                        applicablePerks.append(perk)
                    }
                } else { //no enforcement neccessary, add to store
                    applicablePerks.append(perk)
                }
            }
            return applicablePerks
        } else {
            return Perks.ValidPerks
        }
    }
    
    
    //TODO: consolidate this function with parent
    ///determines the number of hours until the character expires and the number of total hours the character is scheduled to be unlocked.  returns nil both value if the character is not unlocked (hoursUntilExpiry, minutesUntilExpiry, totalHours)
    func getHoursOfExpiry(forPerk unlockedPerk: UnlockedPerk) -> (Int?, Int?, Int?) {
        
        //validate the character is unlocked
        let isUnlocked = try! checkForUnlockFeature(featureKey: keyUnlockedPerk, featureId: unlockedPerk.name)
        
        if isUnlocked {
            let startDate = unlockedPerk.datetimeUnlocked as Date
            let endDate = unlockedPerk.datetimeExpires as Date
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
