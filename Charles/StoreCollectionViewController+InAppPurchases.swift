//
//  StoreCollectionViewController+InAppPurchases.swift
//  Charles
//
//  Created by Jacob Foster Davis on 6/25/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation
import StoreKit

extension StoreCollectionViewController: SKProductsRequestDelegate, SKPaymentTransactionObserver {
    
    /******************************************************/
    /*******************///MARK: IN APP PURCHASES
    /******************************************************/
    
    
    ///gets in app purchases from the local bundle
    func getAppStoreProductsRequest() -> [String] {
        
        //Getting a List of Product Identifiers
        let url: URL = Bundle.main.url(forResource: "InAppPurchases", withExtension: "plist")!
        
        let allProductIdentifiers: [String] = NSArray.init(contentsOf: url)! as! [String]
        
        //remove the products that are above the user's level
        let userLevel = parentVC.getUserCurrentLevel().level
        let delegate = UIApplication.shared.delegate as! AppDelegate
        var applicableProductIdentifiers = [String]()
        for productID in allProductIdentifiers {
            let aspd = delegate.getAppStoreProductDetail(fromProductID: productID)
            if aspd.levelEligibleAt == nil {
                applicableProductIdentifiers.append(productID)
            } else if userLevel >= aspd.levelEligibleAt! {
                applicableProductIdentifiers.append(productID)
            }
        }
        
        return applicableProductIdentifiers
    }
    
    ///gets a locally formatted string for the price.  Adapted from https://stackoverflow.com/questions/36794489/how-to-get-local-currency-for-skproduct-display-iap-price-in-swift
    func priceStringForProduct(item: SKProduct) -> String? {
        let price = item.price
        if price == 0 {
            return "Free!" //or whatever you like really... maybe 'Free'
        } else {
            let numberFormatter = NumberFormatter()
            let locale = item.priceLocale
            numberFormatter.numberStyle = .currency
            numberFormatter.locale = locale
            return numberFormatter.string(from: price)
        }
    }
    
    ///determines if in app purchases should be displayed and if so loads, validates products and displays UI
    func displayInAppStoreProducts() {
        //TODO: Ensure user can make payments or don't go through any of this ribble rabble
        
        
        let productIdentifiers = getAppStoreProductsRequest()
        
        validateProductIdentifiers(productIdentifiers: productIdentifiers)
        
        //when the response returns it will call productsRequest and set self.appStoreProducts
        
    }
    
    //Retrieving Product Information
    ///retrieves product information from apple servers
    func validateProductIdentifiers(productIdentifiers: [String]) {
        
        let setOfProductIdentifiers = Set(productIdentifiers)
        
        let productsRequest: SKProductsRequest = SKProductsRequest(productIdentifiers: setOfProductIdentifiers)
        
        //Keep a strong reference to the request
        self.appStoreProductsRequest = productsRequest
        productsRequest.delegate = self
        
        //send request to app store
        productsRequest.start()
    }
    
    
    
    /******************************************************/
    /*******************///MARK: SKProductsRequestDelegate
    /******************************************************/
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        
        if response.products.count > 0 {
            var validProducts = response.products
            var productsArray = [SKProduct]()
            for i in 0 ..< validProducts.count
            {
                let product = validProducts[i]
                productsArray.append(product)
            }
            productsArray.sort{(Double($0.price) < Double($1.price))}
            self.appStoreProducts = productsArray
            
            for invalidIdentifier in response.invalidProductIdentifiers {
                //handle any invalid product identifiers
                print("Found an invalid product identifier: \(invalidIdentifier)")
            }
        }
        
        //now display the store's UI
        //for me, this will mean to add products to the perk store
        //this means I need to refresh the collectionview so that it can see if self.appStoreProducts contains something now.
        
        //make sure the pending transactions is updated
        reloadPendingTransactions()
        
