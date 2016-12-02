//
//  ItemStore.swift
//  Homepwner
//
//  Created by Adhithyan Vijayakumar on 01/12/16.
//  Copyright © 2016 Adhithyan Vijayakumar. All rights reserved.
//

import UIKit

class ItemStore: NSObject {
    
    private var privateArray: NSMutableArray
    
    override init() {
        privateArray = NSMutableArray()
    }
    
    func allItems()-> NSArray {
        return privateArray
    }
    
    func createItem()-> BNRItem {
        let item = BNRItem.randomItem()
        NSLog(item.description)
        self.privateArray.add(item)
        
        return item
    }
}
