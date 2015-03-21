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
    
    var item: Item! {
        didSet {
            render()
        }
    }
    
    // MARK: - Subviews
    
    lazy var content: UIView = {
        let view = UIView()
        view.setTranslatesAutoresizingMaskIntoConstraints(false)
        view.backgroundColor = UIColor.blackColor()
        return view
    }()
    
    lazy var itemTitle: UILabel = {
        let label = UILabel()
        label.setTranslatesAutoresizingMaskIntoConstraints(false)
        return label
    }()
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = item.title
        
        edgesForExtendedLayout = .None
        
        view.backgroundColor = UIColor.whiteColor()
        
        view.addSubview(content)
        view.addSubview(itemTitle)
        
        updateViewConstraints()
    }
    
    // MARK: - Constraints
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        let views = [
            "content": content,
            "title": itemTitle
        ]
        
        view.addConstraint(NSLayoutConstraint(item: content, attribute: .Height, relatedBy: .Equal, toItem: content, attribute: .Width, multiplier: 2 / 3, constant: 0))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[content]|", options: nil, metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[title]|", options: nil, metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[content]-[title]", options: nil, metrics: nil, views: views))
    }
    
    // MARK: - Render
    
    func render() {
        itemTitle.text = item.title
    }

}
