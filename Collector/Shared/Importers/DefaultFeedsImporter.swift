//
//  DefaultFeedsImporter.swift
//  Collector
//
//  Created by Solid Omit on 8/13/15.
//  Copyright © 2015 Sotech Company, LLC. All rights reserved.
//

import Foundation
import Account

@MainActor struct DefaultFeedsImporter {
	
	static func importDefaultFeeds(account: Account) {

		let defaultFeedsURL = Bundle.main.url(forResource: "DefaultFeeds", withExtension: "opml")!

		Task {
			try? await AccountManager.shared.defaultAccount.importOPML(defaultFeedsURL)
		}
	}
}
