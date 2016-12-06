//
//  BNRDrawView.swift
//  TouchTracker
//
//  Created by Adhithyan Vijayakumar on 06/12/16.
//  Copyright © 2016 Adhithyan Vijayakumar. All rights reserved.
//

import UIKit

class BNRDrawView: UIView {
    
    var currentLine: BNRLine!
    var finishedLines: NSMutableArray
    var linesInProgress: NSMutableDictionary
    
    override init(frame: CGRect) {
        currentLine = BNRLine()
        finishedLines = NSMutableArray()
        linesInProgress = NSMutableDictionary()
        
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.gray
        self.isMultipleTouchEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func strokeLine(line: BNRLine!) {
        let path = UIBezierPath()
        path.lineWidth = 10
        path.lineCapStyle = CGLineCap.round
        
        if line != nil {
            path.move(to: line.begin)
            path.addLine(to: line.end)
            path.stroke()

        }
    }
    
    override func draw(_ rect: CGRect) {
        UIColor.black.set()
        
        for line in self.finishedLines {
            self.strokeLine(line: line as! BNRLine)
        }
        
        
        if currentLine != nil {
            UIColor.red.set()
            self.strokeLine(line: currentLine!)
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let t = touches.first
        let location = t?.location(in: self)
        
        self.currentLine = BNRLine()
        self.currentLine.begin = location!
        self.currentLine.end = location!
        
        self.setNeedsDisplay()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let t = touches.first
        let location = t?.location(in: self)
        
        self.currentLine.end = location!
        
        self.setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.finishedLines.add(self.currentLine)
        
        self.setNeedsDisplay()
    }
}
