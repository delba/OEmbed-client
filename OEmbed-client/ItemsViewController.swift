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
    
    // MARK: - Data
    
    let items: [Item] = (1...10).map { (i: Int) -> Item in
        return Item(title: "Item \(i)")
    }
    
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
        
        navigationItem.title = "Items"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
        
        collectionView!.backgroundColor = UIColor.whiteColor()

        collectionView!.registerClass(ItemCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    // MARK: - UICollectionViewDataSource

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as ItemCell
        
        cell.item = items[indexPath.item]
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let itemVC = ItemViewController()
        itemVC.item = items[indexPath.item]
        
        navigationController?.pushViewController(itemVC, animated: true)
    }
    
}
