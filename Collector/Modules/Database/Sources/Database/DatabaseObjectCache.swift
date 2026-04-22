//
//  DatabaseObjectCache.swift
//  RSDatabase
//
//  Created by Solid Omit on 9/12/17.
//  Copyright © 2017 Sotech Company, LLC. All rights reserved.
//

import Foundation

public final class DatabaseObjectCache {

	private var d = [String: DatabaseObject]()

	public init() {
		//
	}
	public func add(_ databaseObjects: [DatabaseObject]) {

		for databaseObject in databaseObjects {
			self[databaseObject.databaseID] = databaseObject
		}
	}

	public subscript(_ databaseID: String) -> DatabaseObject? {
		get {
			return d[databaseID]
		}
		set {
			d[databaseID] = newValue
		}
	}
}
