//
//  FeedbinStarredEntry.swift
//  Account
//
//  Created by Solid Omit on 5/15/19.
//  Copyright © 2019 Sotech Company, LLC. All rights reserved.
//

import Foundation

public struct FeedbinStarredEntry: Codable, Sendable {

	public let starredEntries: [Int]
	
	enum CodingKeys: String, CodingKey {
		case starredEntries = "starred_entries"
	}

	public init(starredEntries: [Int]) {
	
		self.starredEntries = starredEntries
	}
}
