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
        
        //let firstFrame = CGRect(x: 160, y: 240, width: 100, height: 150)
        let firstFrame = self.window?.bounds
        let firstView = HypnosisView(frame: firstFrame!)
        firstView.backgroundColor = UIColor.white
        
        
        /*let secondFrame = CGRect(x: 20, y: 30, width: 50, height: 50)
        let secondView = HypnosisView(frame: secondFrame)
        secondView.backgroundColor = UIColor.yellow*/
        
        
        self.window?.rootViewController = UIViewController()
        
        self.window?.addSubview(firstView)
        //self.window?.addSubview(secondView)
        
        self.window?.backgroundColor = UIColor.white
        self.window?.makeKeyAndVisible()
        
        return true
    }

   }

