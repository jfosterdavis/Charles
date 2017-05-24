//
//  Protocols.swift
//  Charles
//
//  Created by Jacob Foster Davis on 5/23/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation

protocol StoreReactor: class {
   
    /// To be called when the store is closed to allow proper refreshes and reactions
    func storeClosed()
}
