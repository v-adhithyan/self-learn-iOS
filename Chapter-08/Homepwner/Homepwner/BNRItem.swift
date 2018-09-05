//
//  BNRItem.swift
//  RandomItems
//
//  Created by Adhithyan Vijayakumar on 26/11/16.
//  Copyright © 2016 Adhithyan Vijayakumar. All rights reserved.
//

import UIKit

class BNRItem: NSObject {

    var itemName: String = ""
    var serialNo: String = ""
    var dateCreated: NSDate
    var valueInDollars: Int = 0
    var itemKey: String = ""
    
    init(itemName: String) {
        self.itemName = itemName
        self.serialNo = ""
        self.dateCreated = NSDate()
        self.valueInDollars = 0
        self.itemKey = NSUUID().uuidString
    }
        
    init(itemName: String, serialNo: String, valueInDollars: Int) {
        self.itemName = itemName
        self.serialNo = serialNo
        self.dateCreated = NSDate()
        self.valueInDollars = valueInDollars
        self.itemKey = NSUUID().uuidString
    }
    
    init(itemName: String, serialNo: String, dateCreated: NSDate, valueInDollars: Int) {
        self.itemName = itemName
        self.serialNo = serialNo
        self.dateCreated = dateCreated
        self.valueInDollars = valueInDollars
        self.itemKey = NSUUID().uuidString
    }
    
    
    static func randomItem()-> BNRItem {
        let randomAdjectiveList: NSArray = ["Fluffy", "Rusty", "Shiny"]
        let randomNumberList: NSArray = ["Bear", "Spork", "Mac"]
        
        let adjectiveIndex = Int(arc4random())  % randomAdjectiveList.count
        let nounIndex = Int(arc4random()) % randomNumberList.count
        
        let randomName = "\(randomAdjectiveList[adjectiveIndex]) \(randomNumberList[nounIndex])"
        
        let randomValue = Int(arc4random()) % 100
        let randomSerialNo = "A\(arc4random() % 26)0"
        
        return BNRItem(itemName: randomName, serialNo: randomSerialNo, valueInDollars: randomValue)
    }
    
    func describe()-> String {
        return "[\(self.itemName) \(self.serialNo)] is valued \(self.valueInDollars) USD on \(self.dateCreated)"
    }
    
}
