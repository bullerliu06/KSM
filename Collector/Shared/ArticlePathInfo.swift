//
//  ArticlePathInfo.swift
//  Collector
//
//  Created by Solid Omit on 3/18/24.
//  Copyright © 2024 Sotech Company. All rights reserved.
//

import Foundation

struct ArticlePathInfo {

	let accountID: String?
	let accountName: String?
	let articleID: String?
	let feedID: String?

	init?(userInfo: [AnyHashable: Any]) {

		guard let articlePathUserInfo = userInfo[UserInfoKey.articlePath] as? [String: String] else {
			return nil
		}

		self.accountID = articlePathUserInfo[ArticlePathKey.accountID]
		self.accountName = articlePathUserInfo[ArticlePathKey.accountName]
		self.articleID = articlePathUserInfo[ArticlePathKey.articleID]
		self.feedID = articlePathUserInfo[ArticlePathKey.feedID]
	}
}
