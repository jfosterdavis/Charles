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

class StoreCollectionViewController: CoreDataCollectionViewController, UICollectionViewDataSource, UIGestureRecognizerDelegate {

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
    
    //collection view sections
    var charactersSection:Int = -1
    var toolsSection:Int = -1
    var iapsSection:Int = -1
    
    
    
    
    /******************************************************/
    /*******************///MARK: Perk Store and IAP properties
    /******************************************************/
    
    var perkCollectionViewData: [Perk]!
    //var inAppPurchasesData: []!
    var appStoreProductsRequest: SKProductsRequest?
    var appStoreProducts: [SKProduct]!
    
    var pendingTransactions = [SKPaymentTransaction]()
    
    //CoreData FRC Keys
    let keyUnlockedPerk = "keyUnlockedPerk"
    
    let enforcePerkLevel = true //helpful when testing.  When only perks with a level at or below the user current level are displayed in store.
    let enforceCharacterLevel = true
    
    /******************************************************/
    /*******************///MARK: Standard UIView Functions
    /******************************************************/

    
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
        
        //register the long press
        let lpgr = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        lpgr.minimumPressDuration = 0.5
        lpgr.delaysTouchesBegan = false
        lpgr.delegate = self
        self.collectionView.addGestureRecognizer(lpgr)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //get notified for queue events
        SKPaymentQueue.default().add(self)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //updateTimer()
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        //stop the timer to avoide stacking penalties
        timer.invalidate()
        
        //remove the reference to this StoreKit Request delegate since it is disappearing
        //got this tip from https://stackoverflow.com/questions/24675528/ios-crash-report-skproductsrequest
        if let aspRequest = self.appStoreProductsRequest {
            aspRequest.delegate = nil
            aspRequest.cancel()
            self.appStoreProductsRequest = nil
        }
        
        //remove self as notified of payment queue
        SKPaymentQueue.default().remove(self)
    }
    
    /******************************************************/
    /*******************///MARK: CollectionView Functions that can't be in extensions
    /******************************************************/
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)  {
        
        
        //check if this is a perk or an inAppPurchase
        //store contains perk objects and products from app store
        let characterItems: [Any] = self.collectionViewData as [Any]
        let perkItems: [Any] = self.perkCollectionViewData as [Any]
        let appStoreItems: [Any] = self.appStoreProducts as [Any]
        //let allItemsInStore: [Any] = perkItems + appStoreItems
        
        let section = indexPath.section
        
        //now check the item to see if we have a perk or an app store item
        switch section {
            
        case charactersSection: //Character
            let character = characterItems[indexPath.row] as! Character
            
            guard isCharacterAffordable(character: character) else {
                print ("You cannot afford this item")
                return
            }
            
            guard isPlayerLevelRequirementMet(character: character) else {
                print ("You must be a certain level to hire this character. \(String(describing: character.levelEligibleAt))")
                return
            }
            
            let newCharacter = unlockCharacter(named: character.name)
            
            if newCharacter != nil {
                //deduct the price
                score = score - character.price
                updateScoreLabel()
                
                //adjust the core data score
                reconcileScoreFromPurchase(purchasePrice: character.price)
                
                //remove from the store
                //collectionViewData.remove(at: indexPath.row)
                //don't remove, instead shade it differently
                
                //collectionView.reloadData()
                
                print("Character \(String(describing: newCharacter!.name)) has been unlocked!")
            }
            
        case toolsSection: //Perk
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
                score = score - perk.price
                updateScoreLabel()
                
                //adjust the core data score
                reconcileScoreFromPurchase(purchasePrice: perk.price)
                
                //collectionView.reloadData()
                self.collectionView.collectionViewLayout.invalidateLayout()
                
                print("Perk \(String(describing: newPerk!.name)) has been unlocked!")
            }
        case iapsSection:  //SKProduct
            let currentItem = appStoreItems[indexPath.row]
            
            //start the buying process from the app store.
            let product = currentItem as! SKProduct
            
            requestPayment(for:product)
            
        default:
            //some other type of item has been shown, throw error
            fatalError("Found unexpected section in Perk store: \(section)")
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500), execute: {
            self.collectionView.reloadItems(at: [indexPath])
        })
        
    }
    
    
    /******************************************************/
    /*******************///MARK: Buttons
    /******************************************************/

    
    @IBAction func dismissButtonPressed(_ sender: Any) {
        let pVC = self.parentVC
        pVC?.storeClosed()
        self.dismiss(animated: true, completion: nil)
    }
    
    
    /******************************************************/
    /*******************///MARK: Timer
    /******************************************************/

    @objc func updateTimer() {
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
    
    /******************************************************/
    /*******************///MARK: Long press gesture
    /******************************************************/

    
    @objc func handleLongPress(gesture : UILongPressGestureRecognizer!) {
        print("Recieved a long press")
        
        if gesture.state != .began {
            return
        }
        let p = gesture.location(in: self.collectionView)
        
        if let indexPath = self.collectionView.indexPathForItem(at: p) {
            // get the cell at indexPath (the one you long pressed)
            let cell = self.collectionView.cellForItem(at: indexPath) as! CommonStoreCollectionViewCell
            
            cell.showInfo()
            
        } else {
            print("couldn't find index path")
        }
    }
}
