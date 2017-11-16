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
    
    
    /******************************************************/
    /*******************///MARK: Word count a string
    /******************************************************/
    static func wordCount(_ s: String) -> Dictionary<String, Int> {
        let words = s.components(separatedBy: NSCharacterSet.whitespaces)
        var wordDictionary = Dictionary<String, Int>()
        for word in words {
            if let count = wordDictionary[word] {
                wordDictionary[word] = count + 1
            } else {
                wordDictionary[word] = 1
            }
        }
        return wordDictionary
    }
    
    /******************************************************/
    /*******************///MARK: Break a string in half, word aware
    /******************************************************/
    static func getTwoStringsFromOne(_ input: String) -> (String, String) {
        let str = input
        let words = str.components(separatedBy: NSCharacterSet.whitespaces)
        
        let halfLength = words.count / 2
        let firstHalf = words[0..<halfLength].joined(separator: " ")
        let secondHalf = words[halfLength..<words.count].joined(separator: " ")
        
        return (firstHalf, secondHalf)
    }
    
    static func getEasyDurationString(from minutes: Int) -> String {
        
        guard minutes > 60 else {
            return String(describing: "\(minutes) minutes")
        }
        
        
        let remainingMinutes = minutes % 60
        let remainingMinutesString: String
        if remainingMinutes == 0 {
            remainingMinutesString = ""
        } else if remainingMinutes == 1 {
            remainingMinutesString = String(describing: ", \(remainingMinutes) minute")
        } else {
            remainingMinutesString = String(describing: ", \(remainingMinutes) minutes")
        }
        
        let hours = Int(minutes / 60)
        let remainingHours = hours % 24
        var remainingHoursString: String
        if remainingHours == 0 {
            remainingHoursString = ""
        } else if remainingHours == 1 {
            remainingHoursString = String(describing: "\(remainingHours) hour")
        } else {
            remainingHoursString = String(describing: "\(remainingHours) hours")
        }
        
        guard hours >= 24 else {
            
            return String(describing: "\(remainingHoursString)\(remainingMinutesString)")
            
        }
        
        //add a comma to the hours string since it won't be the first item
        if remainingHours > 0 {
            remainingHoursString = ", " + remainingHoursString
        }
        
        let days = Int(hours / 24)
        let remainingDays = days % 365
        var remainingDaysString: String
        if remainingDays == 0 {
            remainingDaysString = ""
        } else if remainingDays == 1 {
            remainingDaysString = String(describing: "\(remainingDays) day")
        } else {
            remainingDaysString = String(describing: "\(remainingDays) days")
        }
        
        
        guard days >= 365 else {
            return String(describing: "\(remainingDaysString)\(remainingHoursString)\(remainingMinutesString)")
        }
        
        //add a comma to the days string since it won't be the first item
        if remainingDays > 0 {
            remainingDaysString = ", " + remainingDaysString
        }
        
        let years = Int(days / 365)
        
        if years == 1 {
            return String(describing: "\(years) year\(remainingDaysString)\(remainingHoursString)\(remainingMinutesString)")
        } else {
            return String(describing: "\(years) years\(remainingDaysString)\(remainingHoursString)\(remainingMinutesString)")
        }
        
        
    }

}

/******************************************************/
/*******************///MARK: Getting topmost viewcontroller
/******************************************************/

func topMostController() -> UIViewController {
    var topController: UIViewController = UIApplication.shared.keyWindow!.rootViewController!
    while (topController.presentedViewController != nil) {
        topController = topController.presentedViewController!
    }
    return topController
}

/******************************************************/
/*******************///MARK: Round Buttons
/******************************************************/

//extension UIButton
//{
//    func roundCorners(corners:UIRectCorner, radius: CGFloat)
//    {
//        let maskLayer = CAShapeLayer()
//        maskLayer.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius)).cgPath
//        self.layer.mask = maskLayer
//    }
//}

/******************************************************/
/*******************///MARK: UIColor Overloading Operators
/******************************************************/


