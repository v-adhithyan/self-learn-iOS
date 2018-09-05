//
//  ReminderViewController.swift
//  Hypnonerd
//
//  Created by Adhithyan Vijayakumar on 01/12/16.
//  Copyright © 2016 Adhithyan Vijayakumar. All rights reserved.
//

import UIKit

class ReminderViewController: UIViewController {
    
    @IBOutlet var datePicker: UIDatePicker!
    
    override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: Bundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.tabBarItem.title = "Reminder"
        self.tabBarItem.image = UIImage(named: "Time.png")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        NSLog("ReminderViewController loaded it's view ..")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.datePicker.minimumDate = NSDate.init(timeIntervalSinceNow: 60) as Date
    }
    
    @IBAction func addReminder() {
        let date = self.datePicker.date
        NSLog("The date is \(date)")
        
        let notification = UILocalNotification()
        notification.alertBody = "Hypnotize me!"
        notification.fireDate = date
        UIApplication.shared.scheduleLocalNotification(notification)
    }
}
