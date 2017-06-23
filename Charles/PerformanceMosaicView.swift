//
//  PerformanceMosaicView.swift
//  Charles
//
//  Created by Jacob Foster Davis on 6/20/17.
//  Copyright © 2017 Zero Mu, LLC. All rights reserved.
//

import Foundation
import UIKit
//@IBDesignable

/******************************************************/
/*******************///MARK: PerformanceMosaic has 144 tiles in a 24x6 (HxW) arrangement
/******************************************************/

class PerformanceMosaicView:UIView
{
    
    @IBInspectable var tileBorderWidth: CGFloat = 1.0
        {
        didSet {}
    }
    @IBInspectable var tileBorderColor: UIColor = .white
        {
        didSet {}
    }
    
    
    @IBInspectable var tileSpacing: CGFloat = 3
        {
        didSet {}
    }
    @IBInspectable var margin: CGFloat = 5
        {
        didSet {}
    }
    
    
    @IBInspectable var cornerRadius: CGFloat = 3
        {
        didSet {}
    }
    
    @IBInspectable var tilesTall: Int = 24
    {
        didSet {}
    }
    @IBInspectable var tilesWide: Int = 6
        {
        didSet {}
    }
    
    
    var tileData: [Int:UIColor]?
    
    override func draw(_ rect: CGRect)
    {
        if let tileData = tileData {
            for (tileNum, tileColor) in tileData {
                drawTile(number: tileNum, withColor: tileColor)
            }
        }
    }
    
    ///draws a single tile with the given fill color at the given order.
    func drawTile(number: Int, withColor color: UIColor) {
        
        //dimensions
        //In a 24x6 arrangement, width = (view width - (2x margin + 5x spacing)) / tilesWide
        let tileWidth = (bounds.width - ( (2 * margin) + ( (CGFloat(tilesWide) - 1) * tileSpacing))) / CGFloat(tilesWide)
        //In a 24x6 arrangement, height = view height - (2x margin + 23x spacing) / tilestall
        let tileHeight = (bounds.height - ( (2 * margin) + ( (CGFloat(tilesTall) - 1) * tileSpacing))) / CGFloat(tilesTall)
        
        //define components
        //always draw from top left to bottom right
        //tiles proceed from left to right, bottom to top
        //assuming bottom row is row 0
        //assumuing first tile is tile 0
        //y = 1xMargin + ((23 - row)x height) + ((23 - row)x spacing)
        let row = getRow(forTileNumber: number)
        let yConstant:CGFloat = CGFloat(tilesTall) - 1 //23
        let yTileHeightComponent = ((yConstant - CGFloat(row)) * tileHeight)
        let yTileSpacingComponent = ((yConstant - CGFloat(row)) * tileSpacing)
        let yStart = margin + yTileHeightComponent + yTileSpacingComponent
        let yStop = yStart + tileHeight
        //x = 1x margin + columnNum x width + columnNum x spacing
        let column = getColumn(forTileNumber: number)
        let xTileWidthComponent = (CGFloat(column) * tileWidth)
        let xTileSpacingComponent = (CGFloat(column) * tileSpacing)
        let xStart = margin + xTileWidthComponent + xTileSpacingComponent
        let xStop = xStart + tileWidth
        
        //create points from components
        let startPoint = CGPoint(x: xStart, y: yStart)
        //let stopPoint = CGPoint(x: xStop, y: yStop)
        let rectangleSize = CGSize(width: tileWidth, height: tileHeight)
        
        //path
        let rectangle = CGRect(origin: startPoint, size: rectangleSize)
        let tilePath = UIBezierPath(roundedRect: rectangle, cornerRadius: self.cornerRadius)
        
        //line width
        tilePath.lineWidth = tileBorderWidth
        
        //set the line
        //tilePath.move(to: startPoint)
        //tilePath.addLine(to: stopPoint)
        
        //draw the line with given color
        tileBorderColor.setStroke()
        tilePath.stroke()
        
        //determine the color fill and fill
        color.setFill()
        tilePath.fill()
        
        self.setNeedsDisplay()
    }
    
    ///returns the row for the given tile number
    func getRow(forTileNumber tileNumber: Int) -> Int {
        //assumes bottom row is 0
        //in a 24x6, row is 24 - floor(tileNumber/6)
        let floored = Int(tileNumber / tilesWide)
        let rowNum = floored
        
        return rowNum
    }
    
    ///returns the column for the given tile number
    func getColumn(forTileNumber tileNumber: Int) -> Int {
        //assumes first column is 0
        //in a 24x6, column is tileNum % 6
        let columnNum = tileNumber % tilesWide
        
        return columnNum
    }
    
    
    
}
