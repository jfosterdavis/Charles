//
//  UnlockedCharacter+CoreDataProperties.swift
//  Charles
//
//  Created by Jacob Foster Davis on 5/27/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation
import CoreData


extension UnlockedCharacter {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UnlockedCharacter> {
        return NSFetchRequest<UnlockedCharacter>(entityName: "UnlockedCharacter")
    }

    @NSManaged public var name: String
    @NSManaged public var datetimeUnlocked: NSDate
    @NSManaged public var datetimeExpires: NSDate

}
