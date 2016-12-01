//
//  HypnosisViewController.swift
//  Hypnonerd
//
//  Created by Adhithyan Vijayakumar on 01/12/16.
//  Copyright © 2016 Adhithyan Vijayakumar. All rights reserved.
//

import UIKit

class HypnosisViewController: UIViewController, UITextFieldDelegate {
    
    override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: Bundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.tabBarItem.title = "Hypnotize"
        self.tabBarItem.image = UIImage(named: "Hypno.png")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        NSLog("HypnosisViewController loaded it's view ..")
    }
    
    override func loadView() {
        let frame = UIScreen.main.bounds
        let hypnosisView = HypnosisView(frame: frame)
        
        let textFieldRect = CGRect(x: 40, y: 70, width: 240, height: 30)
        let textField = UITextField(frame: textFieldRect)
        textField.borderStyle = UITextBorderStyle.roundedRect
        textField.placeholder = "Hypnotize me"
        textField.returnKeyType = UIReturnKeyType.done
        textField.delegate = self
        
        hypnosisView.addSubview(textField)
        
        self.view = hypnosisView
        self.view.backgroundColor = UIColor.white
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.drawHypnoticMessage(message: textField.text!)
        
        textField.text = ""
        textField.resignFirstResponder()
        
        return true
    }
    
    func drawHypnoticMessage(message: String) {
        
        for _ in stride(from: 1, to: 20, by: 1) {
            let messageLabel = UILabel()
            messageLabel.backgroundColor = UIColor.clear
            messageLabel.textColor = UIColor.brown
            messageLabel.text = message
            messageLabel.sizeToFit()
            
            let width = Int(self.view.bounds.size.width - messageLabel.bounds.size.width)
            let x = Int(arc4random()) % width
            
            let height = Int(self.view.bounds.size.height - messageLabel.bounds.size.height)
            let y = Int(arc4random()) % height
            
            var frame = messageLabel.frame
            frame.origin = CGPoint(x: x, y: y)
            messageLabel.frame = frame
            
            self.view.addSubview(messageLabel)
            
            // add motion effect
            // parallax effect
            // on tilting, an elevation can be seen
            // tilt along x axis
            var motionEffect = UIInterpolatingMotionEffect(keyPath: "center.x", type: UIInterpolatingMotionEffectType.tiltAlongHorizontalAxis)
            motionEffect.minimumRelativeValue = -25
            motionEffect.maximumRelativeValue = 25
            messageLabel.addMotionEffect(motionEffect)
            
            // tilt along y axis
            motionEffect = UIInterpolatingMotionEffect(keyPath: "center.y", type: UIInterpolatingMotionEffectType.tiltAlongVerticalAxis)
            motionEffect.minimumRelativeValue = -25
            motionEffect.maximumRelativeValue = 25
            messageLabel.addMotionEffect(motionEffect)
        }
        
    }
}
