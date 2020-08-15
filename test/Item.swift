//
//  Item.swift
//  test
//
//  Created by Aldon Smith on 8/14/20.
//  Copyright © 2020 Aldon Smith. All rights reserved.
//

import Foundation

class Item: NSObject, NSCoding {
    var name: String
    
    init?(name: String) {
        self.name = name
        super.init()
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: "name") as! String
        self.init(name: name)
    }
    
    static let Dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    static let ArchiveURL = Dir.appendingPathComponent("items")
}
