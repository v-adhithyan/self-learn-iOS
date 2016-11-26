//
//  AppDelegate.swift
//  Quiz
//
//  Created by Adhithyan Vijayakumar on 26/11/16.
//  Copyright © 2016 Adhithyan Vijayakumar. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let viewController: QuizViewController = QuizViewController(nibName: "QuizViewController", bundle: nil)
        self.window?.rootViewController = viewController
        self.window?.backgroundColor = UIColor.white
        self.window?.makeKeyAndVisible()
        return true
    }
}

