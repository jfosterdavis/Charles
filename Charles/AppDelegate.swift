//
//  AppDelegate.swift
//  Charles
//
//  Created by Jacob Foster Davis on 5/7/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
///

import UIKit
import CoreData
import StoreKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, SKPaymentTransactionObserver {

    var window: UIWindow?
    
    //core data stack
    let stack = CoreDataStack(modelName: "Model")!


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        stack.save()
        
        // Attach an observer to the payment queue.
        SKPaymentQueue.default().add(self)
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        
        stack.save()
        
        // Remove the observer.
        SKPaymentQueue.default().remove(self)
    }

}

/******************************************************/
/*******************///MARK: SKPaymentTransactionObserver
/******************************************************/
extension AppDelegate {
    
    @available(iOS 3.0, *)
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            switch transaction.transactionState {
            case .purchasing:
                //update the UI to let user know it is happenening
                //this will be done by the store
                break
            case .purchased:
                //validate the purchase
                //deliver the product
                let productID = transaction.payment.productIdentifier
                let aspd = getAppStoreProductDetail(fromProductID: productID)
                aspd.givePointsToPlayer()
                
                //product is delivered.  Close the transaction.
                queue.finishTransaction(transaction)
                break
            case .deferred:
                //validate the purchase
                //this could take some time before transaction is updated
                break
            case .failed:
                //store will let use know what went wrong
                //finish the transaction
                queue.finishTransaction(transaction)
                break
            default:
                break
                
            }
        }
    }
    
    ///finds the local details for the given SKProduct
    func getAppStoreProductDetail(fromProductID productID:String) -> AppStoreProductDetail {
        
        //filter out ASPDs that don't match the product's identifier
        let matchingASPDs: [AppStoreProductDetail] = AppStoreProductDetails.valid.filter{$0.productID == productID}
        
        //This should have only returned one
        guard matchingASPDs.count == 1 else {
            fatalError("Found more than one ASPD among \(AppStoreProductDetails.valid) for productID: \(productID)")
        }
        
        return matchingASPDs[0]
    }
}

