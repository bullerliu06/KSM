//
//  ReaderAPIUnreadEntry.swift
//  Account
//
//  Created by Solid Omit on 5/28/19.
//  Copyright © 2019 Sotech Company, LLC. All rights reserved.
//

import Foundation

public struct ReaderAPIReferenceWrapper: Codable, Sendable {

	public let itemRefs: [ReaderAPIReference]?
	public let continuation: String?

	enum CodingKeys: String, CodingKey {
		case itemRefs = "itemRefs"
		case continuation = "continuation"
	}
}

public struct ReaderAPIReference: Codable, Sendable {

	public let itemID: String?

	enum CodingKeys: String, CodingKey {
		case itemID = "id"
	}
}
