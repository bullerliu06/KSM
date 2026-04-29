//
//  LaunchCoordinator.swift
//  XTApp
//

import Foundation

final class LaunchCoordinator {
    private let sessionManager: SessionManaging
    private let rootRouter: RootRouting
    private let notificationCenter: NotificationCenter
    private var logoutObserver: NSObjectProtocol?

    init(
        sessionManager: SessionManaging,
        rootRouter: RootRouting,
        notificationCenter: NotificationCenter = .default
    ) {
        self.sessionManager = sessionManager
        self.rootRouter = rootRouter
        self.notificationCenter = notificationCenter
    }

    func start() {
        bindSessionEventsIfNeeded()
        routeToCurrentSession()
    }

    deinit {
        if let logoutObserver {
            notificationCenter.removeObserver(logoutObserver)
        }
    }

    private func bindSessionEventsIfNeeded() {
        guard logoutObserver == nil else { return }

        logoutObserver = notificationCenter.addObserver(
            forName: .userSessionDidLogout,
            object: nil,
            queue: .main
        ) { [weak self] _ in
            self?.rootRouter.setRoot(.login, animated: false)
        }
    }

    private func routeToCurrentSession() {
        let destination: AppRootDestination = sessionManager.isLoggedIn ? .main : .login
        rootRouter.setRoot(destination, animated: false)
    }
}