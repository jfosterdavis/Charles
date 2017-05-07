//
//  ModelController.swift
//  Charles
//
//  Created by Jacob Foster Davis on 5/7/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import UIKit

/*
 A controller object that manages a simple model -- a collection of month names.
 
 The controller serves as the data source for the page view controller; it therefore implements pageViewController:viewControllerBeforeViewController: and pageViewController:viewControllerAfterViewController:.
 It also implements a custom method, viewControllerAtIndex: which is useful in the implementation of the data source methods, and in the initial configuration of the application.
 
 There is no need to actually create view controllers for each page in advance -- indeed doing so incurs unnecessary overhead. Given the data model, these methods create, configure, and return a new view controller on demand.
 */


class ModelController: NSObject, UIPageViewControllerDataSource {

    var pageData: [Character] = []


    override init() {
        super.init()
        // Create the data model.
        //let dateFormatter = DateFormatter()
        //pageData = dateFormatter.monthSymbols
        //pageData = ["1", "2", "3"]
        
        //create a test character
        let charles = Character(name: "Charles")
        
        //create some test phrases
        let phrase1 = Phrase(name: "I'm a pimp", likelihood: 50)
        //subphrase
        var subphrase1 = Subphrase(words: "I'm", audio: nil)
        var subphrase2 = Subphrase(words: "a", audio: nil)
        var subphrase3 = Subphrase(words: "pimp", audio: nil)
        //add subprases to the phrase
        phrase1.subphrases = [subphrase1, subphrase2, subphrase3]
        //slots
        var slot1 = Slot(tone: 2700, color: .blue)
        var slot2 = Slot(tone: 2600, color: .black)
        var slot3 = Slot(tone: 2500, color: .green)
        //add slots to phrase
        phrase1.slots = [slot1, slot2, slot3]
        
        let phrase2 = Phrase(name: "I'm a playa", likelihood: 50)
        //subphrase
        subphrase1 = Subphrase(words: "I'm", audio: nil)
        subphrase2 = Subphrase(words: "a", audio: nil)
        subphrase3 = Subphrase(words: "playa", audio: nil)
        //add subprases to the phrase
        phrase2.subphrases = [subphrase1, subphrase2, subphrase3]
        //slots
        slot1 = Slot(tone: 2700, color: .blue)
        slot2 = Slot(tone: 2600, color: .black)
        slot3 = Slot(tone: 2500, color: .green)
        //add slots to phrase
        phrase2.slots = [slot1, slot2, slot3]
        
        //add phrases to character
        charles.phrases = [phrase1, phrase2]
        
        //add character to pageData
        pageData = [charles]
        
    }

    func viewControllerAtIndex(_ index: Int, storyboard: UIStoryboard) -> DataViewController? {
        // Return the data view controller for the given index.
        if (self.pageData.count == 0) || (index >= self.pageData.count) {
            return nil
        }

        // Create a new view controller and pass suitable data.
        let dataViewController = storyboard.instantiateViewController(withIdentifier: "DataViewController") as! DataViewController
        dataViewController.dataObject = self.pageData[index]
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

