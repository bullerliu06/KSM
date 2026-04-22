//
//  ArticleTheme+Notifications.swift
//  ArticleTheme+Notifications
//
//  Created by Solid Omit on 20/09/2021.
//  Copyright © 2021 Sotech Company. All rights reserved.
//

import Foundation

extension Notification.Name {
	static let didBeginDownloadingTheme = Notification.Name("didBeginDownloadingTheme")
	static let didEndDownloadingTheme = Notification.Name("didEndDownloadingTheme")
	static let didFailToImportThemeWithError = Notification.Name("didFailToImportThemeWithError")
}
