//
//  Item.swift
//  OEmbed-client
//
//  Created by Damien on 21/03/2015.
//  Copyright (c) 2015 Damien. All rights reserved.
//

import Foundation
import UIKit

public var imagesCache = [String: UIImage]()

class Item {
    let title: String
    let authorName: String
    let authorURL: String
    let description: String
    let duration: Int
    let height: CGFloat
    let width: CGFloat
    let HTML: String
    let isPlus: String
    let providerName: String
    let providerURL: NSURL
    let thumbnailURL: NSURL
    let thumbnailWidth: CGFloat
    let thumbnailHeight: CGFloat
    let type: String
    let URI: String
    let version: String
    let videoID: Int
    
    var thumbnail: UIImage {
        if let image = imagesCache[thumbnailURL.absoluteString!] {
            return image
        } else {
            let data = NSData(contentsOfURL: thumbnailURL)!
            let image = UIImage(data: data)!
            imagesCache[thumbnailURL.absoluteString!] = image
            return image
        }
    }
    
    class func all() -> [Item] {
        let path = NSBundle.mainBundle().pathForResource("item", ofType: "json")!
        let data = NSData(contentsOfFile: path)!
        let json = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as [String: AnyObject]
        
        return (1...10).map { (i: Int) -> Item in
            return Item(data: json)
        }
    }
    
    init(data: [String: AnyObject]) {
        title = data["title"] as String
        authorName = data["author_name"] as String
        authorURL = data["author_url"] as String
        description = data["description"] as String
        duration = data["duration"] as Int
        HTML = data["html"] as String
        height = data["height"] as CGFloat
        width = data["width"] as CGFloat
        thumbnailURL = NSURL(string: data["thumbnail_url"] as String)!
        thumbnailWidth = data["thumbnail_width"] as CGFloat
        thumbnailHeight = data["thumbnail_height"] as CGFloat
        isPlus = data["is_plus"] as String
        providerName = data["provider_name"] as String
        providerURL = NSURL(string: data["provider_url"] as String)!
        type = data["type"] as String
        URI = data["uri"] as String
        version = data["version"] as String
        videoID = data["video_id"] as Int
    }
    
}