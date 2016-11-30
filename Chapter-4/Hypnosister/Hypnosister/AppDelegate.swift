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
        
        var screenRect = self.window?.bounds
        var bigRect = screenRect
        bigRect?.size.width *= 2.0
        
        let scrollView = UIScrollView(frame: screenRect!)
        self.window?.addSubview(scrollView)
        
        let hypnosisView = HypnosisView(frame: screenRect!)
        scrollView.addSubview(hypnosisView)
        
        screenRect?.origin.x += (screenRect?.size.width)!;
        let anotherView = HypnosisView(frame: screenRect!)
        scrollView.addSubview(anotherView)
        scrollView.contentSize = (bigRect?.size)!
        scrollView.isPagingEnabled = true
        
        self.window?.rootViewController = UIViewController()
        self.window?.backgroundColor = UIColor.white
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
}

