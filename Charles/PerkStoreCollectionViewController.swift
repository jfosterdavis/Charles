//
//  PerkStoreCollectionViewController.swift
//  Charles
//
//  Created by Jacob Foster Davis on 5/29/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class PerkStoreCollectionViewController: StoreCollectionViewController {
    
    var perkCollectionViewData: [Perk]!
    
    //CoreData FRC Keys
    let keyUnlockedPerk = "keyUnlockedPerk"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //setup CoreData
        _ = setupFetchedResultsController(frcKey: keyUnlockedPerk, entityName: "UnlockedPerk", sortDescriptors: [],  predicate: nil)
        
        //initialize data for the collectionView
        perkCollectionViewData = getAllPerksDisplayableInStore()
        
        //lock all expired characters
        lockAllExpiredPerks()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        
    }
    
    @IBAction override func dismissButtonPressed(_ sender: Any) {
        let pVC = self.parentVC as! DataViewController
        pVC.storeClosed()
        self.dismiss(animated: true, completion: nil)
    }
    
    /******************************************************/
    /*******************///MARK: UICollectionViewDataSource
    /******************************************************/
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //returns number of items in the collection
        return perkCollectionViewData.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "perkCell", for: indexPath as IndexPath) as! CustomPerkStoreCollectionViewCell
        let perk = self.perkCollectionViewData[indexPath.row]
        
        cell.characterNameLabel.text = perk.name
        let price = perk.price
        var priceLabelText = ""
        if price! <= 0 {
            priceLabelText = "Free!"
        } else {
            priceLabelText = String(describing: price!)
        }
        
        cell.priceLabel.text = priceLabelText
        
        
        cell.loadAppearance(fromPerk: perk)
        
        
        //set the status of this perk.  Is it unlocked or affordable?
        
        //start the progress pie as hidden
        let expiryPie = cell.expirationStatusView as! PieTimerView
        expiryPie.isHidden = true
        cell.pieLockImageView.isHidden = true
        
        //if it is unlocked
        if try! checkForUnlockFeature(featureKey: keyUnlockedPerk, featureId: perk.name) {
            //it is unlocked, so set the status to unlocked
            cell.setStatusUnlocked()
            
            //if this character is unlockable and if we can get it
            if let unlockedPerk = getUnlockedPerk(named: perk.name) {
                
                //calculate number of hours remaining and number of hours total
                let hours = getHoursOfExpiry(forPerk: unlockedPerk)
                
                if let hoursUntilExpiry = hours.0, let totalHoursUnlocked = hours.2, let minutesUntilExpiry = hours.1 {
                    //if there is only one hour left, show red in minutes
                    if hoursUntilExpiry <= 1 {
                        
                        let percentOfPieToFill = Float(minutesUntilExpiry) / 60 * 100.0
                        print("Expiry in \(minutesUntilExpiry) for \(perk.name) in minutes.  Percentage left is \(percentOfPieToFill)")
                        //less than one minute, set color to red
                        expiryPie.setProgressColor(color: UIColor.red)
                        
                        //since it is unlocked, show the expiration status so the user will know if it is close to expiry
                        expiryPie.setProgress(percent: percentOfPieToFill)
                        
                    } else {
                        
                        let percentOfPieToFill = Float(hoursUntilExpiry) / Float(totalHoursUnlocked) * 100.0
                        
                        //set the progress color to blue
                        expiryPie.setProgressColor(color: UIColor(red: 0/255, green: 128/255, blue: 255/255, alpha: 1))
                        
                        //since it is unlocked, show the expiration status so the user will know if it is close to expiry
                        expiryPie.setProgress(percent: percentOfPieToFill)
                        
                        
                    }
                    //able to populate the pie, so show it
                    expiryPie.isHidden = false
                    cell.pieLockImageView.isHidden = false
                }
                
            }
            
            
        } else if !isPerkAffordable(perk: perk) {  //check if it is affordable
            cell.setStatusUnaffordable()
        } else {  //the character is not unlocked and is affordable
            cell.setStatusAffordable()
        }
        
        
        
        
        return cell
    }
    
    /******************************************************/
    /*******************///MARK: Timer
    /******************************************************/
    
    override func updateTimer() {
        //check that none of them have expired since this view has been open:
        lockAllExpiredPerks()
        
        collectionView.reloadData()
    }
    
    /******************************************************/
    /*******************///MARK: UIcollectionViewDelegate
    /******************************************************/
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)  {
        
        let perk = self.perkCollectionViewData[indexPath.row]
        
        guard isPerkAffordable(perk: perk) else {
            print ("You cannot afford this item")
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
            
            print("Perk \(String(describing: newPerk!.name)) has been unlocked!")
        }
        
        
    }
    
    ///Checks the given CoreData set for the given FRCKey, for the given id of the feature to see if that feature is unlocked in the store or not.
    override func checkForUnlockFeature(featureKey: String, featureId: String) throws -> Bool {
        guard let fc = frcDict[featureKey] else {
            fatalError("Can't find a fc with the key named \(featureKey)")
        }
        
        switch featureKey {
        
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
    /*******************///MARK: NEED THIS OVERRIDE
    /******************************************************/

    func isPerkAffordable(perk: Perk) -> Bool {
        
        let price = perk.price!
        
        if price > score {
            //print ("You cannot afford this item")
            return false
        } else {
            return true
        }
    }
    
    
    /**
     unlocks the given character and either returns that UnlockedCharacter object or returns nil if the character is already unlocked
     */
    /******************************************************/
    /*******************///MARK: NEED THIS OVERRIDE
    /******************************************************/

    func unlockPerk(named perkName: String) -> UnlockedPerk? {
        //check to see if the character is already unlocked
        
        if let isUnlocked = try? checkForUnlockFeature(featureKey: keyUnlockedPerk, featureId: perkName) {
            
            if isUnlocked {
                //it is already unlocked, so return nil
                return nil
            } else {
                //it is not unlocked, so unlock it and return the character
                
                let newPerk = UnlockedPerk(name: perkName, expiresHours: 3, context: stack.context)
                
                print("Unlocked a new Perk named \(String(describing: newPerk.name))")
                return newPerk
                
            }
        }
        
        //got an error when checking for the feature, return nil
        return nil
        
        
    }
    
    ///locks all characters that are unlockable and have exceeded the expiration date.
    /******************************************************/
    /*******************///MARK: NEED THIS OVERRIDE
    /******************************************************/

    func lockAllExpiredPerks() {
        let expiredPerks = getExpiredPerks()
        
        for perk in expiredPerks {
            lockPerk(unlockedPerk: perk)
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
        
        return Perks.ValidPerks
        
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
