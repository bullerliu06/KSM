//
//  TestMarkArticlesService.swift
//  AccountTests
//
//  Created by Solid Omit on 30/10/19.
//  Copyright © 2019 Sotech Company, LLC. All rights reserved.
//

import XCTest
@testable import Account

//class TestMarkArticlesService: FeedlyMarkArticlesService {
//	
//	var didMarkExpectation: XCTestExpectation?
//	var parameterTester: ((Set<String>, FeedlyMarkAction) -> ())?
//	var mockResult: Result<Void, Error> = .success(())
//	
//	func mark(_ articleIDs: Set<String>, as action: FeedlyMarkAction, completion: @escaping (Result<Void, Error>) -> ()) {
//		
//		DispatchQueue.main.async {
//			self.parameterTester?(articleIDs, action)
//			completion(self.mockResult)
//			self.didMarkExpectation?.fulfill()
//		}
//	}
//}
