//
//  DataViewController+Perks.swift
//  Charles
//
//  Created by Jacob Foster Davis on 5/30/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation
import UIKit

/******************************************************/
/*******************///MARK: Perks
/******************************************************/

enum UnlockableFeatureStatus {
    ///test
    case unlocked //perk is actively purchased by the user and should be active
    case locked //perk can be purchased but has not
    //case notAvailable //cannot be purchased by the player due to restrictions other than insufficient funds
}

extension DataViewController {
    
    
    ///Checks for the given perk and the given status and returns an empty array (meaning there are no perks matching the given criteria) or an array of the (Perk, UnlockedPerk?) objects.  Main method of finding out if a perk is active or not.  for quick checks you can see if it is not nil, and for more specific needs you can access the returned Perks and UnlockedPerks directly
    func getAllPerks(ofType type: PerkType, withStatus status: UnlockableFeatureStatus) -> [(Perk, UnlockedPerk?)] {
        
        //The perkstore has all the info we need.
        let perkStore = self.storyboard!.instantiateViewController(withIdentifier: "PerkStore") as! PerkStoreCollectionViewController
        
        switch status {
        case .unlocked:
            let unlockedPerks = perkStore.getAllUnlockedPerks()
            if unlockedPerks.isEmpty {
                //no unlocked perks
                return [(Perk, UnlockedPerk?)]()
            } else {
                //for each UnlockedPerk in the array, check for the given PerkType
                var returnablePerkSet = [(Perk, UnlockedPerk?)]()
                let applicablePerkObjects: [Perk] = Perks.UnlockablePerks.filter{$0.type == type}
                for unlockedPerk in unlockedPerks {
                    for perk in applicablePerkObjects {
                        
                        if perk.name == unlockedPerk.name {
                            returnablePerkSet.append((perk, unlockedPerk))
                        }
                        
                    }
                }
                return returnablePerkSet
            }
        case .locked:
            let lockedPerks = perkStore.getAllLockedPerks()
            if lockedPerks.isEmpty {
                //no locked perks
                return [(Perk, UnlockedPerk?)]()
            } else {
                //for each UnlockedPerk in the array, check for the given PerkType
                var returnablePerkSet = [(Perk, UnlockedPerk?)]()
                for perk in lockedPerks {
                    returnablePerkSet.append((perk, nil))
                    return returnablePerkSet
                }
            }
        }
        
        //if you got this far then it must be no results
        return [(Perk, UnlockedPerk?)]()
    }
    
    /******************************************************/
    /*******************///MARK: Synesthesia
    /******************************************************/

    //quickly flashes the background from transparent to not when a button is pressed
    func perkSynesthesiaFireBackgroundBlinker(intensity: Float, fadeInOverSeconds: TimeInterval = 2.0) {
        
        //intensity should be between .1 and 1
        var newIntensity = CGFloat(intensity)
        if intensity > 1 {
            newIntensity = 1
        } else if intensity < 0.1 {
            newIntensity = 0.1
        }
        
        //now half that intensity
        //newIntensity = newIntensity / 2
        //newIntensity = 1
        //if the alpha is already non-zero
        
        //fade in
        self.synesthesiaBackgroundBlinker.fade(.inOrOut,
                       resultAlpha: newIntensity,
                  withDuration: 0.2,
                  delay: 0
                  )
        self.synesthesiaBackgroundBlinkerImageView.fade(.inOrOut,
                                               resultAlpha: newIntensity,
                                               withDuration: 0.2,
                                               delay: 0
        )
        
        let milliseconds = 200
        
        //fade out
        let deadline = DispatchTime.now() + DispatchTimeInterval.milliseconds(milliseconds)
        DispatchQueue.main.asyncAfter(deadline: deadline, execute: {
            self.synesthesiaBackgroundBlinker.fade(.out,
                           withDuration: fadeInOverSeconds,
                           delay: 0
                           )
            
            self.synesthesiaBackgroundBlinkerImageView.fade(.out,
                                                   withDuration: fadeInOverSeconds,
                                                   delay: 0
            )
        })
    }
    
