//
//  AppDelegate.swift
//  Homepwner
//
//  Created by Adhithyan Vijayakumar on 01/12/16.
//  Copyright © 2016 Adhithyan Vijayakumar. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let itemsViewController = ItemsTableViewController()
        
        let navController = UINavigationController(rootViewController: itemsViewController)
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = navController
        self.window?.backgroundColor = UIColor.white
        self.window?.makeKeyAndVisible()
        
        return true
    }

    
}

