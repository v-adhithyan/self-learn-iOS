//
//  AppDelegate.swift
//  Hypnonerd
//
//  Created by Adhithyan Vijayakumar on 30/11/16.
//  Copyright © 2016 Adhithyan Vijayakumar. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UIScrollViewDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let hyponosisViewController = HypnosisViewController(nibName: nil, bundle: nil)
    
        let appBundle = Bundle.main
        let reminderViewController = ReminderViewController(nibName: "ReminderViewController", bundle: appBundle)
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [hyponosisViewController, reminderViewController]
        
        self.window?.rootViewController = tabBarController
        self.window?.backgroundColor = UIColor.white
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
}

