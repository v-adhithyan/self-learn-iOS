//
//  HypnosisViewController.swift
//  Hypnonerd
//
//  Created by Adhithyan Vijayakumar on 01/12/16.
//  Copyright © 2016 Adhithyan Vijayakumar. All rights reserved.
//

import UIKit

class HypnosisViewController: UIViewController {
    
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
        let hypnosisView = HypnosisView()
        self.view = hypnosisView
    }
}
