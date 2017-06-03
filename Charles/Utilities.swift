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

/******************************************************/
/*******************///MARK: Date Extensions
/******************************************************/
//https://stackoverflow.com/questions/27182023/getting-the-difference-between-two-nsdates-in-months-days-hours-minutes-seconds

extension Date {
    /// Returns the amount of years from another date
    func years(from date: Date) -> Int {
        return Calendar.current.dateComponents([.year], from: date, to: self).year ?? 0
    }
    /// Returns the amount of months from another date
    func months(from date: Date) -> Int {
        return Calendar.current.dateComponents([.month], from: date, to: self).month ?? 0
    }
    /// Returns the amount of weeks from another date
    func weeks(from date: Date) -> Int {
        return Calendar.current.dateComponents([.weekOfMonth], from: date, to: self).weekOfMonth ?? 0
    }
    /// Returns the amount of days from another date
    func days(from date: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
    }
    /// Returns the amount of hours from another date
    func hours(from date: Date) -> Int {
        return Calendar.current.dateComponents([.hour], from: date, to: self).hour ?? 0
    }
    /// Returns the amount of minutes from another date
    func minutes(from date: Date) -> Int {
        return Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
    }
    /// Returns the amount of seconds from another date
    func seconds(from date: Date) -> Int {
        return Calendar.current.dateComponents([.second], from: date, to: self).second ?? 0
    }
    /// Returns the a custom time interval description from another date
    func offset(from date: Date) -> String {
        if years(from: date)   > 0 { return "\(years(from: date))y"   }
        if months(from: date)  > 0 { return "\(months(from: date))M"  }
        if weeks(from: date)   > 0 { return "\(weeks(from: date))w"   }
        if days(from: date)    > 0 { return "\(days(from: date))d"    }
        if hours(from: date)   > 0 { return "\(hours(from: date))h"   }
        if minutes(from: date) > 0 { return "\(minutes(from: date))m" }
        if seconds(from: date) > 0 { return "\(seconds(from: date))s" }
        return ""
    }
}

/******************************************************/
/*******************///MARK: Fading in or out
/******************************************************/

enum FadeDirection {
    case `in`
    case out
    case inOrOut
}

extension UIView {
    
    /**
     fades out the UIView.  If a disable flag is supplied, if the view is a UIButton or UITextLabel it will set to enabled or disabled as indicated. resultAlpha is only checked if direction is set to .inOrOut.  If fading .out or to 0 alpha, will be disabled unless otherwise specified.
     */
    func fade(_ direction: FadeDirection, resultAlpha: CGFloat? = nil, disable: Bool? = nil, withDuration: TimeInterval = 0.5, delay: TimeInterval = 0.0, completion: ((Bool) -> Void)? = nil ) {
        
        let endAlpha: CGFloat
        
        
            switch direction {
            case .in:
                endAlpha = 1.0
            case .out:
                endAlpha = 0.0
            case .inOrOut:
                if let resultAlpha = resultAlpha {
                    endAlpha = resultAlpha
                } else {
                    //they didn't specify, so won't change
                    endAlpha = self.alpha
                }
            }
        
        
        UIView.animate(withDuration: withDuration,
                       delay: delay,
                       animations: {
                        self.alpha = endAlpha
        }, completion: {(finished:Bool) in
        
            //check to disable or not
            switch self {
            case is UIButton:
                let myself = self as! UIButton
                if let disable = disable {
                    if disable {
                        myself.isEnabled = false
                    } else {
                        myself.isEnabled  = true
                    }
                } else if endAlpha == 0 { //if this will be going to zero, will be disabled
                    myself.isEnabled = false
                } else { //for any alpha value
                    //set to true
                    myself.isEnabled = true
                }
            case is UILabel:
                let myself = self as! UILabel
                if let disable = disable {
                    if disable {
                        myself.isEnabled = false
                    } else {
                        myself.isEnabled  = true
                    }
                } else if endAlpha == 0 { //if this will be going to zero, will be disabled
                    myself.isEnabled = false
                } else { //for any alpha value
                    //set to true
                    myself.isEnabled = true
                }
            default:
                break
            }
            
            if let completion = completion {
                completion(finished)
            }
            
        })
    }
    
}


/******************************************************/
/*******************///MARK: Rounding Corners
/******************************************************/

extension UIView {
    
        func roundCorners(with radius: Int = 10) {
            self.layer.masksToBounds = true
            let maskLayer = CAShapeLayer()
            
            maskLayer.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.allCorners], cornerRadii: CGSize(width: radius, height: radius)).cgPath
            self.layer.mask = maskLayer
        }
    
}

/******************************************************/
/*******************///MARK: Comparison enum
/******************************************************/

enum MagnitudeComparison {
    case increase
    case decrease
    case noChange
}

/******************************************************/
/*******************///MARK: Number formatting
//adapted from https://stackoverflow.com/questions/29999024/adding-thousand-separator-to-int-in-swift
/******************************************************/

extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        //formatter.groupingSeparator = " "
        formatter.numberStyle = .decimal
        return formatter
    }()
}

extension Integer {
    var formattedWithSeparator: String {
        switch self {
        case let x where x > 1000000000000000:
            return String(describing: "A lot.")
        case let x where x > 1000000000000:
            return String(describing: "\(x/1000000000)T")
        case let x where x > 1000000000:
            return String(describing: "\(x/1000000)B")
        case let x where x > 1000000:
            return String(describing: "\(x/1000)K")
        default:
            return Formatter.withSeparator.string(for: self) ?? ""
        }
    }
}
