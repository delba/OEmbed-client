//
//  ItemsLayout.swift
//  OEmbed-client
//
//  Created by Damien on 21/03/2015.
//  Copyright (c) 2015 Damien. All rights reserved.
//

import UIKit

class ItemsLayout: UICollectionViewFlowLayout {
    
    // MARK: - Initialization
    
    override init() {
        super.init()
        
        minimumInteritemSpacing = 0
        minimumLineSpacing = 8
        itemSize = {
            let width = UIScreen.mainScreen().bounds.width
            return CGSize(width: width, height: width * 0.5625)
        }()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
