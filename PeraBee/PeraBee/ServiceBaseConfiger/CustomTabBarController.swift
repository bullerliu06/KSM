//
//  CustomTabBarController.swift
//  CreditPro
//
//  Created by Sibs on 2024/10/2.
//

import Foundation
import UIKit

let Wids = UIScreen.main.bounds.size.width
let Heis = UIScreen.main.bounds.size.height
let SafeTop = UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0
let SafeBot = UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0
let NavBarHeight = 44.0 + SafeTop
let Scale =   (Wids/375.0)
let tabBarHeight = SafeBot + 60

func rgba(_ r:Double, _ g:Double, _ b:Double, _ a:Double) -> UIColor {
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}

class CustomTabBarController: UITabBarController, UITabBarControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = false
        IQKeyboardManager.shared.resignOnTouchOutside = true
        
        setTaBbar()
        
        let firstViewController = PBEEWonderfullMainWidget()
        firstViewController.view.backgroundColor = .lightGray
        firstViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "tab1")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "tabs1")?.withRenderingMode(.alwaysOriginal))
        
        let secondViewController = PBEEAllSaberListWidget()
        secondViewController.view.backgroundColor = .green
        secondViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "tab2")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "tabs2")?.withRenderingMode(.alwaysOriginal))
        
        let thirdViewController = PBEEAnotherHomeWidget()
        thirdViewController.view.backgroundColor = .red
        thirdViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "tab3")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "tabs3")?.withRenderingMode(.alwaysOriginal))
        
        viewControllers = [firstViewController, secondViewController, thirdViewController]
        
        tabBar.tintColor = .systemBlue
        tabBar.unselectedItemTintColor = .gray
    }
    
    func setTaBbar(){
        let tabBar = self.tabBar
        tabBar.backgroundColor = rgba(254, 255, 228, 1)
        tabBar.layer.cornerRadius = 30
        tabBar.shadowImage = UIImage()
        tabBar.backgroundImage = UIImage()
        tabBar.layer.shadowOpacity = 0.1
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 3)
        tabBar.layer.shadowRadius = 5
        tabBar.isTranslucent = true
        tabBar.tintColor = .green
        tabBar.unselectedItemTintColor = .blue
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let maigin: CGFloat = 20
        var tabFrame = self.tabBar.frame
        tabFrame.size.height = 60
        let saceH = SafeBot + 60
        tabFrame.origin.y = self.view.frame.size.height - saceH
        tabFrame.size.width = self.view.frame.size.width - (maigin * 2)
        tabFrame.origin.x = maigin
        self.tabBar.frame = tabFrame
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        let pageClass = type(of: viewController)
        if PBEEDefaultRunsClearVibs.isLogin {
            return true
        }else {
            if pageClass == PBEEAllSaberListWidget.self || pageClass == PBEEAnotherHomeWidget.self {
                PBEEDefaultRunsClearVibs.toLogin()
                return false
            }else {
                return true
            }
        }
    }
}
