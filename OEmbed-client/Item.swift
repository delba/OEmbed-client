//
//  Item.swift
//  OEmbed-client
//
//  Created by Damien on 21/03/2015.
//  Copyright (c) 2015 Damien. All rights reserved.
//

import Foundation
import UIKit

protocol Item {
    var title: String { get }
    var authorName: String { get }
    var thumbnail: UIImage { get }
    var thumbnailURL: NSURL { get }
    var thumbnailWidth: CGFloat { get }
    var thumbnailHeight: CGFloat { get }
    var HTML: String { get }
    var width: CGFloat { get }
    var height: CGFloat { get }
}

func jsonFor(provider: String) -> [String: AnyObject] {
    let path = NSBundle.mainBundle().pathForResource(provider, ofType: "json")!
    let data = NSData(contentsOfFile: path)!
    return NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as [String: AnyObject]
}

func allItems() -> [Item] {
    let json = [
        jsonFor("vimeo"),
        jsonFor("soundcloud"),
        jsonFor("dailymotion"),
        jsonFor("youtube")
    ]
    
    return (1...20).map { (i: Int) -> Item in
        let n = i % json.count
        switch n {
        case 0:
            return Vimeo(data: json[n])
        case 1:
            return SoundCloud(data: json[n])
        case 2:
            return Dailymotion(data: json[n])
        case 3:
            return YouTube(data: json[n])
        default:
            return Vimeo(data: json[0])
        }
        
    }
}
