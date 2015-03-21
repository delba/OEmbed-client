//
//  ItemCell.swift
//  OEmbed-client
//
//  Created by Damien on 21/03/2015.
//  Copyright (c) 2015 Damien. All rights reserved.
//

import UIKit

class ItemCell: UICollectionViewCell {
    
    // MARK: - Data
    
    var item: Item! {
        didSet {
            render()
        }
    }
    
    // MARK: - Subviews
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.setTranslatesAutoresizingMaskIntoConstraints(false)
        label.backgroundColor = UIColor(white: 1, alpha: 0.5)
        return label
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.blackColor()
        
        addSubview(title)
        
        updateConstraintsIfNeeded()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Constraints
    
    override func updateConstraints() {
        super.updateConstraints()
        
        let views = [
            "title": title
        ]
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[title]", options: nil, metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[title]-|", options: nil, metrics: nil, views: views))
    }
    
    // MARK: - Render
    
    func render() {
        title.text = item.title
    }
}
