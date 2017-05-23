//
//  CoreDataNSObject.swift
//  Charles
//
//  Created by Jacob Foster Davis on 5/22/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataNSObject: NSObject {
    
    /******************************************************/
    /******************* Properties **************/
    /******************************************************/
    //MARK: - Properties
    
    var frcDict : [String:NSFetchedResultsController<NSFetchRequestResult>] = [:]
    
    var stack: CoreDataStack!
    
    /******************************************************/
    /******************* Life Cycle **************/
    /******************************************************/
    //MARK: - Life Cycle
    
    override init() {
        super.init()
        
        // Get the stack
        let delegate = UIApplication.shared.delegate as! AppDelegate
        stack = delegate.stack
    }
    
    func executeSearch(frcKey: String) {
        if let fc = frcDict[frcKey] {
            do {
                try fc.performFetch()
            } catch let e as NSError {
                print("Error while trying to perform a search: \n\(e)\n\(String(describing: frcDict[frcKey]))")
            }
        }
    }
    
    func setupFetchedResultsController(frcKey: String, entityName: String, sortDescriptors: [NSSortDescriptor]? = nil,  predicate: NSPredicate? = nil) -> NSFetchedResultsController<NSFetchRequestResult> {
        
        //set up stack and fetchrequest
        // Get the stack
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let stack = delegate.stack
        
        // Create Fetch Request
        let fr = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        
        if let sortDescriptors = sortDescriptors {
            fr.sortDescriptors = sortDescriptors
        }
        
        if let predicate = predicate {
            
            fr.predicate = predicate
        }
        
        // Create FetchedResultsController
        let fc = NSFetchedResultsController(fetchRequest: fr, managedObjectContext: stack.context, sectionNameKeyPath: nil, cacheName: nil)
        
        fc.delegate = self
        frcDict[frcKey] = fc
        executeSearch(frcKey: frcKey)
        
        return fc
    }
    
    
    
}


// MARK: - CoreDataCollectionViewController: NSFetchedResultsControllerDelegate

extension CoreDataNSObject: NSFetchedResultsControllerDelegate {
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        //about to make updates.  wrapping actions with updates will allow for animation and auto reloading
        //self.tableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        if anObject is AnyObject {
            
            switch(type) {
            case .insert:
                //from apple documentation
                //self.tableView.insertRows(at: [newIndexPath!], with: UITableViewRowAnimation.automatic)
                
                //TODO: initiate download of terms?
                
                print("case insert")
            case .delete:
                //from apple documentation
                //self.tableView.deleteRows(at: [indexPath!], with: UITableViewRowAnimation.automatic)
                
                print("case delete")
            case .update:
                //from apple documentation
                
                //nothing is needed here because when data is updated the tableView displays datas current state
                print("case update")
            case .move:
                //TODO: move a cell... this may not be needed
                print("case move")
            }
            
            //save
            stack.save()
            
        } else
        {
            
            var doWhat = ""
            switch(type) {
            case .insert:
                
                doWhat = "case insert"
            case .delete:
                
                doWhat = "case delete"
            case .update:
                
                doWhat = "case update"
            case .move:
                //TODO: move a cell... this may not be needed
                doWhat = "case move"
            }
            
            fatalError("Unexpected coreData object attempted to change: \(anObject).  Attempted to \(doWhat)")
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        //finished with updates, allow table view to animate and reload
        //self.tableView.endUpdates()
    }
}
