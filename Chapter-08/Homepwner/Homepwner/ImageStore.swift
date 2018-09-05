//
//  ImageStore.swift
//  Homepwner
//
//  Created by Adhithyan Vijayakumar on 06/12/16.
//  Copyright © 2016 Adhithyan Vijayakumar. All rights reserved.
//

import UIKit

class ImageStore: NSObject {

    static let sharedStore: ImageStore = ImageStore()
    
    let dictionary: NSMutableDictionary = NSMutableDictionary()
    
    static func getSharedStore()-> ImageStore {
        return sharedStore
    }
    
    func setImage(image: UIImage, key: String) {
        self.dictionary[key] = image
    }
    
    func imageForKey(key: String)-> Any? {
        return self.dictionary[key]
    }
    
    func deleteObjectForKey(key: String) {
        self.dictionary.removeObject(forKey: key)
    }
    
}
