//
//  ColorMatchFeedbackView.swift
//  Charles
//
//  Created by Jacob Foster Davis on 5/26/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation
import UIKit
@IBDesignable
class ColorMatchFeedbackView:UIView
{
    @IBInspectable var mainColor: UIColor = UIColor.clear
        {
        didSet { print("mainColor was set here") }
    }
    @IBInspectable var objectiveRingColor: UIColor = UIColor.clear
        {
        didSet { print("bColor was set here") }
    }
    @IBInspectable var progressRingColor: UIColor = UIColor.clear
        {
        didSet { print("bColor was set here") }
    }
    @IBInspectable var ringThickness: CGFloat = 8
        {
        didSet { print("ringThickness was set here") }
    }
    @IBInspectable var insideRingColor: UIColor = UIColor.clear
        {
        didSet { print("ringThickness was set here") }
    }

    
    @IBInspectable var isSelected: Bool = true
    
    override func draw(_ rect: CGRect)
    {
        
        let dotPath = UIBezierPath(ovalIn: rect)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = dotPath.cgPath
        shapeLayer.fillColor = mainColor.cgColor
        layer.addSublayer(shapeLayer)
        
        ringThickness = min( bounds.size.width/4.5, bounds.size.height/4.5)
        
        
        if progressRingColor == UIColor.clear {
            insideRingColor = UIColor.clear
        } else {
            insideRingColor = calculateColorDifference(color1: objectiveRingColor, color2: progressRingColor)
        }
        
        if (isSelected) { drawObjectiveRing(rect: rect) }
        if (isSelected) { drawProgressRing(rect: rect) }
    }
    
    func calculateColorDifference(color1: UIColor, color2: UIColor) -> UIColor {
//        let newColorR = abs(color1.cgColor.components![0] - color2.cgColor.components![0]) + color1.cgColor.components![0]
//        let newColorG = abs(color1.cgColor.components![1] - color2.cgColor.components![1]) + color1.cgColor.components![1]
//        let newColorB = abs(color1.cgColor.components![2] - color2.cgColor.components![2]) + color1.cgColor.components![2]
        
        let newColorR = abs(color1.cgColor.components![0] - color2.cgColor.components![0])
        let newColorG = abs(color1.cgColor.components![1] - color2.cgColor.components![1])
        let newColorB = abs(color1.cgColor.components![2] - color2.cgColor.components![2])
        
        let newColor = UIColor(red: newColorR, green: newColorG, blue:newColorB, alpha: 1.0)
        
        return newColor
    }
    
    internal func drawObjectiveRing(rect: CGRect)->()
    {
        let halfSize:CGFloat = min( bounds.size.width/2, bounds.size.height/2)
        let desiredLineWidth:CGFloat = ringThickness   // your desired value
        
        let circlePath = UIBezierPath(
            arcCenter: CGPoint(x: halfSize, y: halfSize),
            radius: CGFloat( halfSize - (desiredLineWidth/2) ),
            startAngle: CGFloat(Double.pi),
            endAngle:CGFloat(Double.pi * 2),
            clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        shapeLayer.fillColor = insideRingColor.cgColor
        shapeLayer.strokeColor = objectiveRingColor.cgColor
        shapeLayer.lineWidth = ringThickness
        layer.addSublayer(shapeLayer)
    }
    
    internal func drawProgressRing(rect: CGRect)->()
    {
        let halfSize:CGFloat = min( bounds.size.width/2, bounds.size.height/2)
        let desiredLineWidth:CGFloat = ringThickness   // your desired value
        
        let circlePath = UIBezierPath(
            arcCenter: CGPoint(x: halfSize, y: halfSize),
            radius: CGFloat( halfSize - (desiredLineWidth/2) ),
            startAngle: CGFloat(0),
            endAngle:CGFloat(Double.pi),
            clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        shapeLayer.fillColor = insideRingColor.cgColor
        shapeLayer.strokeColor = progressRingColor.cgColor
        shapeLayer.lineWidth = ringThickness
        layer.addSublayer(shapeLayer)
    }
}
