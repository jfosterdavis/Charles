//
//  ModelController.swift
//  Charles
//
//  Created by Jacob Foster Davis on 5/7/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import UIKit
import CoreData

/*
 A controller object that manages a simple model -- a collection of month names.
 
 The controller serves as the data source for the page view controller; it therefore implements pageViewController:viewControllerBeforeViewController: and pageViewController:viewControllerAfterViewController:.
 It also implements a custom method, viewControllerAtIndex: which is useful in the implementation of the data source methods, and in the initial configuration of the application.
 
 There is no need to actually create view controllers for each page in advance -- indeed doing so incurs unnecessary overhead. Given the data model, these methods create, configure, and return a new view controller on demand.
 */


class ModelController: CoreDataNSObject, UIPageViewControllerDataSource, StoreReactor {

    var pageData: [Character] = []
    var currentVC: DataViewController!
    var rootVC: RootViewController!
    

    let keyUnlockedCharacter = "keyUnlockedCharacter"

    override init() {
        super.init()
        // Create the data model.
        //let dateFormatter = DateFormatter()
        //pageData = dateFormatter.monthSymbols
        //pageData = ["1", "2", "3"]
        
        loadPageData()
        
        //TODO: Prevent duplicates from being entered.  Allow removal of unlocked characters.
        
        
    }
    
    /// considers  hard-coded and CoreData characters and loads them into the data source
    func loadPageData() {
        //setup CoreData.  This will also reorder the characters properly
        _ = setupFetchedResultsController(frcKey: keyUnlockedCharacter, entityName: "UnlockedCharacter", sortDescriptors: [],  predicate: nil)
        
        //add base characters to pageData
        pageData = Characters.NewPlayerCharacterSet
        
        //get any unlocked characters and add them to the model
        guard let fc = frcDict[keyUnlockedCharacter] else {
            return
            
        }
        
        guard let unlockedCharacters = fc.fetchedObjects as? [UnlockedCharacter] else {
            return
        }
        
        print("The currently unlocked characters are:")
        for unlockedCharacter in unlockedCharacters {
            print("\(String(describing: unlockedCharacter.name))")
            //var reverseOrderUnlockableCharacters
            
            for character in Characters.UnlockableCharacters {
                if character.name == unlockedCharacter.name {
                    pageData.append(character)
                    
                }
            }
            
        }
    }
    
    /******************************************************/
    /*******************///MARK: StoreReactor
    /******************************************************/

    /**
     When the store closes, refreshes the pages and data source for the pages
     */
    func storeClosed() {
        //when the store closes, refresh the page data
        loadPageData()
        
        //update the pagecontroller dots.
        //I realize this is not the right way to manipulate the page control
        //TODO: Impliment proper ways to manipulate the page control
        currentVC.numPages = self.pageData.count
        currentVC.refreshPageControl()
        
    }
    
    /******************************************************/
    /*******************///MARK: PageView Controller
    /******************************************************/


    func viewControllerAtIndex(_ index: Int, storyboard: UIStoryboard) -> DataViewController? {
        // Return the data view controller for the given index.
        if (self.pageData.count == 0) || (index >= self.pageData.count) {
            return nil
        }

        // Create a new view controller and pass suitable data.
        let dataViewController = storyboard.instantiateViewController(withIdentifier: "DataViewController") as! DataViewController
        dataViewController.dataObject = self.pageData[index]
        dataViewController.currentPage = index
        dataViewController.numPages = self.pageData.count
        
        //link this VC
        dataViewController.parentVC = self
        currentVC = dataViewController
        
        return dataViewController
    }

    func indexOfViewController(_ viewController: DataViewController) -> Int {
        // Return the index of the given data view controller.
        // For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
        return pageData.index(of: viewController.dataObject) ?? NSNotFound
    }

    // MARK: - Page View Controller Data Source

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController as! DataViewController)
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
            
        index -= 1
        
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController as! DataViewController)
        if index == NSNotFound {
            return nil
        }
        
        index += 1
        if index == self.pageData.count {
            return nil
        }
        
        
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }

}

