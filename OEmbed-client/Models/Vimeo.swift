//
//  Vimeo.swift
//  OEmbed-client
//
//  Created by Damien on 24/03/2015.
//  Copyright (c) 2015 Damien. All rights reserved.
//

import Foundation
import UIKit

class Vimeo: Item {
    var title: String
    var authorName: String
    let authorURL: String
    let description: String
    let duration: Int
    var height: CGFloat
    var width: CGFloat
    var HTML: String
    let isPlus: String
    let providerName: String
    let providerURL: NSURL
    var thumbnailURL: NSURL
    var thumbnailWidth: CGFloat
    var thumbnailHeight: CGFloat
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
