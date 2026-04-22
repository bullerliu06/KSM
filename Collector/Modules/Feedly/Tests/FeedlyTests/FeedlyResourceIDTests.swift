//
//  FeedlyResourceIDTests.swift
//  AccountTests
//
//  Created by Solid Omit on 3/10/19.
//  Copyright © 2019 Sotech Company, LLC. All rights reserved.
//

import XCTest
@testable import Feedly

final class FeedlyResourceIDTests: XCTestCase {

	@MainActor func testFeedResourceID() {
		let expectedUrl = "http://sotech.com/atom.xml"
		
		let feedResource = FeedlyFeedResourceID(id: "feed/\(expectedUrl)")
		let urlResource = FeedlyFeedResourceID(id: expectedUrl)
		let otherResource = FeedlyFeedResourceID(id: "whiskey/\(expectedUrl)")
		let invalidResource = FeedlyFeedResourceID(id: "")
		
		XCTAssertEqual(feedResource.url, expectedUrl)
		XCTAssertEqual(urlResource.url, expectedUrl)
		XCTAssertEqual(otherResource.url, otherResource.id)
		XCTAssertEqual(invalidResource.url, invalidResource.id)
	}
}
