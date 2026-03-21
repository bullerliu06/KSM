//
//  AppDelegate.swift
//  PeraBee
//
//  Created by Sibs on 2024/10/3.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    static var tabVC = CustomTabBarController()
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        window = UIWindow(frame: UIScreen.main.bounds)
                
        let rootNavigationController = UINavigationController(rootViewController: AppDelegate.tabVC)
        
        window?.rootViewController = rootNavigationController
        
        PBEEFireManWorkLates.kimos.startNetworkMonitor()
        return true
    }
}

