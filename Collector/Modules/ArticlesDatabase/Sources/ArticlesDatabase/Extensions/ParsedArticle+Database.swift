//
//  ParsedArticle+Database.swift
//  Collector
//
//  Created by Solid Omit on 9/18/17.
//  Copyright © 2017 Sotech Company. All rights reserved.
//

import Foundation
import Parser
import Articles

extension ParsedItem {
	
	var articleID: String {
		if let s = syncServiceID {
			return s
		}
		// Must be same calculation as for Article.
		return Article.calculatedArticleID(feedID: feedURL, uniqueID: uniqueID)
	}
}
