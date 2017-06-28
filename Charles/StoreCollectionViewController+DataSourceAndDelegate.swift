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
            case charactersSection:
                headerView.headerTitleLabel.text = "Companions"
            case toolsSection:
                headerView.headerTitleLabel.text = "Tools"
            case iapsSection:
                headerView.headerTitleLabel.text = "In-App Purchases"
            default:
                headerView.headerTitleLabel.text = "Unknown Section"
            }
            
            return headerView
            
        default:
            assert(false, "Unexpected element kind")
            return UICollectionReusableView()
        }
    }
    
    //sections
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        //if there are inapp purchases to be displayed, return 2
        
        let iapCount = self.appStoreProducts.count
        
        let toolsCount = perkCollectionViewData.count
        
        charactersSection = 0 //there will always be characters.
        var sectionCount = 1 //start with the characters section
        
        if toolsCount > 0 {
            toolsSection = sectionCount
            sectionCount += 1
            
        } else {
            toolsSection = -1
        }
        
        if iapCount > 0 {
            iapsSection = sectionCount
            sectionCount += 1
        } else {
            iapsSection = -1
        }
        
        return sectionCount
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //returns number of items in the collection
        
        //perk section
        switch section{
        case charactersSection:
            return collectionViewData.count
        case toolsSection:
            return perkCollectionViewData.count
        case iapsSection:
            return self.appStoreProducts.count
        default:
            assert(false, "Unexpected section.")
            return 0
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
        case charactersSection: //Characters
            //        switch segmentedControl.selectedSegmentIndex {
            //        case 0:
            //TODO: replace as! UITAbleViewCell witha  custom cell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "characterCell", for: indexPath as IndexPath) as! CustomStoreCollectionViewCell
            let character = characterItems[indexPath.row] as! Character
            
            cell.characterNameLabel.text = character.name
            let price = character.price
            var priceLabelText = ""
            if price <= 0 {
                priceLabelText = "Free!"
            } else {
                priceLabelText = String(describing: price.formattedWithSeparator)
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
            
        case toolsSection: //Perks
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
            
            
        case iapsSection:  //section 1 should be SKProduct type
            
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
    
    /******************************************************/
    /*******************///MARK: Flow Layout
    /******************************************************/
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let section = indexPath.section
        
        switch section {
        case charactersSection: //Characters
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
