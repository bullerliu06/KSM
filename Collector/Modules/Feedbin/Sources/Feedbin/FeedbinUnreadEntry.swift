//
//  FeedbinUnreadEntry.swift
//  Account
//
//  Created by Solid Omit on 5/15/19.
//  Copyright © 2019 Sotech Company, LLC. All rights reserved.
//

import Foundation

public struct FeedbinUnreadEntry: Codable, Sendable {

	public let unreadEntries: [Int]
	
	enum CodingKeys: String, CodingKey {
		case unreadEntries = "unread_entries"
	}

	public init(unreadEntries: [Int]) {

		self.unreadEntries = unreadEntries
	}
}
