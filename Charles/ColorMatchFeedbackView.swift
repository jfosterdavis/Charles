//
//  ColorMatchFeedbackView.swift
//  Charles
//
//  Created by Jacob Foster Davis on 5/26/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation
import UIKit
//@IBDesignable
class ColorMatchFeedbackView:UIView
{
    @IBInspectable var mainColor: UIColor = UIColor.clear
        {
        didSet { print("mainColor was set here") }
    }
    @IBInspectable var objectiveRingColor: UIColor = UIColor.black
        {
        didSet { print("bColor was set here") }
    }
    @IBInspectable var progressRingColor: UIColor = UIColor.black
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
    @IBInspectable var orientationUp: Bool = true
        {
        didSet { print("ringThickness was set here") }
    }

    
    @IBInspectable var isSelected: Bool = true
    var rotateAnimation: CABasicAnimation?
    
    override func draw(_ rect: CGRect)
    {
        
        //if progressRingColor == UIColor.clear {
        //    mainColor = UIColor.clear
        //} else {
        
        mainColor = calculateColorDeviation(color1: objectiveRingColor, color2: progressRingColor)
        mainColor = mainColor.withAlphaComponent(1.0)
        //mainColor = UIColor.purple
        //}
        
        let dotPath = UIBezierPath(ovalIn: rect)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = dotPath.cgPath
        shapeLayer.fillColor = mainColor.cgColor
        layer.addSublayer(shapeLayer)
        
        ringThickness = min( bounds.size.width/4.5, bounds.size.height/4.5)
        
        
        
        
        if (isSelected) { drawObjectiveRing(rect: rect) }
        if (isSelected) { drawProgressRing(rect: rect) }
        
    }
    
    func calculateColorDeviation(color1: UIColor, color2: UIColor) -> UIColor {
//        let newColorR = abs(color1.cgColor.components![0] - color2.cgColor.components![0]) + color1.cgColor.components![0]
//        let newColorG = abs(color1.cgColor.components![1] - color2.cgColor.components![1]) + color1.cgColor.components![1]
//        let newColorB = abs(color1.cgColor.components![2] - color2.cgColor.components![2]) + color1.cgColor.components![2]
        var color1RGBA = [CGFloat](repeating: 0.0, count: 4)
        var color2RGBA = [CGFloat](repeating: 0.0, count: 4)
        
        color1.getRed(&color1RGBA[0], green: &color1RGBA[1], blue: &color1RGBA[2], alpha: &color1RGBA[3])
        color2.getRed(&color2RGBA[0], green: &color2RGBA[1], blue: &color2RGBA[2], alpha: &color2RGBA[3])
        
        
        let newColorR = abs(color1RGBA[0] - color2RGBA[0])
        let newColorG = abs(color1RGBA[1] - color2RGBA[1])
        let newColorB = abs(color1RGBA[2] - color2RGBA[2])
        
        let newColor = UIColor(red: newColorR, green: newColorG, blue:newColorB, alpha: 1.0)
        
        return newColor
    }
    
//        func calculateColorDifference(color1: UIColor, color2: UIColor) -> UIColor {
//    //
//    
//            let newColor = color1 - color2
//            //∫newColor.alpha
//    
//            return newColor
//        }
    
    
    /******************************************************/
    /*******************///MARK: Drawing and Animation
    /******************************************************/

    func setOrientationUp(isUp: Bool) {
        orientationUp = isUp
    }
    
    
    ///sets the orientation flag and removes all rotations
    func resetOrientation() {
        setOrientationUp(isUp: true)
        self.transform = CGAffineTransform.identity
        
    }
    
    func toggleOrientationAndAnimate() {
        
        //if an animation object has already been created, use that instead. pass the value and if it is nil it will handle
        //rotateAnimation = self.rotate(previousAnimation: rotateAnimation)
        rotate180AndPersist()
        setOrientationUp(isUp: !orientationUp)
        
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
//        let newFillColor = calculateColorDeviation(color1: objectiveRingColor, color2: progressRingColor)
//        shapeLayer.fillColor = newFillColor.withAlphaComponent(1.0).cgColor
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
    
    /******************************************************/
    /*******************///MARK: Adding and subracting colors
    /******************************************************/

    ///adds the given color to the progressRingColor and redraws
    func addColorToProgress(color: UIColor) {
        progressRingColor = progressRingColor.withAlphaComponent(1.0) + color.withAlphaComponent(1.0)
        self.setNeedsDisplay()
    }
    
    func subtractColorToProgress(color: UIColor) {
        progressRingColor = (progressRingColor.withAlphaComponent(1.0) - color.withAlphaComponent(1.0)).withAlphaComponent(1.0)
        self.setNeedsDisplay()
    }
    
}
