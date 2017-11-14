//
//  AppStoreProductDetail.swift
//  Charles
//
//  Created by Jacob Foster Davis on 6/15/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation
import UIKit
import CoreData

/******************************************************/
/*******************///MARK: This holds the local information (UI based) about products available on the app store
/******************************************************/

public enum AppStoreProductDetailType {
    case givesPoints
}

class AppStoreProductDetail: CoreDataNSObject {
    
    //Note: name, description, price is kept at App Store
    //CoreData
    let keyCurrentScore = "CurrentScore"
    
    var productID: String
    var name: String
    var gameDescription: String
    var icon: UIImage
    var value: Int
    var type: AppStoreProductDetailType
    var minutesLocked: Int //once player buys this, how many minutes will this be locked
    var displayColor: UIColor
    var price: NSDecimalNumber
    var levelEligibleAt: Int? //nil if there is no level requirement
    var requiredPartyMembers: [Character]
    
    // MARK: Initializers
    init(productID: String,
         name: String,
         description: String,
        icon: UIImage,
        value: Int,
        type: AppStoreProductDetailType,
        minutesLocked: Int,
        displayColor: UIColor,
        price: NSDecimalNumber,
        levelEligibleAt: Int?,
        requiredPartyMembers: [Character] ) {
        
        self.productID = productID
        self.name = name
        self.gameDescription = description
        self.icon = icon
        self.value = value
        self.type = type
        self.minutesLocked = minutesLocked
        self.displayColor = displayColor
        self.price = price
        self.levelEligibleAt = levelEligibleAt
        self.requiredPartyMembers = requiredPartyMembers
        
        super.init()
    }
    
    //TODO: Impliment a more general function for in apps
    ///this function should be overriden.  When called, it will deliver the product
//    func deliverProduct() {
//        switch self.type {
//        case .givesPoints:
//            givePointsToPlayer()
//        }
//    }
    
    func givePointsToPlayer() {
        
        //setup CoreData
        _ = setupFetchedResultsController(frcKey: keyCurrentScore, entityName: "CurrentScore", sortDescriptors: [],  predicate: nil)
        
        guard let fc = frcDict[keyCurrentScore] else {
            fatalError("Could not get frcDict")
            
        }
        
        guard let currentScores = fc.fetchedObjects as? [CurrentScore] else {
            fatalError("Could not get array of currentScores")
        }
        
        let purchasedScorePoints = self.value
        
        if (currentScores.count) == 0  {
            print("No CurrentScore exists.  Creating.")
            let currentScore = CurrentScore(entity: NSEntityDescription.entity(forEntityName: "CurrentScore", in: stack.context)!, insertInto: fc.managedObjectContext)
            currentScore.value += Int64(purchasedScorePoints)
            stack.save()
            return
        } else {
            
            switch purchasedScorePoints {
            //TODO: if the score is already 0 don't set it again.
            case let x where x < 0:
                currentScores[0].value = Int64(0)
                return
            default:
                //set score for the first element
                currentScores[0].value += Int64(purchasedScorePoints)
                //print("There are \(currentScores.count) score entries in the database.")
                return
            }
        }
    }
    
}
