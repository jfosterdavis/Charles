//
//  ColorLibrary.swift
//  Charles
//
//  Created by Jacob Foster Davis on 5/26/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation
import UIKit

struct ColorLibrary {
    
    static let Fundamental: [UIColor] = [UIColor.black,
                                         .white,
                                         .red,
                                         .green,
                                         .blue]
    
    static let Primary: [UIColor] = [.red,
                                     .green,
                                     .blue]
    
    ///easy includes primary RGB, black, white, and a single combo of R, G, B to each other
    static let Easy: [UIColor] = [UIColor.black,
                                  .red,
                                  .yellow,
                                  .green,
                                  .cyan,
                                  .white,
                                  .white, //black and white are asy to achieve so put a few of them in here
                                  .black,
                                  .blue,
                                  .magenta
                                  ]
    
    //values for RGB can only be 1, 0, or 0.5
    static let Medium: [UIColor] = [.orange,
                                    .purple,
                                    UIColor(red: 0, green: 0, blue: 0.5, alpha: 1),
                                    UIColor(red: 0, green: 0.5, blue: 0.5, alpha: 1),
                                    //UIColor(red: 0.5, green: 0, blue: 0.5, alpha: 1), //purple
                                    UIColor(red: 0.5, green: 0, blue: 0.5, alpha: 1),
                                    UIColor(red: 0.5, green: 0, blue: 0, alpha: 1),
                                    UIColor(red: 0.5, green: 0.5, blue: 0, alpha: 1),
                                    //UIColor(red: 1, green: 0.5, blue: 0, alpha: 1), //orange
                                    UIColor(red: 1, green: 0.5, blue: 0.5, alpha: 1),
                                    UIColor(red: 1, green: 1, blue: 0, alpha: 1),
                                    UIColor(red: 1, green: 1, blue: 0.5, alpha: 1),
                                    UIColor(red: 1, green: 0.5, blue: 1, alpha: 1),
                                    UIColor(red: 0, green: 1, blue: 1, alpha: 1),
                                    UIColor(red: 0.5, green: 1, blue: 1, alpha: 1),
                                    UIColor(red: 0.5, green: 1, blue: 0.5, alpha: 1)
    ]
    
    
    //returns a UIColor of any RGB combination.  argument precision indicates number of decimal places beyond the tenths place
    static func totallyRandomColor(precision: Int = 1) -> UIColor {
        
        var mutablePrecision = precision
        if mutablePrecision < 1 {
            mutablePrecision = 1
        }
        
        let rand1 = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        let rand2 = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        let rand3 = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        
        let precisionMultiplier = CGFloat(pow(10.0, Double(mutablePrecision)))
        
        let randRed = CGFloat(round(rand1 * precisionMultiplier)/precisionMultiplier)
        let randBlue = CGFloat(round(rand2 * precisionMultiplier)/precisionMultiplier)
        let randGreen = CGFloat(round(rand3 * precisionMultiplier)/precisionMultiplier)
        
        let randUIColor = UIColor(red: randRed, green: randGreen, blue: randBlue, alpha: 1)
        
        return randUIColor
    }
}