    ///checks the store for expired characters.  If found they are removed and the storeClosed() function is called. Returns true if expired characters were found, false otherwise
    func checkForAndRemoveExpiredPerks() -> [Perk]? {
        
        //create a store object to use its functions for checking if perks have expired
        let perkStoreVC = self.storyboard!.instantiateViewController(withIdentifier: "PerkStore") as! PerkStoreCollectionViewController
        let expiredPerks: [UnlockedPerk] = perkStoreVC.getExpiredPerks()
        
        if !expiredPerks.isEmpty {
            
            //prepare the data for the VC
            var departingPerks = [Perk]()
            for unlockedPerk in expiredPerks {
                for perk in Perks.ValidPerks {
                    if unlockedPerk.name == perk.name {
                        departingPerks.append(perk)
                    }
                }
            }
            
            //there are expired perks.  lock them and reload the modelController
            perkStoreVC.parentVC = self
            perkStoreVC.lockAllExpiredPerks()
            
            
            self.parentVC.storeClosed()
            
            return departingPerks
            
            //open the perk store
            //perkStoreButtonPressed(self)
            
            //invoke the function to mimic functionality as though the store had just closed
            //self.storeClosed()
            
        } else {
            return nil
        }
    }
    
    /******************************************************/
    /*******************///MARK: Adaptation
    /******************************************************/

    func checkForAndApplyAdaptationPerks() {
        let applicableAdaptationPerks = getAllPerks(ofType: .adaptClothing, withStatus: .unlocked)
        
        if !applicableAdaptationPerks.isEmpty {
            //there are perks to apply
            
            //add up all the meta1 & 3
            var portionOfSlotsToAdjust:Double = 0 //meta1
            var likelihoodGoodOptionSelected:Double = 0 //meta3
            
            for perk in applicableAdaptationPerks {
                portionOfSlotsToAdjust += perk.0.meta1 as! Double
                likelihoodGoodOptionSelected += perk.0.meta3 as! Double
            }
            
            //adjust meta1 and 3 to between 0 and 1
            if portionOfSlotsToAdjust > 1 {
                portionOfSlotsToAdjust = 1
            } else if portionOfSlotsToAdjust < 0 {
                portionOfSlotsToAdjust = 0
            }
            if likelihoodGoodOptionSelected > 1 {
                likelihoodGoodOptionSelected = 1
            } else if likelihoodGoodOptionSelected < 0 {
                likelihoodGoodOptionSelected = 0
            }
            
            //find the lowest meta2
            var numberOfTimesToForkAGoodAnswer = 100 //meta2.  For a good solution , how many times to divide the answer
            for perk in applicableAdaptationPerks {
                let perkValue = perk.0.meta2 as! Int
                if perkValue < numberOfTimesToForkAGoodAnswer {
                    numberOfTimesToForkAGoodAnswer = perkValue
                }
                
//                if perk.0 === Perks.Adaptation4 { //if Adaptation4 is found, reset the progress ring to black to make easier for player to actually use solution
//                    objectiveFeedbackView.progressRingColor = .black
//                }
            }
            
            
            
            //determine the number of slots that will be adjusted
            let numberOfSlotsInCharacter = buttonStackView.subviews.count
            var numberOfSlotsToAdjust = Int(Double(numberOfSlotsInCharacter) * portionOfSlotsToAdjust)
            
            //create an array of the slots not yet modified
            var slotsNotYetModified = buttonStackView.subviews
            
            //get a set of color solutions.  This should be replinished when it is depleted
            //make it random if it will be additive of subractive
            let randomAdditive = Utilities.random(range: 0...1)
            var solutionTypeAdditive = false //start with a subtractive, this gives benefit to stacking perks.
            if randomAdditive == 0 {
                solutionTypeAdditive = true
            }
            var solutionSet = [UIColor]()
            
            //for each slot we need to adjust
            while numberOfSlotsToAdjust > 0 {
                //determine if this will be a random color or if it will be a solution set color
                let randomNumber = Utilities.random(range: 1...100)
                
                //pick a random slot
                let randomSlotIndex = Utilities.random(range: 0...(slotsNotYetModified.count - 1))
                let randomSlot = slotsNotYetModified.remove(at: randomSlotIndex)
                
                //if the random number was below the likelihood, then give the player a good solution
                if randomNumber < Int(likelihoodGoodOptionSelected * 100) {
                
                    //check that the solutionSet is not empty and if it is replinish it
                    if solutionSet.isEmpty {
                        //toggle value of the solution type between additive and subtractive
                        if solutionTypeAdditive == true {
                           solutionTypeAdditive = false
                        } else {
                            solutionTypeAdditive = true
                        }
                        
                        if solutionTypeAdditive {
                            solutionSet = getColorSolutionSet(from: objectiveFeedbackView.mainColor, of: .additive, forks: numberOfTimesToForkAGoodAnswer)
                        } else {
                            solutionSet = getColorSolutionSet(from: objectiveFeedbackView.mainColor, of: .subtractive, forks: numberOfTimesToForkAGoodAnswer)
                        }
                    }
                    
                    let randomSolutionIndex = Utilities.random(range: 0...(solutionSet.count - 1))
                    let randomSolutionPiece = solutionSet[randomSolutionIndex]
                    
                    //assign the random slot the color of the random solution set piece
                    randomSlot.backgroundColor = randomSolutionPiece
                    
                    //remove the solution piece we just used so that it isn't reused
                    solutionSet.remove(at: randomSolutionIndex)
                } else {
                    //the player had a bad roll and instead of a legit solution piece gets a random color
                    randomSlot.backgroundColor = ColorLibrary.totallyRandomColor()
                    print("Player given a random color instead of a color as a part of the solution")
                }
                
                
                numberOfSlotsToAdjust -= 1
            }
        
            perkAdaptationFeedbackImageView.alpha = 1
            
        } else {
            perkAdaptationFeedbackImageView.alpha = 0
        }
    }
    
