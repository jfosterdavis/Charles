////
////  PerkStoreCollectionViewController.swift
////  Charles
////
////  Created by Jacob Foster Davis on 5/29/17.
////  Copyright © 2017 Zero Mu, LLC. All rights reserved.
////
//
//import Foundation
//import CoreData
//import UIKit
//import StoreKit
//
//class PerkStoreCollectionViewController: StoreCollectionViewController, SKProductsRequestDelegate, SKPaymentTransactionObserver {
//    
//
//    
//    var perkCollectionViewData: [Perk]!
//    //var inAppPurchasesData: []!
//    var appStoreProductsRequest: SKProductsRequest!
//    var appStoreProducts: [SKProduct]!
//    
//    var pendingTransactions = [SKPaymentTransaction]()
//    
//    //CoreData FRC Keys
//    let keyUnlockedPerk = "keyUnlockedPerk"
//    
//    let enforcePerkLevel = true //helpful when testing.  When only perks with a level at or below the user current level are displayed in store.
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        self.appStoreProducts = [SKProduct]()
//        
//        //TODO: Check to see if user can buy things in app store.  if so, do load the products
//        if SKPaymentQueue.canMakePayments() {
//            displayInAppStoreProducts()
//        } else {
//            print("IAPs not enabled")
//        }
//        
//        
//        //setup CoreData
//        _ = setupFetchedResultsController(frcKey: keyUnlockedPerk, entityName: "UnlockedPerk", sortDescriptors: [],  predicate: nil)
//        
//        //initialize data for the collectionView
//        perkCollectionViewData = getAllPerksDisplayableInStore()
//        
//        //lock all expired characters
//        lockAllExpiredPerks()
//    }
//    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        //get notified for queue events
//        SKPaymentQueue.default().add(self)
//        
//    }
//    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        updateTimer()
//        
//    }
//    
////    override func viewDidLayoutSubviews() {
////        super.viewDidLayoutSubviews()
////        
////        updateTimer()
////    }
//    
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//        SKPaymentQueue.default().remove(self)
//        
//    }
//    
//    @IBAction override func dismissButtonPressed(_ sender: Any) {
//        let pVC = self.parentVC
//        pVC?.storeClosed()
//        self.dismiss(animated: true, completion: nil)
//    }
//    
//    /******************************************************/
//    /*******************///MARK: UICollectionViewDataSource
//    /******************************************************/
//    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        
//        switch kind {
//            
//        case "UICollectionElementKindSectionHeader":
//            
//            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "storeSectionHeader", for: indexPath) as! SectionHeaderCollectionReusableView
//            
//            let section = indexPath.section
//            
//            switch section {
//            case 0:
//                headerView.headerTitleLabel.text = "Tools"
//            case 1:
//                headerView.headerTitleLabel.text = "In-App Purchases"
//            default:
//                headerView.headerTitleLabel.text = "Unknown Section"
//            }
//        
//            return headerView
//            
//        default:
//            assert(false, "Unexpected element kind")
//        }
//    }
//    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        //if there are inapp purchases to be displayed, return 2
//        
//        let iapCount = self.appStoreProducts.count
//        
//        if iapCount > 0 {
//            return 2
//        } else {
//            return 1
//        }
//    }
//    
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        //returns number of items in the collection
//        
//        //perk section
//        switch section{
//        case 0:
//            return perkCollectionViewData.count
//        case 1:
//            return self.appStoreProducts.count
//        default:
//            assert(false, "Unexpected section.")
//        }
//
//    }
//    
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        
//        //let cell: UICollectionViewCell
//        
//        //store contains perk objects and products from app store
//        let perkItems: [Any] = self.perkCollectionViewData as [Any]
//        let appStoreItems: [Any] = self.appStoreProducts as [Any]
//        let allItemsInStore: [Any] = perkItems + appStoreItems
//        
//        
//        
//        let section = indexPath.section
//        
//        //now check the item to see if we have a perk or an app store item
//        switch section {
//        case 0: //section 0 should be
//            let currentItem = perkItems[indexPath.row]
//            
//            
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "perkCell", for: indexPath as IndexPath) as! CustomPerkStoreCollectionViewCell
//            
//            let perk = currentItem as! Perk
//            
//            cell.characterNameLabel.text = perk.name
//            let price = perk.price
//            var priceLabelText = ""
//            if price! <= 0 {
//                priceLabelText = "Free!"
//            } else {
//                priceLabelText = String(describing: price!.formattedWithSeparator)
//            }
//            
//            cell.priceLabel.text = priceLabelText
//            
//            
//            cell.loadAppearance(fromPerk: perk)
//            
//            //check if this perk requires a party member
//            if perk.requiredPartyMembers.isEmpty {
//                cell.setGotPerkFromCharacterIndicator(visible: false)
//            } else {
//                cell.setGotPerkFromCharacterIndicator(visible: true)
//            }
//            
//            
//            //set the status of this perk.  Is it unlocked or affordable?
//            
//            //start the progress pie as hidden
//            let expiryPie = cell.expirationStatusView as! PieTimerView
//            expiryPie.isHidden = true
//            cell.pieLockImageView.isHidden = true
//            
//            //if it is unlocked
//            if try! checkForUnlockFeature(featureKey: keyUnlockedPerk, featureId: perk.name) {
//                //it is unlocked, so set the status to unlocked
//                cell.setStatusUnlocked()
//                
//                //if this character is unlockable and if we can get it
//                if let unlockedPerk = getUnlockedPerk(named: perk.name) {
//                    
//                    //calculate number of hours remaining and number of hours total
//                    let hours = getHoursOfExpiry(forPerk: unlockedPerk)
//                    
//                    if let hoursUntilExpiry = hours.0, let totalHoursUnlocked = hours.2, let minutesUntilExpiry = hours.1 {
//                        //if there is only one hour left, show red in minutes
//                        if hoursUntilExpiry <= 1 {
//                            
//                            let percentOfPieToFill = Float(minutesUntilExpiry) / 60 * 100.0
//                            print("Expiry in \(minutesUntilExpiry) for \(perk.name) in minutes.  Percentage left is \(percentOfPieToFill)")
//                            //less than one minute, set color to red
//                            expiryPie.setProgressColor(color: UIColor.red)
//                            
//                            //since it is unlocked, show the expiration status so the user will know if it is close to expiry
//                            expiryPie.setProgress(percent: percentOfPieToFill)
//                            
//                        } else {
//                            
//                            let percentOfPieToFill = Float(hoursUntilExpiry) / Float(totalHoursUnlocked) * 100.0
//                            
//                            //set the progress color to blue
//                            expiryPie.setProgressColor(color: UIColor(red: 0/255, green: 128/255, blue: 255/255, alpha: 1))
//                            
//                            //since it is unlocked, show the expiration status so the user will know if it is close to expiry
//                            expiryPie.setProgress(percent: percentOfPieToFill)
//                            
//                            
//                        }
//                        //able to populate the pie, so show it
//                        expiryPie.isHidden = false
//                        cell.pieLockImageView.isHidden = false
//                    }
//                    
//                }
//                
//                
//            } else if !isPerkRequiredCharacterPresent(perk: perk) {
//                //they are missing a party member to unlock this perk
//                cell.setStatusRequiredCharacterNotPresent()
//            } else if !isPerkAffordable(perk: perk) {  //check if it is affordable
//                cell.setStatusUnaffordable()
//            } else {  //the character is not unlocked and is affordable
//                cell.setStatusAffordable()
//            }
//            
//            self.collectionView.collectionViewLayout.invalidateLayout()
//            //self.collectionView?.reloadItems(at: [indexPath])
//            cell.layoutIfNeeded()
//            
//            return cell
//            
//            //END OF CASE AS PERK
//            
//            
//        case 1:  //section 1 should be SKProduct type
//            
//            let currentItem = appStoreItems[indexPath.row]
//            
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IAPCell", for: indexPath as IndexPath) as! InAppPurchaseCollectionViewCell
//            
//            let product = currentItem as! SKProduct
//            //display as an app store product
//            cell.characterNameLabel.text = product.localizedTitle
//            
//            cell.priceLabel.text = priceStringForProduct(item: product) //localized price string
//            
//            //get the ASPD (AppStoreProductDetail object) which contains information about the purchase in the bundle
//            let delegate = UIApplication.shared.delegate as! AppDelegate
//            let aspd = delegate.getAppStoreProductDetail(fromProductID: product.productIdentifier)
//            
//            //determine if this cell has a pending transaction, and flag appropriately
//            var foundApplicableTransaction = false
//            for transaction in pendingTransactions {
//                if transaction.payment.productIdentifier == aspd.productID {
//                    foundApplicableTransaction = true
//                }
//            }
//            
//            if foundApplicableTransaction {
//                cell.transactionPending = true
//            } else {
//                cell.transactionPending = false
//            }
//            
//            cell.loadAppearance(fromAppStoreProduct: product, fromASPD: aspd)
//            
//            //check if this perk requires a party member
//            if aspd.requiredPartyMembers.isEmpty {
//                cell.setGotPerkFromCharacterIndicator(visible: false)
//            } else {
//                cell.setGotPerkFromCharacterIndicator(visible: true)
//            }
//            
//            self.collectionView.collectionViewLayout.invalidateLayout()
//            //self.collectionView?.reloadItems(at: [indexPath])
//            cell.layoutIfNeeded()
//            
//            return cell
//
//        default:
//            //some other type of item has been shown, throw error
//            fatalError("Found unexpected section in Perk store: \(section)")
//        }
//        
//        
//    }
//    
//    /******************************************************/
//    /*******************///MARK: IN APP PURCHASES
//    /******************************************************/
//    
//    
//    ///gets in app purchases from the local bundle
//    func getAppStoreProductsRequest() -> [String] {
//        
//        //Getting a List of Product Identifiers
//        let url: URL = Bundle.main.url(forResource: "InAppPurchases", withExtension: "plist")!
//        
//        let allProductIdentifiers: [String] = NSArray.init(contentsOf: url)! as! [String]
//        
//        //remove the products that are above the user's level
//        let userLevel = parentVC.getUserCurrentLevel().level
//        let delegate = UIApplication.shared.delegate as! AppDelegate
//        var applicableProductIdentifiers = [String]()
//        for productID in allProductIdentifiers {
//            let aspd = delegate.getAppStoreProductDetail(fromProductID: productID)
//            if aspd.levelEligibleAt == nil {
//                applicableProductIdentifiers.append(productID)
//            } else if userLevel >= aspd.levelEligibleAt! {
//                applicableProductIdentifiers.append(productID)
//            }
//        }
//        
//        return applicableProductIdentifiers
//    }
//    
//    ///gets a locally formatted string for the price.  Adapted from https://stackoverflow.com/questions/36794489/how-to-get-local-currency-for-skproduct-display-iap-price-in-swift
//    func priceStringForProduct(item: SKProduct) -> String? {
//        let price = item.price
//        if price == 0 {
//            return "Free!" //or whatever you like really... maybe 'Free'
//        } else {
//            let numberFormatter = NumberFormatter()
//            let locale = item.priceLocale
//            numberFormatter.numberStyle = .currency
//            numberFormatter.locale = locale
//            return numberFormatter.string(from: price)
//        }
//    }
//    
//    //Retrieving Product Information
//    ///retrieves product information from apple servers
//    func validateProductIdentifiers(productIdentifiers: [String]) {
//        
//        let setOfProductIdentifiers = Set(productIdentifiers)
//        
//        let productsRequest: SKProductsRequest = SKProductsRequest(productIdentifiers: setOfProductIdentifiers)
//        
//        //Keep a strong reference to the request
//        self.appStoreProductsRequest = productsRequest
//        productsRequest.delegate = self
//        
//        //send request to app store
//        productsRequest.start()
//    }
//    
//    ///determines if in app purchases should be displayed and if so loads, validates products and displays UI
//    func displayInAppStoreProducts() {
//        //TODO: Ensure user can make payments or don't go through any of this ribble rabble
//        
//        
//        let productIdentifiers = getAppStoreProductsRequest()
//        
//        validateProductIdentifiers(productIdentifiers: productIdentifiers)
//        
//        //when the response returns it will call productsRequest and set self.appStoreProducts
//        
//    }
//    
//    
//    
//    /******************************************************/
//    /*******************///MARK: SKProductsRequestDelegate
//    /******************************************************/
//
//    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
//        
//        if response.products.count > 0 {
//            var validProducts = response.products
//            var productsArray = [SKProduct]()
//            for i in 0 ..< validProducts.count
//            {
//                let product = validProducts[i]
//                productsArray.append(product)
//            }
//            productsArray.sort{(Double($0.price) < Double($1.price))}
//            self.appStoreProducts = productsArray
//            
//            for invalidIdentifier in response.invalidProductIdentifiers {
//                //handle any invalid product identifiers
//                print("Found an invalid product identifier: \(invalidIdentifier)")
//            }
//        }
//        
//        //now display the store's UI
//        //for me, this will mean to add products to the perk store
//        //this means I need to refresh the collectionview so that it can see if self.appStoreProducts contains something now.
//        
//        //make sure the pending transactions is updated
//        reloadPendingTransactions()
//        
//        //in app purchases have arrived so refresh the collection view
//        collectionView.reloadData()
////        let section = 1 //section 1 is IAPs here
////        let indexSet = IndexSet(integer: section)
////        collectionView.reloadSections(indexSet)
////        
////        //check the payment queue and update UI
////        let queue = SKPaymentQueue.default()
////        if queue.transactions.count > 0 {
////            updateUIFromTransactions(transactions: queue.transactions)
////        }
//        //self.collectionView.collectionViewLayout.invalidateLayout()
//    }
//    
//    
//    /******************************************************/
//    /*******************///MARK: Flow Layout
//    
//    override func collectionView(_ collectionView: UICollectionView,
//                                 layout collectionViewLayout: UICollectionViewLayout,
//                                 sizeForItemAt indexPath: IndexPath) -> CGSize {
//        //self.collectionView.collectionViewLayout.invalidateLayout()
//        
//        let width = storeCollectionView.bounds.size.width / 2 - 5
//        let height = width
//        return CGSize(width: CGFloat(width), height: CGFloat(height))
//    }
//    
//    
//    
//    
//    /*******************///MARK: SKPaymentTransactionsObserverDelegate
//    /******************************************************/
//    
//    @available(iOS 3.0, *)
//    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
//        
//        updateUIFromTransactions(transactions: transactions)
//    }
//    
//    ///only reloads the pendingTransactions array from scratch.  no UI Updates
//    func reloadPendingTransactions() {
//        pendingTransactions = [SKPaymentTransaction]()
//        
//        let queue = SKPaymentQueue.default()
//        
//        for transaction in queue.transactions {
//            switch transaction.transactionState {
//            case .purchasing:
//                //update the UI to let user know it is happenening
//                pendingTransactions.append(transaction)
//                
//                break
//            case .purchased:
//                
//                break
//            case .failed:
//                
//                break
//                
//            case .deferred:
//                //this could take some time before transaction is updated
//            
//                pendingTransactions.append(transaction)
//                
//                break
//            default:
//                break
//                
//            }
//        }
//        
//        
//    }
//    
//    ///takes an array of SKPaymentTransactions and updates cells appropriately.  Call upon initial load of cells and when queue updates.
//    func updateUIFromTransactions(transactions:[SKPaymentTransaction]) {
//        //reinitilize the local transactions array
//        //pendingTransactions = [SKPaymentTransaction]()
//        
//        for transaction in transactions {
//            switch transaction.transactionState {
//            case .purchasing:
//                //update the UI to let user know it is happenening
//                pendingTransactions.append(transaction)
//                
//                //determine the indexPath of this payment
//                //go through the data source array and look for the payment ID
//                var index = 0
//                for product in appStoreProducts {
//                    if product.productIdentifier == transaction.payment.productIdentifier {
//                        
//                        let section = 1 //section 1 is IAPs here
//                        let indexPath = IndexPath(item: index, section: section)
//                        
//                        //reload this cell, it will check for this when reloading
//                        collectionView.reloadItems(at: [indexPath])
//                        break
//                    }
//                    index += 1
//                }
//                
////                let section = 1 //section 1 is IAPs here
////                let indexSet = IndexSet(integer: section)
////                collectionView.reloadSections(indexSet)
//                
//                break
//            case .purchased:
//                //validate the purchase
//                //deduct the price
//                score = getCurrentScore()
//                updateScoreLabel()
//                
//                //update the UI to let user know it is happenening
//                let transactionIndex = pendingTransactions.index(of: transaction)
//                if let transactionIndex = transactionIndex {
//                    pendingTransactions.remove(at: transactionIndex)
//                }
//                
//                
//                //determine the indexPath of this payment
//                //go through the data source array and look for the payment ID
//                var index = 0
//                for product in appStoreProducts {
//                    if product.productIdentifier == transaction.payment.productIdentifier {
//                        
//                        let section = 1 //section 1 is IAPs here
//                        let indexPath = IndexPath(item: index, section: section)
//                        
//                        //reload this cell, it will check for this when reloading
//                        collectionView.reloadItems(at: [indexPath])
//                        break
//                    }
//                    index += 1
//                }
//                
//                break
//            case .failed:
//                
//                //update the UI to let user know it is happenening
//                let transactionIndex = pendingTransactions.index(of: transaction)
//                if let transactionIndex = transactionIndex {
//                    pendingTransactions.remove(at: transactionIndex)
//                }
//                
//                
//                //determine the indexPath of this payment
//                //go through the data source array and look for the payment ID
//                var index = 0
//                for product in appStoreProducts {
//                    if product.productIdentifier == transaction.payment.productIdentifier {
//                        
//                        let section = 1 //section 1 is IAPs here
//                        let indexPath = IndexPath(item: index, section: section)
//                        
//                        //reload this cell, it will check for this when reloading
//                        collectionView.reloadItems(at: [indexPath])
//                        break
//                    }
//                    index += 1
//                }
//                
//                break
//                
//            case .deferred:
//                
//                //this could take some time before transaction is updated
//                
//                //update the UI to let user know it is happenening
//                //for deferred cases, transaction is pending.
//                pendingTransactions.append(transaction)
//                
//                //determine the indexPath of this payment
//                //go through the data source array and look for the payment ID
//                var index = 0
//                for product in appStoreProducts {
//                    if product.productIdentifier == transaction.payment.productIdentifier {
//                        
//                        let section = 1 //section 1 is IAPs here
//                        let indexPath = IndexPath(item: index, section: section)
//                        
//                        //reload this cell, it will check for this when reloading
//                        collectionView.reloadItems(at: [indexPath])
//                        break
//                    }
//                    index += 1
//                }
//                
//                break
//            default:
//                break
//                
//            }
//        }
//    }
//    
//    
//    /******************************************************/
//    /*******************///MARK: Timer
//    /******************************************************/
//    
//    override func updateTimer() {
//        //check that none of them have expired since this view has been open:
//        lockAllExpiredPerks()
//        
//        collectionView.reloadData()
//        self.collectionView.collectionViewLayout.invalidateLayout()
//    }
//    
//    /******************************************************/
//    /*******************///MARK: UIcollectionViewDelegate
//    /******************************************************/
//    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)  {
//        
//        //check if this is a perk or an inAppPurchase
//        //store contains perk objects and products from app store
//        let perkItems: [Any] = self.perkCollectionViewData as [Any]
//        let appStoreItems: [Any] = self.appStoreProducts as [Any]
//        let allItemsInStore: [Any] = perkItems + appStoreItems
//        
//        
//        
//        let section = indexPath.section
//        
//        //now check the item to see if we have a perk or an app store item
//        switch section {
//        case 0: //Perk
//            let currentItem = perkItems[indexPath.row]
//            
//            let perk = currentItem as! Perk
//            
//            guard isPerkAffordable(perk: perk) else {
//                print ("You cannot afford this item")
//                return
//            }
//            
//            guard isPerkRequiredCharacterPresent(perk: perk) else {
//                print ("You need a certain party member to unlock this. \(perk.requiredPartyMembers)")
//                return
//            }
//            
//            let newPerk = unlockPerk(named: perk.name)
//            
//            if newPerk != nil {
//                //deduct the price
//                score = score - perk.price!
//                updateScoreLabel()
//                
//                //adjust the core data score
//                reconcileScoreFromPurchase(purchasePrice: perk.price!)
//                
//                collectionView.reloadData()
//                self.collectionView.collectionViewLayout.invalidateLayout()
//                
//                print("Perk \(String(describing: newPerk!.name)) has been unlocked!")
//            }
//        case 1:  //SKProduct
//            let currentItem = appStoreItems[indexPath.row]
//            
//            //start the buying process from the app store.
//            let product = currentItem as! SKProduct
//                        
//            requestPayment(for:product)
//            
//        default:
//            //some other type of item has been shown, throw error
//            fatalError("Found unexpected section in Perk store: \(section)")
//        }
//    }
//        
//    ///Sends a payment request for the given product
//    func requestPayment(for product:SKProduct) {
//        let payment = SKMutablePayment(product: product)
//        payment.quantity = 1
//        
//        //put the payment object in the payment queue
//        SKPaymentQueue.default().add(payment)
//    }
//    
//    ///Checks the given CoreData set for the given FRCKey, for the given id of the feature to see if that feature is unlocked in the store or not.
//    override func checkForUnlockFeature(featureKey: String, featureId: String) throws -> Bool {
//        guard let fc = frcDict[featureKey] else {
//            fatalError("Can't find a fc with the key named \(featureKey)")
//        }
//        
//        switch featureKey {
//        
//        case keyUnlockedPerk:
//            
//            //look for the given string in the name field
//            guard let perks = fc.fetchedObjects as? [UnlockedPerk] else {
//                fatalError("fc.fetchedObjects array didn't return an array of UnlockedPerks.")
//            }
//            
//            //if the character name is found in the set of unlocked characgters, or if the character object is found in the set of characters that are always unlocked
//            for perk in perks {
//                if perk.name == featureId{
//                    //character was found, return true
//                    return true
//                }
//            }
//            
//            //character not found, return false
//            return false
//        default:
//            throw StoreError.invalidFeatureKey(key: featureKey)
//            
//        }
//    }
//
//    
//    /******************************************************/
//    /*******************///MARK: NEED THIS OVERRIDE
//    /******************************************************/
//
//    func isPerkAffordable(perk: Perk) -> Bool {
//        
//        let price = perk.price!
//        
//        if price > score {
//            //print ("You cannot afford this item")
//            return false
//        } else {
//            return true
//        }
//    }
//    
//    func isPerkRequiredCharacterPresent(perk: Perk) -> Bool {
//        
//        if perk.requiredPartyMembers.isEmpty {
//            return true
//        } else {
//            //ask the store if they are unlocked
//            let store = self.storyboard!.instantiateViewController(withIdentifier: "Store") as! StoreCollectionViewController
//            let unlockedCharacters = store.getAllUnlockedCharacters()
//            
//            for unlockedCharacter in unlockedCharacters {
//                //check for any of the required party members
//                for perkPartyMember in perk.requiredPartyMembers {
//                    if unlockedCharacter.name == perkPartyMember.name {
//                        return true
//                    }
//                }
//            }
//            //nobody required was found
//            return false
//        }
//        
//    }
//    
//    
//    /**
//     unlocks the given character and either returns that UnlockedCharacter object or returns nil if the character is already unlocked
//     */
//    /******************************************************/
//    /*******************///MARK: NEED THIS OVERRIDE
//    /******************************************************/
//
//    func unlockPerk(named perkName: String) -> UnlockedPerk? {
//        //check to see if the character is already unlocked
//        
//        if let isUnlocked = try? checkForUnlockFeature(featureKey: keyUnlockedPerk, featureId: perkName) {
//            
//            if isUnlocked {
//                //it is already unlocked, so return nil
//                return nil
//            } else {
//                //it is not unlocked, so unlock it and return the character
//                //get the actual perk object to find amount of time to unlock
//                var thePerk: Perk? = nil
//                for perk in Perks.UnlockablePerks {
//                    if perk.name == perkName {
//                        thePerk = perk
//                    }
//                }
//                
//                var minutesToUnlock = 30
//                if let thePerk = thePerk {
//                    minutesToUnlock = thePerk.minutesUnlocked
//                }
//                
//                // Get the stack
//                let delegate = UIApplication.shared.delegate as! AppDelegate
//                self.stack = delegate.stack
//                
//                let newPerk = UnlockedPerk(name: perkName, expiresMinutes: minutesToUnlock, context: stack.context)
//                
//                print("Unlocked a new Perk named \(String(describing: newPerk.name))")
//                return newPerk
//                
//            }
//        }
//        
//        //got an error when checking for the feature, return nil
//        return nil
//        
//        
//    }
//    
//    ///locks all characters that are unlockable and have exceeded the expiration date.
//    /******************************************************/
//    /*******************///MARK: NEED THIS OVERRIDE
//    /******************************************************/
//
//    func lockAllExpiredPerks() {
//        let expiredPerks = getExpiredPerks()
//        
//        /******************************************************/
//        /*******************///MARK: PERK INVESTMENT
//        /******************************************************/
//        //if the big payoff investment has expired, player will lose 50% of all money plus 5% for all active (and expiring) investment perks.  Then lock all perks.
//        //let vC = self.storyboard!.instantiateViewController(withIdentifier: "DataViewController") as! DataViewController
//        //add to the points earned
//        let applicableInvestmentPerks = parentVC.getAllPerks(ofType: .investment, withStatus: .unlocked)
//        
//        if !applicableInvestmentPerks.isEmpty {
//            //there are active investment perks
//            var foundExpiringBigPayoff = false
//            for (perk, unlockedPerk) in applicableInvestmentPerks {
//                //check to see if the big payoff is among the expired perks
//                if perk === Perks.Investment5 {  //the big payoff is Investment5
//                    //the big payoff is active
//                    
//                    for expiredPerk in expiredPerks {
//                        if expiredPerk === unlockedPerk {
//                            ///the big payoff is one of the expired perks
//                            print("The big payoff is expiring.")
//                            foundExpiringBigPayoff = true
//                        }
//                    }
//                }
//            }
//            
//            if foundExpiringBigPayoff {
//                parentVC.investmentCrash(activeInvestmentPerks: applicableInvestmentPerks)
//            } else {
//                //normal locking routine
//                for perk in expiredPerks {
//                    lockPerk(unlockedPerk: perk)
//                }
//            }
//            /******************************************************/
//            /*******************///MARK: END PERK INVESTMENT
//            /******************************************************/
//        } else {
//            
//            
//            //normal locking routine
//            for perk in expiredPerks {
//                lockPerk(unlockedPerk: perk)
//            }
//        }
//    }
//    
//    ///returns an array of all characters that are expired
//    func getExpiredPerks() -> [UnlockedPerk] {
//        
//        let unlockedPerks = getAllUnlockedPerks()
//        var expiredPerks = [UnlockedPerk]()
//        
//        for perk in unlockedPerks {
//            //check each perk's date.  If it is in the past, add it to the array of expired characters
//            let now = Date()
//            let expiryDate = perk.datetimeExpires as Date
//            
//            if expiryDate < now {
//                expiredPerks.append(perk)
//            }
//        }
//        print("\(expiredPerks.count) perks have expired")
//        return expiredPerks
//    }
//    
//    func getAllUnlockedPerks() -> [UnlockedPerk] {
//        
//        var fc = frcDict[keyUnlockedPerk]
//        
//        if fc == nil {
//            //try to load it again since this can be called by outside
//            _ = setupFetchedResultsController(frcKey: keyUnlockedPerk, entityName: "UnlockedPerk", sortDescriptors: [],  predicate: nil)
//            
//            fc = frcDict[keyUnlockedPerk]
//            
//            //but if still not loaded
//            guard fc != nil else {
//                fatalError("Can't find a fc with the key named \(keyUnlockedPerk)")
//            }
//            
//        }
//        
//        guard (fc!.fetchedObjects as? [UnlockedPerk]) != nil else {
//            
//            fatalError("fc.fetchedObjects array didn't return an array of UnlockedPerk.")
//        }
//        
//        let unlockedPerks = fc!.fetchedObjects as! [UnlockedPerk]
//        
//        return unlockedPerks
//    }
//    
//    
//    
//    
//    
//    //TODO: Go through all these functions and make them handle all types instead of repeatig them
//    //locks character by deleting the entity in the unlocked characters model
//    func lockPerk(unlockedPerk: UnlockedPerk) {
//        
//        //check to see if this character is unlocked
//        if let isUnlocked = try? checkForUnlockFeature(featureKey: keyUnlockedPerk, featureId: unlockedPerk.name) {
//            
//            if isUnlocked {
//                //it is unlocked, so lock it by deleting
//                let perkToDelete = getUnlockedPerk(named: unlockedPerk.name)
//                
//                if perkToDelete != nil {
//                    // Get the stack
//                    let delegate = UIApplication.shared.delegate as! AppDelegate
//                    self.stack = delegate.stack
//                    
//                    if let context = self.frcDict[keyUnlockedPerk]?.managedObjectContext {
//                        
//                        context.delete(perkToDelete!)
//                        
//                    }
//                }
//                
//            }
//        }
//        
//    }
//    
//    /**
//     returns the UnlockedCharacter object from the CoreData.  Perhaps to be deleted (thereby removing it).
//     */
//    
//    /******************************************************/
//    /*******************///MARK: NEED THIS OVERRIDE
//    /******************************************************/
//
//    //TODO: Change all of this returning a string crap into passing actual objects
//    func getUnlockedPerk(named perkName:String) -> UnlockedPerk? {
//        
//        let perkExists = try? checkForUnlockFeature(featureKey: keyUnlockedPerk, featureId: perkName)
//        
//        if perkExists == false || perkExists == nil {
//            return nil
//        } else {
//            //the perk does exist, so get and return the UnlockedPerk
//            guard let fc = frcDict[keyUnlockedPerk] else {
//                fatalError("Can't find a fc with the key named \(keyUnlockedPerk)")
//            }
//            
//            guard let perks = fc.fetchedObjects as? [UnlockedPerk] else {
//                
//                fatalError("fc.fetchedObjects array didn't return an array of UnlockedPerk.")
//            }
//            
//            for perk in perks {
//                if perk.name == perkName {
//                    return perk
//                }
//            }
//            
//            //no perk found
//            return nil
//        }
//    }
//    
//    ///returns array of all valid characters that are not unlocked
//    func getAllLockedPerks() -> [Perk] {
//        
//        let unlockablePerks = Perks.UnlockablePerks
//        var allLockedPerks: [Perk] = []
//        
//        //add the perk that have not been unlocked
//        for perk in unlockablePerks {
//            //if the perk is already unlocked, remove from the array
//            
//            let isUnlocked = try! checkForUnlockFeature(featureKey: keyUnlockedPerk, featureId: perk.name)
//            
//            if !isUnlocked {
//                allLockedPerks.append(perk)
//            }
//        }
//        
//        return allLockedPerks
//        
//    }
//    
//    
//    /******************************************************/
//    /*******************///MARK: NEED THIS OVERRIDE
//    /******************************************************/
//
//    func getAllPerksDisplayableInStore() -> [Perk] {
//        
//        //only show perks avialable based on the user's current level
//        if enforcePerkLevel {
//            var applicablePerks = [Perk]()
//            
//            let userLevel = parentVC.getUserCurrentLevel()
//                        
//            for perk in Perks.ValidPerks {
//                //only perks with a level to be enforced are non-optional
//                if let perkLevel = perk.levelEligibleAt {
//                    if perkLevel <= userLevel.level {
//                        applicablePerks.append(perk)
//                    }
//                } else { //no enforcement neccessary, add to store
//                    applicablePerks.append(perk)
//                }
//            }
//            return applicablePerks
//        } else {
//            return Perks.ValidPerks
//        }
//    }
//    
//    
//    //TODO: consolidate this function with parent
//    ///determines the number of hours until the character expires and the number of total hours the character is scheduled to be unlocked.  returns nil both value if the character is not unlocked (hoursUntilExpiry, minutesUntilExpiry, totalHours)
//    func getHoursOfExpiry(forPerk unlockedPerk: UnlockedPerk) -> (Int?, Int?, Int?) {
//        
//        //validate the character is unlocked
//        let isUnlocked = try! checkForUnlockFeature(featureKey: keyUnlockedPerk, featureId: unlockedPerk.name)
//        
//        if isUnlocked {
//            let startDate = unlockedPerk.datetimeUnlocked as Date
//            let endDate = unlockedPerk.datetimeExpires as Date
//            let now = Date()
//            
//            let totalHours = endDate.hours(from: startDate)
//            let hoursUntilExpiry = endDate.hours(from: now) + 1
//            let minutesUntilExpiry = endDate.minutes(from: now) + 1  //add one to include the present minute
//            
//            //let percentOfPieToFill = Float(hoursUntilExpiry) / Float(totalHours)
//            return (hoursUntilExpiry, minutesUntilExpiry, totalHours )
//            
//        } else {
//            return (nil, nil, nil)
//        }
//    }
//}
