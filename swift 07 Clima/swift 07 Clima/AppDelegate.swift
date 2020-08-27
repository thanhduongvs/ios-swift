//
//  AppDelegate.swift
//  swift 07 Clima
//
//  Created by Thanh Duong on 8/26/20.
//  Copyright © 2020 Thanh Duong. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //self.window = UIWindow(frame: UIScreen.main.bounds)
        //self.window?.backgroundColor = UIColor.white
        let viewController = HomeViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.isNavigationBarHidden = true
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        return true
    }


}