    ///for the given color, returns an array of colors that could be combined to create the given objective color
    func getColorSolutionSet(from objectiveColor: UIColor, of type: ColorSolutionSetType, forks: Int = 1) -> [UIColor] {
        var onlyPickLowerNumber = true
        var onlyAdd = true
        var onlySubtract = false
        var composite = false
        
        var rgb = [CGFloat](repeating: 0.0, count: 4)
        var alpha = [CGFloat](repeating: 0.0, count: 4)
        
        objectiveColor.getRed(&rgb[0], green: &rgb[1], blue: &rgb[2], alpha: &alpha[0])
        
        //Additive: only pick numbers smaller than the objective color, and only add
        //Subtractive: go above or below, only pick subtractive compliments
        //Composite: pick one below and add, pick one from above, then one of any course
        switch type {
        case .additive:
            onlyPickLowerNumber = true
            onlyAdd = true
            onlySubtract = false
            composite = false
            
        case .subtractive:
            onlyPickLowerNumber = false
            onlyAdd = false
            onlySubtract = true
            composite = false
        case .composite:
            onlyPickLowerNumber = false
            onlyAdd = false
            onlySubtract = false
            composite = true
        }
        
        //for additive or subtractive
        switch type {
//        case .composite:
//            //TODO: impliment composite capability
//            //pick one below, add
//            //pick any from above
//            //pick add or above and any operation
//            //will result in 3 colors each fork replacing one
//            
//            break
        default:
            //put the original color in first to seed the loop and forks
            var returnableColors = [UIColor]()
            returnableColors.append(UIColor(red: rgb[0], green: rgb[1], blue: rgb[2], alpha: alpha[0]))
            
            var forksRemaining = forks
            
            //for each fork
            while forksRemaining > 0 {
                //get a random magnitude from a random member of the returnableColors array
                //get a random member of the returnable colors.  The first go thru this should be the objective color
                let randomColorToForkIndex = Utilities.random(range: 0...(returnableColors.count - 1))
                let randomColorToFork = returnableColors[randomColorToForkIndex]
                
                var oldRGB = [CGFloat](repeating: 0.0, count: 4)
                
                randomColorToFork.getRed(&oldRGB[0], green: &oldRGB[1], blue: &oldRGB[2], alpha: &alpha[0])
                
                let newRed: Int
                let newGreen: Int
                let newBlue: Int
                let redCompliment: Int
                let greenCompliment: Int
                let blueCompliment: Int
                
                //if only picking lower numbers (which should be case for an additive type of solution)
                if onlyPickLowerNumber {
                    newRed = getRandomColorMagnitude(for: Int(oldRGB[0] * 255), above: false)
                    newGreen = getRandomColorMagnitude(for: Int(oldRGB[1] * 255), above: false)
                    newBlue = getRandomColorMagnitude(for: Int(oldRGB[2] * 255), above: false)
                    
                    //create a new color from what was just created and add it to the returnableColors
                    returnableColors.append(UIColor(red: CGFloat(Double(newRed)/255.0), green: CGFloat(newGreen)/255.0, blue: CGFloat(newBlue)/255.0, alpha: alpha[0]))
                    
                    //get an additive compliment to the color just created
                    redCompliment = Int(rgb[0] * 255) - newRed
                    greenCompliment = Int(rgb[1] * 255) - newGreen
                    blueCompliment = Int(rgb[2] * 255) - newBlue
                    
                    //create the compliment color from what was just created and add it to the returnableColors
                    returnableColors.append(UIColor(red: CGFloat(Double(redCompliment)/255.0), green: CGFloat(greenCompliment)/255.0, blue: CGFloat(blueCompliment)/255.0, alpha: alpha[0]))
                } else {
                    newRed = getRandomColorMagnitude(for: Int(oldRGB[0] * 255), above: true)
                    newGreen = getRandomColorMagnitude(for: Int(oldRGB[1] * 255), above: true)
                    newBlue = getRandomColorMagnitude(for: Int(oldRGB[2] * 255), above: true)
                    
                    //create a new color from what was just created and add it to the returnableColors
                    returnableColors.append(UIColor(red: CGFloat(Double(newRed)/255.0), green: CGFloat(newGreen)/255.0, blue: CGFloat(newBlue)/255.0, alpha: alpha[0]))
                    
                    //get an additive compliment to the color just created
                    redCompliment = newRed - Int(rgb[0] * 255)
                    greenCompliment = newGreen - Int(rgb[1] * 255)
                    blueCompliment = newBlue - Int(rgb[2] * 255)
                    
                    //create the compliment color from what was just created and add it to the returnableColors
                    returnableColors.append(UIColor(red: CGFloat(Double(redCompliment)/255.0), green: CGFloat(greenCompliment)/255.0, blue: CGFloat(blueCompliment)/255.0, alpha: alpha[0]))
                }
                
                //remove the color used to make this fork (on the first go round this will be the original color)
                //this makes it so that colors are split each time there is a fork
                returnableColors.remove(at: randomColorToForkIndex)
                
                
                //decrement forks
                forksRemaining -= 1
            }
            
            return returnableColors
        }
        
        
    }
    
