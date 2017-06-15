//
//  AppStoreProductDetail.swift
//  Charles
//
//  Created by Jacob Foster Davis on 6/15/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation
import UIKit

/******************************************************/
/*******************///MARK: This holds the local information (UI based) about products available on the app store
/******************************************************/


class AppStoreProductDetail: NSObject {
    
    //Note: name, description, price is kept at App Store
    
    var productID: String!
    var icon: UIImage!
    var minutesLocked: Int! //once player buys this, how many minutes will this be locked
    var displayColor: UIColor!
    var levelEligibleAt: Int? //nil if there is no level requirement
    var requiredPartyMembers: [Character]!
    
    
    // MARK: Initializers
    init(productID: String!,
        icon: UIImage!,
        minutesLocked: Int!,
        displayColor: UIColor!,
        levelEligibleAt: Int?,
        requiredPartyMembers: [Character]) {
        
        super.init()
        
        self.productID = productID
        self.icon = icon
        self.minutesLocked = minutesLocked
        self.displayColor = displayColor
        self.levelEligibleAt = levelEligibleAt
        self.requiredPartyMembers = requiredPartyMembers
    }
    
    
}
