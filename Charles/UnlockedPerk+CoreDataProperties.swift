//
//  UnlockedPerk+CoreDataProperties.swift
//  Charles
//
//  Created by Jacob Foster Davis on 5/29/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation
import CoreData


extension UnlockedPerk {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UnlockedPerk> {
        return NSFetchRequest<UnlockedPerk>(entityName: "UnlockedPerk")
    }

    @NSManaged public var datetimeExpires: NSDate
    @NSManaged public var name: String
    @NSManaged public var datetimeUnlocked: NSDate

}
