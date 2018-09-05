//
//  HypnosisView.swift
//  Hypnosister
//
//  Created by Adhithyan Vijayakumar on 28/11/16.
//  Copyright © 2016 Adhithyan Vijayakumar. All rights reserved.
//

import UIKit

class HypnosisView: UIView {
    
    override func draw(_ rect: CGRect) {
        let bounds = self.bounds
        self.backgroundColor = UIColor.clear
        
        var center = CGPoint()
        center.x = (bounds.origin.x + bounds.size.width) / 2.0
        center.y = (bounds.origin.y + bounds.size.height) / 2.0
        
        let maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0
        
        let path = UIBezierPath()
        let endAngle = M_PI * 2
        
        for currentRadius in stride(from: maxRadius, to: 0, by: -20) {
            //move to current centre before drawing circle
            path.move(to: CGPoint(x: center.x + currentRadius, y: center.y))
            path.addArc(withCenter: center, radius: currentRadius, startAngle: 0, endAngle: CGFloat(endAngle), clockwise: true)
            
        }
        
        path.lineWidth = 10
        UIColor.lightGray.setStroke()
        path.stroke()
        
    }
    
}
