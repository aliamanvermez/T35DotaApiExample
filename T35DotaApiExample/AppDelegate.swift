//
//  AppDelegate.swift
//  T35DotaApiExample
//
//  Created by NeonApps on 23.09.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    
    
    var window: UIWindow!
         
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
         // Override point for customization after application launch.
         window = UIWindow(frame: UIScreen.main.bounds)
         window.rootViewController = UINavigationController(rootViewController: ViewController())
        window.makeKeyAndVisible()
        
        
         return true
         
     }



}

