//
//  Item.swift
//  OEmbed-client
//
//  Created by Damien on 21/03/2015.
//  Copyright (c) 2015 Damien. All rights reserved.
//

import Foundation

class Item {
    let title: String
    
    class func all() -> [Item] {
        return (1...10).map { (i: Int) -> Item in
            return Item(title: "Item \(i)")
        }
    }
    
    init(title: String) {
        self.title = title
    }
}