    ///given a color dimension integer between 0 and 255 and a direction, returns a random number either above or below (or equal) and within the bounds.
    func getRandomColorMagnitude(for magnitude:Int, above: Bool) -> Int {
        var mag = magnitude
        
        //ensure input is between 0 and 255
        if mag < 0 {
            mag = 0
        } else if mag > 255 {
            mag = 255
        }
        var randomMagnitude = 0
        
        if above {
            randomMagnitude = Utilities.random(range: mag...255)
        } else {
            randomMagnitude = Utilities.random(range: 0...mag)
        }
        
        return randomMagnitude
    }
    
    /******************************************************/
    /*******************///MARK: Investment
    /******************************************************/

    ///called when user needs to reap consequences of the Big Payoff expiring.  Will lose 50% of money plus 5% for all other active perks. Will be sent back to level 22.  All Active perks will be expire (locked).
    func investmentCrash(activeInvestmentPerks: [(Perk, UnlockedPerk?)]) {
        
        //tell the player
        // Create a new view controller and pass suitable data.
        let investmentVC = self.storyboard!.instantiateViewController(withIdentifier: "InvestmentCrash") as! InvestmentCrashViewController
        
        present(investmentVC, animated: true, completion: nil)
        
        //take away score
        var fractionToLose: Double = 0.60
        fractionToLose += Double(activeInvestmentPerks.count) * 0.05
        print ("User will lose \(fractionToLose) of all score.")
        let currentScore = getCurrentScore()
        let newScore = currentScore - Int(Double(currentScore) * fractionToLose)
        setCurrentScore(newScore: newScore)
        
        //lock all perks
        //create a store object to use its functions for checking if perks have expired
        let perkStoreVC = self.storyboard!.instantiateViewController(withIdentifier: "PerkStore") as! PerkStoreCollectionViewController
        let activePerks = perkStoreVC.getAllUnlockedPerks()
        for activePerk in activePerks {
            perkStoreVC.lockPerk(unlockedPerk: activePerk)
        }
        
        //reset player level to 22 (looter)
        reducePlayerLevel(to: 22)
        
    }
    
    
    
}

enum ColorSolutionSetType {
    case additive
    case subtractive
    case composite
}
