//
//  AppDelegate.swift
//  Hypnosister
//
//  Created by Adhithyan Vijayakumar on 28/11/16.
//  Copyright © 2016 Adhithyan Vijayakumar. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let firstFrame = self.window?.bounds
        let firstView = HypnosisView(frame: firstFrame!)
        firstView.backgroundColor = UIColor.white
        
        let logoImage = UIImage(named: "adhi-logo.png")
        let logoImageView = UIImageView(image: logoImage)
        logoImageView.frame = CGRect(x: 0, y: 0, width: 200, height: 150)
        
        self.window?.rootViewController = UIViewController()
        self.window?.addSubview(firstView)
        self.window?.addSubview(logoImageView)
        self.window?.backgroundColor = UIColor.white
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
}

