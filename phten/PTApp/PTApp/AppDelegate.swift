//
//  AppDelegate.swift
//  PTApp
//

import UIKit

@main
@objc(AppDelegate)
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let launchManager = PTLanuchManager.shared()
        launchManager.startUpAppSDK()
        launchManager.startNetWork()

        let window = UIWindow(frame: UIScreen.main.bounds)
        window.backgroundColor = .white
        window.rootViewController = PTVCRouterManager.shared().rootVC()
        window.makeKeyAndVisible()
        self.window = window

        launchManager.checkLogin()
        return true
    }

    func application(
        _ application: UIApplication,
        continue userActivity: NSUserActivity,
        restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void
    ) -> Bool {
        guard userActivity.activityType == NSUserActivityTypeBrowsingWeb,
              let webpageURL = userActivity.webpageURL,
              webpageURL.host == "www.next-horizon-lendinginc.com",
              PTUserManager.sharedUser().isLogin() else {
            return true
        }

        let params = PTTools.urlParame(from: webpageURL)
        PTVCRouterManager.shared().switchTab(at: 0)
        NotificationCenter.default.post(name: Notification.Name("jumpApp"), object: params)
        return true
    }
}
