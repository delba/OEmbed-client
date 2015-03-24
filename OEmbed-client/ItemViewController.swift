//
//  ItemViewController.swift
//  OEmbed-client
//
//  Created by Damien on 21/03/2015.
//  Copyright (c) 2015 Damien. All rights reserved.
//

import UIKit
import WebKit

class ItemViewController: UIViewController, WKNavigationDelegate {
    
    // MARK: - Data
    
    var item: Item! {
        didSet {
            render()
        }
    }
    
    // MARK: - Subviews
    
    lazy var content: WKWebView = {
        let webView = WKWebView()
        webView.setTranslatesAutoresizingMaskIntoConstraints(false)
        webView.navigationDelegate = self
        webView.opaque = false
        webView.backgroundColor = UIColor.blackColor()
        webView.scrollView.scrollEnabled = false
        return webView
    }()
    
    lazy var itemTitle: UILabel = {
        let label = UILabel()
        label.setTranslatesAutoresizingMaskIntoConstraints(false)
        return label
    }()
    
    lazy var itemAuthor: UILabel = {
        let label = UILabel()
        label.setTranslatesAutoresizingMaskIntoConstraints(false)
        return label
    }()
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Item"
        
        edgesForExtendedLayout = .None
        
        view.backgroundColor = UIColor.whiteColor()
        
        view.addSubview(content)
        view.addSubview(itemTitle)
        view.addSubview(itemAuthor)
        
        updateViewConstraints()
    }
    
    // MARK: - Constraints
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        let views = [
            "content": content,
            "title": itemTitle,
            "author": itemAuthor
        ]
        
        view.addConstraint(NSLayoutConstraint(item: content, attribute: .Height, relatedBy: .Equal, toItem: content, attribute: .Width, multiplier: item.height / item.width, constant: 0))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[content]|", options: nil, metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[content]-[title]-[author]", options: nil, metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[title]|", options: nil, metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[author]|", options: nil, metrics: nil, views: views))
    }
    
    // MARK: - Render
    
    func render() {
        content.loadHTMLString(item.HTML, baseURL: nil)
        itemTitle.text = item.title
        itemAuthor.text = item.authorName
    }
    
    // MARK: - WKNavigationDelegate
    
    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        view.bringSubviewToFront(webView)
    }

}
