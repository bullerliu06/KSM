//
//  FeedlyCollectionParserTests.swift
//  AccountTests
//
//  Created by Solid Omit on 29/1/20.
//  Copyright © 2020 Sotech Company, LLC. All rights reserved.
//

import XCTest
@testable import Feedly

final class FeedlyCollectionParserTests: XCTestCase {

	func testParsing() {
		let collection = FeedlyCollection(feeds: [], label: "Test Collection", id: "test/collection/1")
		let parser = FeedlyCollectionParser(collection: collection)
		XCTAssertEqual(parser.folderName, collection.label)
		XCTAssertEqual(parser.externalID, collection.id)
	}
	
	func testSanitization() {
		let name = "Test Collection"
		let collection = FeedlyCollection(feeds: [], label: "<div style=\"direction:rtl;text-align:right\">\(name)</div>", id: "test/collection/1")
		let parser = FeedlyCollectionParser(collection: collection)
		XCTAssertEqual(parser.folderName, name)
		XCTAssertEqual(parser.externalID, collection.id)
	}
}
