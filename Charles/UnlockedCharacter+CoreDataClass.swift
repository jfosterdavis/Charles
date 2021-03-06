//
//  UnlockedCharacter+CoreDataClass.swift
//  Charles
//
//  Created by Jacob Foster Davis on 5/27/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation
import CoreData

//@objc(UnlockedCharacter)
public class UnlockedCharacter: NSManagedObject {

    convenience init(name: String, datetimeUnlocked: NSDate? = nil, expiresHours: Int? = nil, expiresDays: Int? = nil, context: NSManagedObjectContext){
        
        if let ent = NSEntityDescription.entity(forEntityName: "UnlockedCharacter", in: context) {
            self.init(entity: ent, insertInto: context)
            
            self.name = name
            //if the start time nil, assume it is for now
            if let dateGiven = datetimeUnlocked {
                //they provided a specific date so go with that
                self.datetimeUnlocked = dateGiven
            } else {
                //no date provided, set as time now
                self.datetimeUnlocked = Date() as NSDate
            }
            
            //components for how much time until expires
            var exComponents = DateComponents()
            
            //if they specified a number of hours to expire, set
            if let exHours = expiresHours {
                exComponents.setValue(exHours, for: .hour)
            }
            
            //if they set days
            if let exDays = expiresDays {
                exComponents.setValue(exDays, for: .day)
            }
            
            //if they set neither, give default of 2 days
            if expiresHours == nil && expiresDays == nil {
                exComponents.setValue(2, for: .day)
            }
            
            let date: Date = Date()
            let expirationDate = Calendar.current.date(byAdding: exComponents, to: date)
            
            self.datetimeExpires = expirationDate! as NSDate

        } else {
            fatalError("Unable to find Entity name! (UnlockedCharacter)")
        }
        
    }
    
}
