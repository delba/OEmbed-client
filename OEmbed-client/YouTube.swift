//
//  YouTube.swift
//  OEmbed-client
//
//  Created by Damien on 24/03/2015.
//  Copyright (c) 2015 Damien. All rights reserved.
//

import Foundation
import UIKit

class YouTube: Item {
    var title: String
    var authorName: String
    var thumbnailWidth: CGFloat
    var thumbnailHeight: CGFloat
    var thumbnailURL: NSURL
    var HTML: String
    var width: CGFloat
    var height: CGFloat
    
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
    
    init(data: [String: AnyObject]) {
        title = data["title"] as String
        authorName = data["author_name"] as String
        thumbnailURL = NSURL(string: data["thumbnail_url"] as String)!
        thumbnailHeight = data["thumbnail_height"] as CGFloat
        thumbnailWidth = data["thumbnail_width"] as CGFloat
        HTML = data["html"] as String
        width = data["width"] as CGFloat
        height = data["height"] as CGFloat
    }
    
}
