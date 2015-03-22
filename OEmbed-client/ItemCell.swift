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
    
    lazy var thumbnail: UIImageView = {
        let imageView = UIImageView()
        imageView.setTranslatesAutoresizingMaskIntoConstraints(false)
        imageView.contentMode = .ScaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
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
        
        contentView.addSubview(thumbnail)
        thumbnail.addSubview(title)
        
        updateConstraintsIfNeeded()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Constraints
    
    override func updateConstraints() {
        super.updateConstraints()
        
        let views = [
            "thumbnail": thumbnail,
            "title": title
        ]
        
        contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[thumbnail]|", options: nil, metrics: nil, views: views))
        contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[thumbnail]|", options: nil, metrics: nil, views: views))
        
        thumbnail.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[title]", options: nil, metrics: nil, views: views))
        thumbnail.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[title]-|", options: nil, metrics: nil, views: views))
    }
    
    // MARK: - Render
    
    func render() {
        thumbnail.image = item.thumbnail()
        title.text = item.title
    }
}
