//
//  ItemsViewController.swift
//  OEmbed-client
//
//  Created by Damien on 21/03/2015.
//  Copyright (c) 2015 Damien. All rights reserved.
//

import UIKit

private let reuseIdentifier = "cell"

class ItemsViewController: UICollectionViewController {
    
    // MARK: - Initialization
    
    override init() {
        super.init(collectionViewLayout: ItemsLayout())
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView!.backgroundColor = UIColor.whiteColor()

        collectionView!.registerClass(ItemCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    // MARK: - UICollectionViewDataSource

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as ItemCell
        
        return cell
    }
    
}
