//
//  TodayFeedDelegate.swift
//  Collector
//
//  Created by Solid Omit on 11/19/17.
//  Copyright © 2017 Sotech Company. All rights reserved.
//

import Foundation
import Articles
import ArticlesDatabase
import Account
import Images

@MainActor struct TodayFeedDelegate: SmartFeedDelegate {

	var sidebarItemID: SidebarItemIdentifier? {
		return SidebarItemIdentifier.smartFeed(String(describing: TodayFeedDelegate.self))
	}
	
	let nameForDisplay = NSLocalizedString("Today", comment: "Today pseudo-feed title")
	let fetchType = FetchType.today(nil)
	var smallIcon: IconImage? {
		return AppAssets.todayFeedImage
	}
	
	func unreadCount(account: Account) async -> Int {

		(try? await account.unreadCountForToday()) ?? 0
	}
}

