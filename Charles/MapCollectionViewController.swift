//
//  MapCollectionViewController.swift
//  Charles
//
//  Created by Jacob Foster Davis on 6/18/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class MapCollectionViewController: CoreDataCollectionViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var mapCollectionView: UICollectionView!
    var collectionViewData: [Level]!
    
    var initialScrollDone = false
    var initialIndexPath: IndexPath!
    var initialLevelToScrollTo = 11
    
    @IBOutlet weak var dismissButton: UIButton!
    
    override func viewDidLoad() {
        self.collectionView = mapCollectionView
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        loadCollectionViewData()
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        if !initialScrollDone {
            self.initialScrollDone = true
            
            self.collectionView.scrollToItem(at: initialIndexPath, at: UICollectionViewScrollPosition.centeredVertically, animated: true)
        }
    }
    
    
    
    /******************************************************/
    /*******************///MARK: UICollectionViewDataSource
    /******************************************************/
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //returns number of items in the collection
        return collectionViewData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MapCell", for: indexPath as IndexPath) as! MapCollectionViewCell
        let level = self.collectionViewData[indexPath.row]
        //get the user level
        
        //based on the user level, populate the data but for those higher than current level set the appearance as setStatusNotAchieved
        
        cell.levelNumberTextLabel.text = String(describing: level.level)
        cell.levelDescriptionTextLabel.text = level.levelDescription
        
        return cell
    
    }
    
    ///loads the data into the collection view data array
    func loadCollectionViewData() {
        
        var levelsArray = [Level]()
        var indexOfInitialLevelToScrollTo = 0
        for (key, value) in Levels.Game {
            //don't add levels 1 - 10
            
            if key >= 11 {
                levelsArray.append(value)
                
                
            }
            
            
        }
        
        //sort the array by level where lowest is last
        levelsArray.sort{$0.level > $1.level}
        
        //now look for item for initial scroll
        for level in levelsArray {
            if level.level == initialLevelToScrollTo {
                indexOfInitialLevelToScrollTo = levelsArray.index(of: level)!
            }
        }
        
        self.collectionViewData = levelsArray
        
        //also set the indexpath for the initial scroll
        initialIndexPath = IndexPath(item: indexOfInitialLevelToScrollTo, section: 0)
    }
    
    /******************************************************/
    /*******************///MARK: Flow Layout
    
    func collectionView(_ collectionView: UICollectionView,
                                 layout collectionViewLayout: UICollectionViewLayout,
                                 sizeForItemAt indexPath: IndexPath) -> CGSize {
        //self.collectionView.collectionViewLayout.invalidateLayout()
        
        let width = 2 * mapCollectionView.bounds.size.width / 3
        let height = width / 1.618  //golden ratio
        return CGSize(width: CGFloat(width), height: CGFloat(height))
    }
    
    ///dismiss button
    @IBAction func dismissButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
