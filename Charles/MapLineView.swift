//
//  MapLineView.swift
//  Charles
//
//  Created by Jacob Foster Davis on 6/18/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation
import UIKit
@IBDesignable
class MapLineView: UIView {
    
    @IBInspectable var lineColor: UIColor = UIColor.gray
        {
        didSet {}
    }
    
    @IBInspectable var lineWidth: CGFloat = 3
        {
        didSet {}
    }
    
    
    
    override func draw(_ rect: CGRect)
    {
        let aPath = UIBezierPath()
        
        aPath.move(to: CGPoint(x:bounds.size.width / 2, y: 0))
        
        aPath.addLine(to: CGPoint(x:bounds.size.width / 2, y:bounds.size.height))
        aPath.lineWidth = lineWidth
        aPath.close()
        
        //If you want to stroke it with a red color
        lineColor.set()
        aPath.stroke()
        //If you want to fill it as well
        aPath.fill()
    }
}