func + (left: UIColor, right: UIColor) -> UIColor {
//    var leftRGBA = [CGFloat](repeating: 0.0, count: 4)
//    var rightRGBA = [CGFloat](repeating: 0.0, count: 4)

//    var leftRGBA0: UnsafeMutablePointer<CGFloat>?
//    var leftRGBA1: UnsafeMutablePointer<CGFloat>?
//    var leftRGBA2: UnsafeMutablePointer<CGFloat>?
//    var leftRGBA3: UnsafeMutablePointer<CGFloat>?
//
//    var rightRGBA0: UnsafeMutablePointer<CGFloat>?
//    var rightRGBA1: UnsafeMutablePointer<CGFloat>?
//    var rightRGBA2: UnsafeMutablePointer<CGFloat>?
//    var rightRGBA3: UnsafeMutablePointer<CGFloat>?
    
    let ciLeft = CIColor(color: left)
    let ciRight = CIColor(color: right)
    
//    left.getRed(leftRGBA0, green: leftRGBA1, blue: leftRGBA2, alpha: leftRGBA3)
//    right.getRed(rightRGBA0, green: rightRGBA1, blue: rightRGBA2, alpha: rightRGBA3)
    
    
//    var newRed = (leftRGBA[0] + rightRGBA[0])
    var newRed = (ciLeft.red + ciRight.red)
    if newRed > 1.0 {
        newRed = 1.0
    }
    
//    var newGreen = (leftRGBA[1] + rightRGBA[1])
    var newGreen = (ciLeft.green + ciRight.green)
    if newGreen > 1.0 {
        newGreen = 1.0
    }
    
//    var newBlue = (leftRGBA[2] + rightRGBA[2])
    var newBlue = (ciLeft.blue + ciRight.blue)
    if newBlue > 1.0 {
        newBlue = 1.0
    }
    
//    var newAlpha = (leftRGBA[3] + rightRGBA[3])
    var newAlpha = (ciLeft.alpha + ciRight.alpha)
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
    let ciLeft = CIColor(color: left)
    let ciRight = CIColor(color: right)
    
    var newRed = (ciLeft.red - ciRight.red)
    if newRed < 1.0 {
        newRed = 0.0
    }
    
    var newGreen = (ciLeft.green - ciRight.green)
    if newGreen < 1.0 {
        newGreen = 0.0
    }
    
    var newBlue = (ciLeft.blue - ciRight.blue)
    if newBlue < 1.0 {
        newBlue = 0.0
    }
    
    var newAlpha = (ciLeft.alpha - ciRight.alpha)
    if newAlpha < 1.0 {
        newAlpha = 0.0
    }
   
    
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
        self.isHidden = false //make sure the damn thing is not hidden
        
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
        }, completion: nil )
        
        let seconds = withDuration + delay
        let secondsInt = Int(seconds)
        let milliseconds = Int((seconds - Double(secondsInt))  * 1000)
        
        let deadline = DispatchTime.now() + DispatchTimeInterval.seconds(secondsInt) + DispatchTimeInterval.milliseconds(milliseconds)
        
        DispatchQueue.main.asyncAfter(deadline: deadline, execute: {
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
                    completion(true)
                }
            
            })
    }
    
}



/******************************************************/
/*******************///MARK: Converting UIViews to UIImages
/******************************************************/
extension UIView {
    
    // Using a function since `var image` might conflict with an existing variable
    // (like on `UIImageView`)
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}

/******************************************************/
/*******************///MARK: Rounding Corners
/******************************************************/

extension UIView {
    
        func roundCorners(with radius: CGFloat = 10) {
            self.layoutIfNeeded()
            self.layer.cornerRadius = radius
            
            self.layer.masksToBounds = true
            //let maskLayer = CAShapeLayer()
            
            //maskLayer.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.allCorners], cornerRadii: CGSize(width: radius, height: radius)).cgPath
            //self.layer.mask = maskLayer
        }
    
}

extension UIView {
    func roundCorners(corners:UIRectCorner, radius: CGFloat) {
        self.layoutIfNeeded()
        
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
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

extension BinaryInteger {
    var formattedWithSeparator: String {
        if let int = self as? Int {
            switch int {
            case let x where x >= 1000000000:
                return String(describing: "A lot.")
//            case let x where x >= 1000000000 && x < 1000000000000:
//                let temp1:Int = x / 100000000 // tens of millions
//                let floatNum:Double = Double(temp1) / 10.0  //billions accurrate to 1 decimal
//                return String(describing: "\(Formatter.withSeparator.string(for: floatNum) ?? "")B")
            case let x where x >= 1000000 && x < 1000000000:
                let temp1:Int = x / 100000 // tens of thousands
                let floatNum:Double = Double(temp1) / 10.0  //millions accurrate to 1 decimal
                return String(describing: "\(Formatter.withSeparator.string(for: floatNum) ?? "")M")
            case let x where x >= 100000 && x < 1000000:
                let temp1:Int = x / 100 // tens of hundreds
                let floatNum:Double = Double(temp1) / 10.0  //thousands accurrate to 1 decimal
                return String(describing: "\(Formatter.withSeparator.string(for: floatNum) ?? "")k")
            default:
                return Formatter.withSeparator.string(for: self) ?? ""
            }
        } else {
            return Formatter.withSeparator.string(for: self) ?? ""
        }
    }
}


