//
//  InsightColorStickView.swift
//  Charles
//
//  Created by Jacob Foster Davis on 6/1/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation
import UIKit
//@IBDesignable
class InsightColorStickView:UIView
{
    @IBInspectable var redPercent: CGFloat = 1.0
        {
        didSet {}
    }
    @IBInspectable var greenPercent: CGFloat = 1.0
        {
        didSet {}
    }
    @IBInspectable var bluePercent: CGFloat = 1.0
        {
        didSet {}
    }
    @IBInspectable var stickWidth: CGFloat = 8.0
        {
        didSet {}
    }
    @IBInspectable var margin: CGFloat = 10.0
        {
        didSet {}
    }
    @IBInspectable var showColors: Bool = true
        {
        didSet {}
    }
    
    override func draw(_ rect: CGRect)
    {
        drawSticks(redPercent: redPercent, greenPercent: greenPercent, bluePercent: bluePercent, stickWidth: stickWidth, showColors: showColors)
    }
    
    fileprivate func drawSticks(redPercent: CGFloat, greenPercent: CGFloat, bluePercent: CGFloat, stickWidth: CGFloat = 8, showColors: Bool = true) {
        
        var redLength: CGFloat = redPercent
        if redLength > 1 {
            redLength = 1
        } else if redLength < 0 {
            redLength = 0
        }
        
        var greenLength: CGFloat = greenPercent
        if greenLength > 1 {
            greenLength = 1
        } else if greenLength < 0 {
            greenLength = 0
        }
        
        var blueLength: CGFloat = bluePercent
        if blueLength > 1 {
            blueLength = 1
        } else if blueLength < 0 {
            blueLength = 0
        }
        
        let stickWidth:CGFloat = stickWidth
        let stickHeight: CGFloat = max(bounds.width, bounds.height) / 2 - (margin * 2)
        let viewCenterX = bounds.width/2
        let viewCenterY = bounds.height/2 + stickWidth - margin
        let circleCompensator = stickWidth - 1
        
        
        //the paths
        let redPath = UIBezierPath()
        let greenPath = UIBezierPath()
        let bluePath = UIBezierPath()
        
        //line width
        redLength = stickHeight * redLength
        redPath.lineWidth = stickWidth
        redPath.move(to: CGPoint(
            x:viewCenterX,
            y:viewCenterY))
        redPath.addLine(to: CGPoint(
            x:viewCenterX,
            y:viewCenterY - redLength - circleCompensator))
        
        
        
        //draw red stroke background
        let redPathBackground = UIBezierPath()
        redPathBackground.lineWidth = redPath.lineWidth + 2
        let redPathBackgroundLength = redLength + 1
        redPathBackground.move(to: CGPoint(
            x:viewCenterX ,
            y:viewCenterY))
        redPathBackground.addLine(to: CGPoint(
            x:viewCenterX ,
            y:viewCenterY - redPathBackgroundLength - circleCompensator))
        UIColor(red: 56/255, green: 56/255, blue: 56/255, alpha: 1).setStroke() //darker gray color
        redPathBackground.stroke()
        
        if showColors {
            if redLength == 0 {
                UIColor.black.setStroke()
            } else {
                UIColor.red.setStroke()
            }
           //lay the red stroke
            redPath.stroke()
        }
        
        
        
        let greenCircleCompensationX = circleCompensator * CGFloat(sin(60 * Double.pi/180))
        let greenCircleCompensationY = circleCompensator * CGFloat(cos(60 * Double.pi/180))
        let greenXAddition = stickHeight * greenLength * CGFloat(sin(60 * Double.pi/180))
        let greenYAddition = stickHeight * greenLength * CGFloat(cos(60 * Double.pi/180))
        greenPath.lineWidth = stickWidth
        greenPath.move(to: CGPoint(
            x:viewCenterX,
            y:viewCenterY))
        greenPath.addLine(to: CGPoint(
            x:viewCenterX + greenXAddition + greenCircleCompensationX,
            y:viewCenterY + greenYAddition + greenCircleCompensationY))
        
        
        //green background
        let greenPathBackground = UIBezierPath()
        greenPathBackground.lineWidth = greenPath.lineWidth + 2
        let greenPathBackgroundXAddition = greenXAddition + 1 * CGFloat(sin(60 * Double.pi/180))
        let greenPathBackgroundYAddition = greenYAddition + 1 * CGFloat(cos(60 * Double.pi/180))
        greenPathBackground.move(to: CGPoint(
            x:viewCenterX,
            y:viewCenterY))
        greenPathBackground.addLine(to: CGPoint(
            x:viewCenterX + greenPathBackgroundXAddition + greenCircleCompensationX,
            y:viewCenterY + greenPathBackgroundYAddition + greenCircleCompensationY))
        UIColor(red: 56/255, green: 56/255, blue: 56/255, alpha: 1).setStroke() //darker gray color
        greenPathBackground.stroke()
        
        if showColors {
            if greenLength == 0 {
                UIColor.black.setStroke()
            } else {
                UIColor.green.setStroke()
            }
            greenPath.stroke()

        }
        
        
        let blueXAddition = stickHeight * blueLength * CGFloat(sin(60 * Double.pi/180)) * -1
        let blueYAddition = stickHeight * blueLength * CGFloat(cos(60 * Double.pi/180))
        bluePath.lineWidth = stickWidth
        bluePath.move(to: CGPoint(
            x:viewCenterX,
            y:viewCenterY))
        bluePath.addLine(to: CGPoint(
            x:viewCenterX + blueXAddition - greenCircleCompensationX,
            y:viewCenterY + blueYAddition + greenCircleCompensationY))
        
        
        //blue background
        let bluePathBackground = UIBezierPath()
        bluePathBackground.lineWidth = bluePath.lineWidth + 2
        let bluePathBackgroundXAddition = blueXAddition - 1 * CGFloat(sin(60 * Double.pi/180))
        let bluePathBackgroundYAddition = blueYAddition + 1 * CGFloat(cos(60 * Double.pi/180))
        bluePathBackground.move(to: CGPoint(
            x:viewCenterX,
            y:viewCenterY))
        bluePathBackground.addLine(to: CGPoint(
            x:viewCenterX + bluePathBackgroundXAddition - greenCircleCompensationX,
            y:viewCenterY + bluePathBackgroundYAddition + greenCircleCompensationY))
        UIColor(red: 56/255, green: 56/255, blue: 56/255, alpha: 1).setStroke() //darker gray color
        bluePathBackground.stroke()
        
        if showColors {
            if blueLength == 0 {
                UIColor.black.setStroke()
            } else {
                UIColor.blue.setStroke()
            }
            bluePath.stroke()
        }
        
        
        
        //circle center
        let circlePath = UIBezierPath(
            arcCenter: CGPoint(x: viewCenterX, y: viewCenterY),
            radius: circleCompensator - 1,
            startAngle: CGFloat(0),
            endAngle:CGFloat(2 * Double.pi),
            clockwise: true)
        if redPercent + bluePercent + greenPercent == 0 {
            UIColor.black.setFill()
        } else {
            UIColor.gray.setFill()
        }
        
        circlePath.fill()
    }
    
    
    ///draws the InsightColorStickView with the given percentages, each a CGFloat from 0 to 1
    func drawSticks(redPercent: CGFloat, greenPercent: CGFloat, bluePercent: CGFloat, showColors: Bool = true) {
        self.redPercent = redPercent
        self.greenPercent = greenPercent
        self.bluePercent = bluePercent
        self.showColors = showColors
        self.setNeedsDisplay()
    }
   
    
}