        //in app purchases have arrived so refresh the collection view
        collectionView.reloadData()
    }
    
    
    /*******************///MARK: SKPaymentTransactionsObserverDelegate
    /******************************************************/
    
    ///Sends a payment request for the given product
    func requestPayment(for product:SKProduct) {
        let payment = SKMutablePayment(product: product)
        payment.quantity = 1
        
        //put the payment object in the payment queue
        SKPaymentQueue.default().add(payment)
    }
    
    @available(iOS 3.0, *)
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        
        updateUIFromTransactions(transactions: transactions)
    }
    
    ///only reloads the pendingTransactions array from scratch.  no UI Updates
    func reloadPendingTransactions() {
        pendingTransactions = [SKPaymentTransaction]()
        
        let queue = SKPaymentQueue.default()
        
        for transaction in queue.transactions {
            switch transaction.transactionState {
            case .purchasing:
                //update the UI to let user know it is happenening
                pendingTransactions.append(transaction)
                
                break
            case .purchased:
                
                break
            case .failed:
                
                break
                
            case .deferred:
                //this could take some time before transaction is updated
                
                pendingTransactions.append(transaction)
                
                break
            default:
                break
                
            }
        }
        
        
    }
    
    ///takes an array of SKPaymentTransactions and updates cells appropriately.  Call upon initial load of cells and when queue updates.
    func updateUIFromTransactions(transactions:[SKPaymentTransaction]) {
        //reinitilize the local transactions array
        //pendingTransactions = [SKPaymentTransaction]()
        
        for transaction in transactions {
            switch transaction.transactionState {
            case .purchasing:
                //update the UI to let user know it is happenening
                pendingTransactions.append(transaction)
                
                //determine the indexPath of this payment
                //go through the data source array and look for the payment ID
                var index = 0
                for product in appStoreProducts {
                    if product.productIdentifier == transaction.payment.productIdentifier {
                        
                        let section = 2 //section 2 is IAPs here
                        let indexPath = IndexPath(item: index, section: section)
                        
                        //reload this cell, it will check for this when reloading
                        collectionView.reloadItems(at: [indexPath])
                        break
                    }
                    index += 1
                }
                
                //                let section = 1 //section 1 is IAPs here
                //                let indexSet = IndexSet(integer: section)
                //                collectionView.reloadSections(indexSet)
                
                break
            case .purchased:
                //validate the purchase
                //deduct the price
                score = getCurrentScore()
                updateScoreLabel()
                
                //update the UI to let user know it is happenening
                let transactionIndex = pendingTransactions.index(of: transaction)
                if let transactionIndex = transactionIndex {
                    pendingTransactions.remove(at: transactionIndex)
                }
                
                
                //determine the indexPath of this payment
                //go through the data source array and look for the payment ID
                var index = 0
                for product in appStoreProducts {
                    if product.productIdentifier == transaction.payment.productIdentifier {
                        
                        let section = 2 //section 2 is IAPs here
                        let indexPath = IndexPath(item: index, section: section)
                        
                        //reload this cell, it will check for this when reloading
                        collectionView.reloadItems(at: [indexPath])
                        break
                    }
                    index += 1
                }
                
                break
            case .failed:
                
                //update the UI to let user know it is happenening
                let transactionIndex = pendingTransactions.index(of: transaction)
                if let transactionIndex = transactionIndex {
                    pendingTransactions.remove(at: transactionIndex)
                }
                
                
                //determine the indexPath of this payment
                //go through the data source array and look for the payment ID
                var index = 0
                for product in appStoreProducts {
                    if product.productIdentifier == transaction.payment.productIdentifier {
                        
                        let section = 2 //section 2 is IAPs here
                        let indexPath = IndexPath(item: index, section: section)
                        
                        //reload this cell, it will check for this when reloading
                        collectionView.reloadItems(at: [indexPath])
                        break
                    }
                    index += 1
                }
                
                break
                
            case .deferred:
                
                //this could take some time before transaction is updated
                
                //update the UI to let user know it is happenening
                //for deferred cases, transaction is pending.
                pendingTransactions.append(transaction)
                
                //determine the indexPath of this payment
                //go through the data source array and look for the payment ID
                var index = 0
                for product in appStoreProducts {
                    if product.productIdentifier == transaction.payment.productIdentifier {
                        
                        let section = 2 //section 2 is IAPs here
                        let indexPath = IndexPath(item: index, section: section)
                        
                        //reload this cell, it will check for this when reloading
                        collectionView.reloadItems(at: [indexPath])
                        break
                    }
                    index += 1
                }
                
                break
            default:
                break
                
            }
        }
    }
    
}
