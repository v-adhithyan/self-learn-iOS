//
//  main.swift
//  RandomItems
//
//  Created by Adhithyan Vijayakumar on 26/11/16.
//  Copyright © 2016 Adhithyan Vijayakumar. All rights reserved.
//

import Foundation

var items: NSMutableArray = NSMutableArray()
items.add("One")
items.add("Two")
items.add("Three")

var bnrItem1 = BNRItem(itemName: "Red Sofa", serialNo: "A123", dateCreated: NSDate(), valueInDollars: 100)

NSLog("\(bnrItem1)")

var bnrItem2 = BNRItem(itemName: "Blue Sofa")
NSLog("\(bnrItem2)")

var randomBnrItem = bnrItem2.randomItem()
NSLog(randomBnrItem.itemName)
NSLog(randomBnrItem.serialNo)

//items.add(randomBnrItem)

for (_, val) in items.enumerated() {
    var item = val as! String
    NSLog(item)
}
