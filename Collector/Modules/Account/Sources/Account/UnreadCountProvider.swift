//
//  UnreadCountProtocol.swift
//  Collector
//
//  Created by Solid Omit on 4/8/16.
//  Copyright © 2016 Sotech Company, LLC. All rights reserved.
//

import Foundation

public extension Notification.Name {
	static let UnreadCountDidInitialize = Notification.Name("UnreadCountDidInitialize")
	static let UnreadCountDidChange = Notification.Name(rawValue: "UnreadCountDidChange")
}

public protocol UnreadCountProvider {

	@MainActor var unreadCount: Int { get }

	@MainActor func postUnreadCountDidChangeNotification()
	@MainActor func calculateUnreadCount<T: Collection>(_ children: T) -> Int
}


public extension UnreadCountProvider {
	
	@MainActor func postUnreadCountDidInitializeNotification() {
		NotificationCenter.default.post(name: .UnreadCountDidInitialize, object: self, userInfo: nil)
	}

	@MainActor func postUnreadCountDidChangeNotification() {
		NotificationCenter.default.post(name: .UnreadCountDidChange, object: self, userInfo: nil)
	}

	@MainActor func calculateUnreadCount<T: Collection>(_ children: T) -> Int {
		let updatedUnreadCount = children.reduce(0) { (result, oneChild) -> Int in
			if let oneUnreadCountProvider = oneChild as? UnreadCountProvider {
				return result + oneUnreadCountProvider.unreadCount
			}
			return result
		}

		return updatedUnreadCount
	}
}


