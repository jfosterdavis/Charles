//
//  AppStoreProductDetails.swift
//  Charles
//
//  Created by Jacob Foster Davis on 6/15/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation
import UIKit

/******************************************************/
/*******************///MARK: Holds all of the valid AppStoreProductDetail objects
/******************************************************/

struct AppStoreProductDetails {
    
    static let valid: [AppStoreProductDetail] = [Coin_100000,
                                                 Coin_300000]
    
    static let Coin_1500 = AppStoreProductDetail(productID: "coin_1500",
                                                 icon: #imageLiteral(resourceName: "coin_1500Icon"),
                                                 minutesLocked: 180, //3 hours 180
                                                   displayColor: .white,
                                                   levelEligibleAt: 3,
                                                   requiredPartyMembers: [])
    
    static let Coin_100000 = AppStoreProductDetail(productID: "coin_100000",
                                                   icon: #imageLiteral(resourceName: "coin_100000Icon"),
                                                   minutesLocked: 0,
                                                   displayColor: .white,
                                                   levelEligibleAt: 4,
                                                   requiredPartyMembers: [])
    
    static let Coin_300000 = AppStoreProductDetail(productID: "coin_300000",
                                                   icon: #imageLiteral(resourceName: "coin_300000Icon"),
                                                   minutesLocked: 0,
                                                   displayColor: .white,
                                                   levelEligibleAt: 5,
                                                   requiredPartyMembers: [])
    
}
