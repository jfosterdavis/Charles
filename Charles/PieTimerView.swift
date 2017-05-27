//
//  PieTimerView.swift
//  Charles
//
//  Created by Jacob Foster Davis on 5/27/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation
import UIKit
//@IBDesignable
class PieTimerView:UIView
{
    @IBInspectable var progressColor: UIColor = UIColor.darkGray
        {
        didSet { print("progressColor was set here") }
    }
    @IBInspectable var circleColor: UIColor = UIColor.gray
        {
        didSet { print("circleColor was set here") }
    }
    
    @IBInspectable var ringThickness: CGFloat = 1.0
        {
        didSet { print("ringThickness was set here") }
    }
    @IBInspectable var fullPie: Bool = true
        {
        didSet { print("ringThickness was set here") }
    }
    
    @IBInspectable var startAngle: Int = 0
        {
        didSet { print("startAngle was set here") }
    }
    @IBInspectable var endAngle: Int = 90
        {
        didSet { print("startAngle was set here") }
    }
    @IBInspectable var percentCrustVisible: CGFloat = 20
        {
        didSet { print("percentCrustVisible was set here") }
    }
 
    
    override func draw(_ rect: CGRect)
    {
        
        let dotPath = UIBezierPath(ovalIn: rect)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = dotPath.cgPath
        shapeLayer.fillColor = circleColor.cgColor
        layer.addSublayer(shapeLayer)
        
        if percentCrustVisible > 100 {
            percentCrustVisible = 100
        } else if percentCrustVisible < 0 {
            percentCrustVisible = 0
        }
        
        if fullPie {
            ringThickness = min(bounds.size.width/2, bounds.size.height/2)
        }
        
        drawProgressRing(rect: rect)
        
    }
    
    
    internal func drawProgressRing(rect: CGRect)->()
    {
        let halfSize:CGFloat = max( bounds.size.width/2, bounds.size.height/2)
        let desiredLineWidth:CGFloat = ringThickness * (1 - (percentCrustVisible/100))  // your desired value
        
        let startAngleRads = CGFloat(Double(startAngle - 90) / 180.0 * Double.pi)
        let endAngleRads = CGFloat(Double(endAngle - 90) / 180.0 * Double.pi)
        
        let circlePath = UIBezierPath(
            arcCenter: CGPoint(x: halfSize, y: halfSize),
            radius: CGFloat( (halfSize - (desiredLineWidth/2))) , //make the slice 80% size of crust
            startAngle: startAngleRads,
            endAngle: endAngleRads,
            clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        //        let newFillColor = calculateColorDeviation(color1: objectiveRingColor, color2: progressRingColor)
        //        shapeLayer.fillColor = newFillColor.withAlphaComponent(1.0).cgColor
        shapeLayer.fillColor = circleColor.cgColor
        shapeLayer.strokeColor = progressColor.cgColor
        shapeLayer.lineWidth = desiredLineWidth
        layer.addSublayer(shapeLayer)
    }
    
    ///sets the procession of the progress pie to the given angle
    func setProgress(angle: Int) {
        var desiredAngle = angle
        
        if desiredAngle > 360 {
            desiredAngle = 360
        } else if desiredAngle < -360 {
            desiredAngle = -360
        }
        
        
        endAngle = desiredAngle
        self.setNeedsDisplay()
    }
    
    ///sets the procession of the progress pie to the given percent of a full rotation
    func setProgress(percent: Float) {
        
        var desiredAngle = 360.0 * percent / 100.0
        
        if desiredAngle > 360 {
            desiredAngle = 360
        } else if desiredAngle < -360 {
             desiredAngle = -360
        }
        
        endAngle = Int(desiredAngle)
        self.setNeedsDisplay()
    }
    
    ///changes the color of the progress pie
    func setProgressColor(color: UIColor) {
        progressColor = color
        
        self.setNeedsDisplay()
    }
    
}
