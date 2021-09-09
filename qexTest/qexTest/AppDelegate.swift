//
//  AppDelegate.swift
//  qexTest
//
//  Created by Artem  on 01.09.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = MainViewController(networkService: NetworkService())
        window?.makeKeyAndVisible()
        return true
    }

}

