//
//  DisplayNameProviderProtocol.swift
//  DataModel
//
//  Created by Solid Omit on 7/28/16.
//  Copyright © 2016 Sotech Company, LLC. All rights reserved.
//

import Foundation

extension Notification.Name {

	public static let DisplayNameDidChange = Notification.Name("DisplayNameDidChange")
}

/// A type that provides a name for display to the user.

public protocol DisplayNameProvider {
	
	@MainActor var nameForDisplay: String { get }
}

public extension DisplayNameProvider {

	@MainActor func postDisplayNameDidChangeNotification() {

		NotificationCenter.default.post(name: .DisplayNameDidChange, object: self, userInfo: nil)
	}
}
