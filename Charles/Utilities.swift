//
//  Utilities.swift
//  Charles
//
//  Created by Jacob Foster Davis on 5/9/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation
import UIKit

struct Utilities {
   
    //random number generator
    //http://stackoverflow.com/questions/24058195/what-is-the-easiest-way-to-generate-random-integers-within-a-range-in-swift
    static func random(range: CountableClosedRange<Int>) -> Int {
        return Int(UInt32(range.lowerBound) + arc4random_uniform(UInt32(range.upperBound) - UInt32(range.lowerBound) + UInt32(1)))
    }

}

/******************************************************/
/*******************///MARK: Round Buttons
/******************************************************/

extension UIButton
{
    func roundCorners(corners:UIRectCorner, radius: CGFloat)
    {
        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius)).cgPath
        self.layer.mask = maskLayer
    }
}

/******************************************************/
/*******************///MARK: UIColor Overloading Operators
/******************************************************/


func + (left: UIColor, right: UIColor) -> UIColor {
    var leftRGBA = [CGFloat](repeating: 0.0, count: 4)
    var rightRGBA = [CGFloat](repeating: 0.0, count: 4)
    
    left.getRed(&leftRGBA[0], green: &leftRGBA[1], blue: &leftRGBA[2], alpha: &leftRGBA[3])
    right.getRed(&rightRGBA[0], green: &rightRGBA[1], blue: &rightRGBA[2], alpha: &rightRGBA[3])
    
    var newRed = (leftRGBA[0] + rightRGBA[0])
    if newRed > 1.0 {
        newRed = 1.0
    }
    
    var newGreen = (leftRGBA[1] + rightRGBA[1])
    if newGreen > 1.0 {
        newGreen = 1.0
    }
    
    var newBlue = (leftRGBA[2] + rightRGBA[2])
    if newBlue > 1.0 {
        newBlue = 1.0
    }
    
    var newAlpha = (leftRGBA[3] + rightRGBA[3])
    if newAlpha > 1.0 {
        newAlpha = 1.0
    }
    
//    return UIColor(
//        red: (leftRGBA[0] + rightRGBA[0]) / 2,
//        green: (leftRGBA[1] + rightRGBA[1]) / 2,
//        blue: (leftRGBA[2] + rightRGBA[2]) / 2,
//        alpha: (leftRGBA[3] + rightRGBA[3]) / 2
//    )
    
        return UIColor(
            red: newRed,
            green: newGreen,
            blue: newBlue,
            alpha: newAlpha
        )
}

func - (left: UIColor, right: UIColor) -> UIColor {
    var leftRGBA = [CGFloat](repeating: 0.0, count: 4)
    var rightRGBA = [CGFloat](repeating: 0.0, count: 4)
    
    left.getRed(&leftRGBA[0], green: &leftRGBA[1], blue: &leftRGBA[2], alpha: &leftRGBA[3])
    right.getRed(&rightRGBA[0], green: &rightRGBA[1], blue: &rightRGBA[2], alpha: &rightRGBA[3])
    
    var newRed = (leftRGBA[0] - rightRGBA[0])
    if newRed < 0 {
        newRed = 0.0
    }
    
    var newGreen = (leftRGBA[1] - rightRGBA[1])
    if newGreen < 0 {
        newGreen = 0.0
    }
    
    var newBlue = (leftRGBA[2] - rightRGBA[2])
    if newBlue < 0 {
        newBlue = 0.0
    }
    
    var newAlpha = (leftRGBA[3] - rightRGBA[3])
    if newAlpha < 0 {
        newAlpha = 0.0
    }
    
//    return UIColor(
//        red: abs(leftRGBA[0] - rightRGBA[0]),
//        green: abs(leftRGBA[1] - rightRGBA[1]),
//        blue: abs(leftRGBA[2] - rightRGBA[2]),
//        alpha: newAlpha
//    )
    
    return UIColor(
        red: newRed,
        green: newGreen,
        blue: newBlue,
        alpha: newAlpha
    )
}


/******************************************************/
/*******************///MARK: UIViewExtensions
/******************************************************/

import UIKit

extension UIView {
    func rotate(degrees: Double = 180.0, duration: CFTimeInterval = 1.0, completionDelegate: CAAnimationDelegate? = nil, previousAnimation: CABasicAnimation? = nil) -> CABasicAnimation {
        
        let rads = ((degrees) / 180.0 * Double.pi);
        var rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        
        if let previousAnimation = previousAnimation {
            rotateAnimation = previousAnimation
        } else {
            rotateAnimation.fromValue = 0.0
            rotateAnimation.toValue = CGFloat(rads)
            rotateAnimation.duration = duration
        }

        if let delegate: CAAnimationDelegate = completionDelegate {
            rotateAnimation.delegate = delegate
        }
        
        rotateAnimation.fillMode = kCAFillModeForwards;
        rotateAnimation.isRemovedOnCompletion = false;
        self.layer.add(rotateAnimation, forKey: nil)
        
        return rotateAnimation
    }
    
    ///rotates the view 180 degrees and the view is still there (not an animation that isn't really there
    func rotate180AndPersist() {
        UIView.animate(withDuration: 0.5, animations: ({
            self.transform = self.transform.rotated(by: CGFloat(Double.pi))
        }))
    }
}
