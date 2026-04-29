//
//  AppDependencyContainer.swift
//  XTApp
//

import UIKit

final class AppDependencyContainer {
    let sessionManager: SessionManaging

    init(sessionManager: SessionManaging = UserSession.shared) {
        self.sessionManager = sessionManager
    }

    func makeRootRouter(window: UIWindow?) -> RootRouter {
        RootRouter(
            window: window,
            mainViewControllerFactory: { XTTabBarController() },
            loginViewControllerFactory: { Self.makeViewController(named: "XTLoginCodeVC") }
        )
    }

    func makeLaunchCoordinator(rootRouter: RootRouting) -> LaunchCoordinator {
        LaunchCoordinator(sessionManager: sessionManager, rootRouter: rootRouter)
    }

    private static func makeViewController(named name: String) -> UIViewController {
        (NSClassFromString(name) as? NSObject.Type)?.init() as? UIViewController ?? UIViewController()
    }
}