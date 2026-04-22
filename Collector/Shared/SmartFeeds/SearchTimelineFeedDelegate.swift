//
//  SearchTimelineFeedDelegate.swift
//  Collector
//
//  Created by Solid Omit on 8/31/19.
//  Copyright © 2019 Sotech Company. All rights reserved.
//

import Foundation
import Account
import Articles
import ArticlesDatabase
import Images

@MainActor struct SearchTimelineFeedDelegate: SmartFeedDelegate {

	var sidebarItemID: SidebarItemIdentifier? {
		return SidebarItemIdentifier.smartFeed(String(describing: SearchTimelineFeedDelegate.self))
	}

	var nameForDisplay: String {
		return nameForDisplayPrefix + searchString
	}

	let nameForDisplayPrefix = NSLocalizedString("Search: ", comment: "Search smart feed title prefix")
	let searchString: String
	let fetchType: FetchType
	var smallIcon: IconImage? = AppAssets.searchFeedImage

	init(searchString: String, articleIDs: Set<String>) {
		self.searchString = searchString
		self.fetchType = .searchWithArticleIDs(searchString, articleIDs)
	}

	func unreadCount(account: Account) async -> Int {

		return 0
	}
}
