//
//  TestGetStreadIDsService.swift
//  AccountTests
//
//  Created by Solid Omit on 29/10/19.
//  Copyright © 2019 Sotech Company, LLC. All rights reserved.
//

import XCTest
@testable import Account

//final class TestGetStreadIDsService: FeedlyGetStreamIDsService {
//	
//	var mockResult: Result<FeedlyStreamIDs, Error>?
//	var parameterTester: ((FeedlyResourceID, String?, Date?, Bool?) -> ())?
//	var getStreadIDsExpectation: XCTestExpectation?
//	
//	func getStreamIDs(for resource: FeedlyResourceID, continuation: String?, newerThan: Date?, unreadOnly: Bool?, completion: @escaping (Result<FeedlyStreamIDs, Error>) -> ()) {
//		guard let result = mockResult else {
//			XCTFail("Missing mock result. Test may time out because the completion will not be called.")
//			return
//		}
//		parameterTester?(resource, continuation, newerThan, unreadOnly)
//		DispatchQueue.main.async {
//			completion(result)
//			self.getStreadIDsExpectation?.fulfill()
//		}
//	}
//}
