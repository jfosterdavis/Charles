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
    
    let lookAheadClue = 10 //How many levels ahead can the player know a clue will be given
    let lookAheadClueRead = 1 //How many levels ahead can the player read the clue
    let lookAheadSuccessFailureCriteria = 3 //How many levels ahead acn the player see the success and failure criteria
    
    //coreData keys
    let keyXP = "keyXP"
    
    override func viewDidLoad() {
        self.collectionView = mapCollectionView
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        //setupCoreData FRCs
        _ = setupFetchedResultsController(frcKey: keyXP, entityName: "XP", sortDescriptors: [],  predicate: nil)
        
        loadCollectionViewData()
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        dismissButton.roundCorners(with: 5)
        
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
        
        //get the user currentlevel
        let userLevelJustPassed = initialLevelToScrollTo
        
        //cells need the storyboard to launch clues
        cell.storyboard = self.storyboard
        
        
        
        //check to see if a clue is applicable for this cell
        if let clue = Clues.Lineup[level.level] {
            cell.clue = clue
        } else {
            cell.clue = nil
        }
        
        //based on the user level, populate the data but for those higher than current level set the appearance as setStatusNotAchieved
        cell.loadAppearance(from: level)
        
        //load the stats
        //total score
        cell.scoreValueTextLabel.text = String(describing: getTotalPointsEarned(forLevel: level.level).formattedWithSeparator)
        let totalPuzzlesCompleted = getTotalPuzzlesCompleted(forLevel: level.level)
        cell.puzzlesValueTextLabel.text = String(describing: totalPuzzlesCompleted.formattedWithSeparator)
        let avgMatchScore = getAvgMatchScore(forLevel: level.level)
        let formattedMatchScore = Float(Int(avgMatchScore * 1000)) / 10.0
        cell.matchRateValueTextLabel.text = String(describing: "\(formattedMatchScore)%")
        
        if level.level > userLevelJustPassed {
            cell.setStatusNotAchieved()
            
            //now check to see if any future levels have look-aheads
            //can the player see that there is a clue
            if level.level > userLevelJustPassed && level.level <= userLevelJustPassed + lookAheadClue {
                cell.setStatusNotAchievedButCluesOnly()
            }
            
            //can the player read the clue if present
            if level.level > userLevelJustPassed && level.level <= userLevelJustPassed + lookAheadClueRead {
                cell.setStatusNotAchievedButCluesOnly(enabled: true)
            }
            
            //can the player see the success and failure stats
            if level.level > userLevelJustPassed && level.level <= userLevelJustPassed + lookAheadSuccessFailureCriteria {
                cell.replaceStatsLabelsWithCriteriaAndShow(from: level)
                
                //set the statistics
                let successPercent = Int(level.successThreshold * 100)
                cell.puzzlesValueTextLabel.text = String(describing: "\(successPercent)%")
                let failurePercent = Int(level.punishThreshold * 100)
                cell.scoreValueTextLabel.text = String(describing: "\(failurePercent)%")
                
            }
            
        } else {
            //set the color of this cell because user has completed this level
            
            cell.backgroundColor = getColorFromStats(forLevel: level.level, avgMatchScore: avgMatchScore, numPuzzlesCompleted: totalPuzzlesCompleted)
        }
        
        return cell
    
    }
    
    ///loads the data into the collection view data array
    func loadCollectionViewData() {
        
        var levelsArray = [Level]()
        var indexOfInitialLevelToScrollTo = 0
        for (key, value) in Levels.Game {
            
            if key >= 1 {
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
        
        let width = 4 * mapCollectionView.bounds.size.width / 5
        let height = width / 1.618  //golden ratio
        return CGSize(width: CGFloat(width), height: CGFloat(height))
    }
    
    ///dismiss button
    @IBAction func dismissButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /******************************************************/
    /*******************///MARK: Statistics Calculators
    /******************************************************/
    
    ///calculates the total points the player earned, includes negative earns, for the given level
    func getTotalPointsEarned(forLevel levelNum:Int) -> Int {
        guard let fc = frcDict[keyXP] else {
            //TODO: log error
            fatalError("Counldn't get FRCDict")
            
        }
        
        guard let xps = fc.fetchedObjects as? [XP] else {
            //TODO: log error
            fatalError("Counldn't get XP")
        }
        
        //create array of XP objects for the given level
        let applicableXP = xps.filter{$0.level == Int64(levelNum)}
        //sum the score attributes of each object
        var scoreTally = 0
        for xp in applicableXP {
            scoreTally += Int(xp.score)
        }
        
        return scoreTally
    }
    
    ///calculates the total points the player earned, includes negative earns, for the given level
    func getTotalPuzzlesCompleted(forLevel levelNum:Int) -> Int {
        guard let fc = frcDict[keyXP] else {
            //TODO: log error
            fatalError("Counldn't get FRCDict")
            
        }
        
        guard let xps = fc.fetchedObjects as? [XP] else {
            //TODO: log error
            fatalError("Counldn't get XP")
        }
        
        //create array of XP objects for the given level
        let applicableXP = xps.filter{$0.level == Int64(levelNum)}
        //sum the score attributes of each object
        var recordsTally = 0
        for xp in applicableXP {
            //if the consolidatedRecords is nil or zero, count it once.  Otherwise use the number in consolidatedRecords, which is supposed to be the number of records represented by the (consolidated) record
//            if let numRecords = xp.consolidatedRecords {
                let numRecords = xp.consolidatedRecords
                //records is not nil
                //check if it is zero
                if numRecords == 0 {
                    recordsTally += 1 //just count this one record
                } else {
                    //this appears to be a consolidated record, so add the consolidatedRecords
                    recordsTally += Int(numRecords)
                }
                
//            } else {
//                recordsTally += 1
//            }
            
            
        }
        
        return recordsTally
    }
    
    ///calculates the average match score for the given level
    func getAvgMatchScore(forLevel levelNum:Int) -> Float {
        guard let fc = frcDict[keyXP] else {
            //TODO: log error
            fatalError("Counldn't get FRCDict")
            
        }
        
        guard let xps = fc.fetchedObjects as? [XP] else {
            //TODO: log error
            fatalError("Counldn't get XP")
        }
        
        //create array of XP objects for the given level
        let applicableXP = xps.filter{$0.level == Int64(levelNum)}
        //sum the score attributes of each object
        var recordsTally = 0
        var successScoreSum: Float = 0
        for xp in applicableXP {
            
            let numRecords = xp.consolidatedRecords
            
            //check if it is zero
            if numRecords == 0 {
                recordsTally += 1 //just count this one record
                successScoreSum += xp.successScore
            } else {
                //this appears to be a consolidated record, so add the consolidatedRecords
                recordsTally += Int(numRecords)
                successScoreSum += xp.successScore * Float(numRecords)
            }
            
        }
                
        if applicableXP.count > 0 {
            let avgSuccessScore = successScoreSum / Float(recordsTally)
        
            return avgSuccessScore
        } else {
            return 0
        }
    }
    
    ///calculates the color of the cell based on two stats: accuracy and number of puzzles completed
    func getColorFromStats(forLevel levelNum: Int, avgMatchScore: Float, numPuzzlesCompleted: Int) -> UIColor {
        //match score (accuracy) will be red dimension.  100% red is for 0% match rate, 0% red for 100% match rate
        let redComponent:CGFloat
        if avgMatchScore == 0 {
            //in case there is a 0% match score, which should never happen really
            redComponent = 255
            
        } else {
            redComponent = CGFloat(255 - Int(255.0 * avgMatchScore))
        }
        
        //puzzlesCompleted will be green dimension.  100% green = num steps for the given level.  0% = 10x number of steps for that level
        let levelSteps = Levels.Game[levelNum]!.xPRequired!
        let levelStepsx5 = levelSteps * 5
        let levelStepsDifference = levelStepsx5 - levelSteps
        
        let greenComponent: CGFloat
        if numPuzzlesCompleted <= levelSteps {
            greenComponent = 255
        } else if numPuzzlesCompleted >= levelStepsx5 {
            greenComponent = 0
        } else {
            greenComponent = CGFloat(255 - (255 * Int(CGFloat(numPuzzlesCompleted - levelSteps) / CGFloat(levelStepsDifference))))
        }
        
        let resultantColor = UIColor(red: redComponent/255.0, green: greenComponent/255.0, blue: 0, alpha: 1)
        
        return resultantColor
    }
    
}
