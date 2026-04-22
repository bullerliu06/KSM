//
//  WidgetData.swift
//  Collector
//
//  Created by Solid Omit on 18/11/20.
//  Copyright © 2020 Sotech Company. All rights reserved.
//

import Foundation

struct WidgetData: Codable {
	
	let currentUnreadCount: Int
	let currentTodayCount: Int
	let currentStarredCount: Int
	let unreadArticles: [LatestArticle]
	let starredArticles: [LatestArticle]
	let todayArticles: [LatestArticle]
	let lastUpdateTime: Date
	
}

struct LatestArticle: Codable, Identifiable {
	
	var id: String
	let feedTitle: String
	let articleTitle: String?
	let articleSummary: String?
	let feedIcon: Data? // Base64 encoded image data
	let pubDate: String
	
}
