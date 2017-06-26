//
//  StoreCollectionViewController+DataSourceAndDelegate.swift
//  Charles
//
//  Created by Jacob Foster Davis on 6/25/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation
import UIKit
import StoreKit

extension StoreCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    /******************************************************/
    /*******************///MARK: UICollectionViewDataSource
    /******************************************************/
    
    /*******************///MARK: Sections
    //headers and footers
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
            
        case "UICollectionElementKindSectionHeader":
            
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "storeSectionHeader", for: indexPath) as! SectionHeaderCollectionReusableView
            
            let section = indexPath.section
            
            switch section {
            case 0:
                headerView.headerTitleLabel.text = "Companions"
            case 1:
                headerView.headerTitleLabel.text = "Tools"
            case 2:
                headerView.headerTitleLabel.text = "In-App Purchases"
            default:
                headerView.headerTitleLabel.text = "Unknown Section"
            }
            
            return headerView
            
        default:
            assert(false, "Unexpected element kind")
        }
    }
    
    //sections
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        //if there are inapp purchases to be displayed, return 2
        
        let iapCount = self.appStoreProducts.count
        
        if iapCount > 0 {
            return 3
        } else {
            return 2
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //returns number of items in the collection
        
        //perk section
        switch section{
        case 0:
            return collectionViewData.count
        case 1:
            return perkCollectionViewData.count
        case 2:
            return self.appStoreProducts.count
        default:
            assert(false, "Unexpected section.")
        }
    }
    
    /*******************///MARK: Cells
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //store contains perk objects and products from app store
        let characterItems: [Any] = self.collectionViewData as [Any]
        let perkItems: [Any] = self.perkCollectionViewData as [Any]
        let appStoreItems: [Any] = self.appStoreProducts as [Any]
        //let allItemsInStore: [Any] = perkItems + appStoreItems
        
        let section = indexPath.section
        
        //now check the item to see if we have a perk or an app store item
        switch section {
        case 0: //Characters
            //        switch segmentedControl.selectedSegmentIndex {
            //        case 0:
            //TODO: replace as! UITAbleViewCell witha  custom cell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "characterCell", for: indexPath as IndexPath) as! CustomStoreCollectionViewCell
            let character = characterItems[indexPath.row] as! Character
            
            cell.characterNameLabel.text = character.name
            let price = character.price
            var priceLabelText = ""
            if price! <= 0 {
                priceLabelText = "Free!"
            } else {
                priceLabelText = String(describing: price!.formattedWithSeparator)
            }
            
            cell.priceLabel.text = priceLabelText
            
            
            cell.loadAppearance(from: character.phrases![0])
            
            
            
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
                            print("Expiry in \(minutesUntilExpiry) for \(character.name) in minutes.  Percentage left is \(percentOfPieToFill)")
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
                
                
            } else if !isPlayerLevelRequirementMet(character: character){
                cell.setStatusLevelRequirementNotMet(levelRequired: character.levelEligibleAt)
            } else if !isCharacterAffordable(character: character) {  //check if it is affordable
                cell.setStatusUnaffordable()
            } else {  //the character is not unlocked and is affordable
                cell.setStatusAffordable()
            }
            
            return cell
            
        case 1: //Perks
            let currentItem = perkItems[indexPath.row]
            
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "perkCell", for: indexPath as IndexPath) as! CustomPerkStoreCollectionViewCell
            
            let perk = currentItem as! Perk
            
            cell.characterNameLabel.text = perk.name
            let price = perk.price
            var priceLabelText = ""
            if price! <= 0 {
                priceLabelText = "Free!"
            } else {
                priceLabelText = String(describing: price!.formattedWithSeparator)
            }
            
            cell.priceLabel.text = priceLabelText
            
            
            cell.loadAppearance(fromPerk: perk)
            
            //check if this perk requires a party member
            if perk.requiredPartyMembers.isEmpty {
                cell.setGotPerkFromCharacterIndicator(visible: false)
            } else {
                cell.setGotPerkFromCharacterIndicator(visible: true)
            }
            
            
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
                
                
            } else if !isPerkRequiredCharacterPresent(perk: perk) {
                //they are missing a party member to unlock this perk
                cell.setStatusRequiredCharacterNotPresent()
            } else if !isPerkAffordable(perk: perk) {  //check if it is affordable
                cell.setStatusUnaffordable()
            } else {  //the character is not unlocked and is affordable
                cell.setStatusAffordable()
            }
            
            self.collectionView.collectionViewLayout.invalidateLayout()
            //self.collectionView?.reloadItems(at: [indexPath])
            cell.layoutIfNeeded()
            
            return cell
            
            //END OF CASE AS PERK
            
            
        case 2:  //section 1 should be SKProduct type
            
            let currentItem = appStoreItems[indexPath.row]
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IAPCell", for: indexPath as IndexPath) as! InAppPurchaseCollectionViewCell
            
            let product = currentItem as! SKProduct
            //display as an app store product
            cell.characterNameLabel.text = product.localizedTitle
            
            cell.priceLabel.text = priceStringForProduct(item: product) //localized price string
            
            //get the ASPD (AppStoreProductDetail object) which contains information about the purchase in the bundle
            let delegate = UIApplication.shared.delegate as! AppDelegate
            let aspd = delegate.getAppStoreProductDetail(fromProductID: product.productIdentifier)
            
            //determine if this cell has a pending transaction, and flag appropriately
            var foundApplicableTransaction = false
            for transaction in pendingTransactions {
                if transaction.payment.productIdentifier == aspd.productID {
                    foundApplicableTransaction = true
                }
            }
            
            if foundApplicableTransaction {
                cell.transactionPending = true
            } else {
                cell.transactionPending = false
            }
            
            cell.loadAppearance(fromAppStoreProduct: product, fromASPD: aspd)
            
            //check if this perk requires a party member
            if aspd.requiredPartyMembers.isEmpty {
                cell.setGotPerkFromCharacterIndicator(visible: false)
            } else {
                cell.setGotPerkFromCharacterIndicator(visible: true)
            }
            
            self.collectionView.collectionViewLayout.invalidateLayout()
            //self.collectionView?.reloadItems(at: [indexPath])
            cell.layoutIfNeeded()
            
            return cell
            
        default:
            //some other type of item has been shown, throw error
            fatalError("Found unexpected section in Perk store: \(section)")
        }
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
    /*******************///MARK: Flow Layout
    /******************************************************/
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let section = indexPath.section
        
        switch section {
        case 0: //Characters
            let width = storeCollectionView.bounds.size.width / 2 - 5
            let height = width * 180 / 135
            return CGSize(width: CGFloat(width), height: CGFloat(height))
        default:
            let width = storeCollectionView.bounds.size.width / 2 - 5
            let height = width
            return CGSize(width: CGFloat(width), height: CGFloat(height))
        }
    }
}