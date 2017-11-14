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
                                                 Coin_400000,
                                                 Coin_1M,
                                                 Coin_10M]
    
    static let Coin_1500 = AppStoreProductDetail(productID: "coin_1500",
                                                 name: "+ 1,500",
                                                 description: "",
                                                 icon: #imageLiteral(resourceName: "coin_1500Icon"),
                                                 value: 1500,
                                                 type: .givesPoints,
                                                 minutesLocked: 180, //3 hours 180
                                                   displayColor: .white,
                                                   price: NSDecimalNumber.zero,
                                                   levelEligibleAt: 3,
                                                   requiredPartyMembers: [])
    
    static let Coin_100000 = AppStoreProductDetail(productID: "coin_100000",
                                                   name: "+ 100,000",
                                                   description: "Instantly grants 100,000 points.",
                                                   icon: #imageLiteral(resourceName: "coin_100000Icon"),
                                                   value: 100000,
                                                   type: .givesPoints,
                                                   minutesLocked: 0,
                                                   displayColor: .white,
                                                   price: NSDecimalNumber(string: "0.99"),
                                                   levelEligibleAt: 6,
                                                   requiredPartyMembers: [])
    
    static let Coin_400000 = AppStoreProductDetail(productID: "coin_400000",
                                                   name: "+ 400,000",
                                                   description: "Instantly grants 400,000 points.",
                                                   icon: #imageLiteral(resourceName: "coin_400000Icon"),
                                                   value: 400000,
                                                   type: .givesPoints,
                                                   minutesLocked: 0,
                                                   displayColor: .white,
                                                   price: NSDecimalNumber(string: "1.99"),
                                                   levelEligibleAt: 9,
                                                   requiredPartyMembers: [])
    
    static let Coin_1M = AppStoreProductDetail(productID: "coin_1M",
                                                   name: "+ 1,000,000",
                                                   description: "Instantly grants 1,000,000 points.",
                                                   icon: #imageLiteral(resourceName: "coin_1MIcon"),
                                                   value: 1000000,
                                                   type: .givesPoints,
                                                   minutesLocked: 0,
                                                   displayColor: .white,
                                                   price: NSDecimalNumber(string: "3.99"),
                                                   levelEligibleAt: 12,
                                                   requiredPartyMembers: [])
    
    static let Coin_10M = AppStoreProductDetail(productID: "coin_10M",
                                                   name: "+ 10,000,000",
                                                   description: "Instantly grants you 10,000,000 points.",
                                                   icon: #imageLiteral(resourceName: "coin_10MIcon"),
                                                   value: 10000000,
                                                   type: .givesPoints,
                                                   minutesLocked: 0,
                                                   displayColor: .white,
                                                   price: NSDecimalNumber(string: "7.99"),
                                                   levelEligibleAt: 15,
                                                   requiredPartyMembers: [])
    

}
