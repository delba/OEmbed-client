//
//  AppDelegate.swift
//  OEmbed-client
//
//  Created by Damien on 21/03/2015.
//  Copyright (c) 2015 Damien. All rights reserved.
//

import UIKit

public var imagesCache = [String: UIImage]()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    lazy var window: UIWindow = {
        let window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window.backgroundColor = UIColor.whiteColor()
        window.rootViewController = self.navigationController
        return window
    }()
    
    lazy var navigationController: UINavigationController = {
        let navigationController = UINavigationController(rootViewController: ItemsViewController())
        navigationController.navigationBar.tintColor = UIColor.blackColor()
        return navigationController
    }()

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window.makeKeyAndVisible()
        return true
    }

}

