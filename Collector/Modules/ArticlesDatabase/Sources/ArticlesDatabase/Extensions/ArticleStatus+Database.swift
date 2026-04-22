//
//  ArticleStatus+Database.swift
//  Collector
//
//  Created by Solid Omit on 7/3/17.
//  Copyright © 2017 Sotech Company. All rights reserved.
//

import Foundation
import Database
import Articles
import FMDB

extension ArticleStatus {
	
	convenience init(articleID: String, dateArrived: Date, row: FMResultSet) {
		let read = row.bool(forColumn: DatabaseKey.read)
		let starred = row.bool(forColumn: DatabaseKey.starred)

		self.init(articleID: articleID, read: read, starred: starred, dateArrived: dateArrived)
	}
	
}

extension ArticleStatus: DatabaseObject {
	
	public var databaseID: String {
		return articleID
	}

	public func databaseDictionary() -> DatabaseDictionary? {
		return [DatabaseKey.articleID: articleID, DatabaseKey.read: read, DatabaseKey.starred: starred, DatabaseKey.dateArrived: dateArrived]
	}
}

