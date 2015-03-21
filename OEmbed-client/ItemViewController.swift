//
//  ItemViewController.swift
//  OEmbed-client
//
//  Created by Damien on 21/03/2015.
//  Copyright (c) 2015 Damien. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {
    
    // MARK: - Data
    
    var item: Item!
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = item.title
        
        view.backgroundColor = UIColor.whiteColor()
    }

}
