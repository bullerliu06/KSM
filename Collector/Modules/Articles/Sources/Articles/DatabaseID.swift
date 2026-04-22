//
//  DatabaseID.swift
//  Collector
//
//  Created by Solid Omit on 7/15/17.
//  Copyright © 2017 Sotech Company. All rights reserved.
//

import Foundation
import FoundationExtras
import os

final class DatabaseIDCache: Sendable {

	static let shared = DatabaseIDCache()

	private let databaseIDCache = OSAllocatedUnfairLock(initialState: [String: String]())

	/// Generates — or retrieves from cache — a database-suitable ID based on a String.
	func databaseIDWithString(_ s: String) -> String {

		databaseIDCache.withLock { cache in
			if let identifier = cache[s] {
				return identifier
			}

			// MD5 works because:
			// * It’s fast
			// * Collisions aren’t going to happen with feed data
			let identifier = s.md5String
			cache[s] = identifier
			return identifier
		}
	}
}
