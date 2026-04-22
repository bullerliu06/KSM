//
//  SmartFeedPasteboardWriter.swift
//  Collector
//
//  Created by Solid Omit on 2/11/18.
//  Copyright © 2018 Sotech Company. All rights reserved.
//

import AppKit
import Account

@MainActor @objc final class SmartFeedPasteboardWriter: NSObject, NSPasteboardWriting {

	private let smartFeed: PseudoFeed

	init(smartFeed: PseudoFeed) {

		self.smartFeed = smartFeed
	}

	// MARK: - NSPasteboardWriting

	nonisolated func writableTypes(for pasteboard: NSPasteboard) -> [NSPasteboard.PasteboardType] {

		return [.string]
	}

	nonisolated func pasteboardPropertyList(forType type: NSPasteboard.PasteboardType) -> Any? {

		MainActor.assumeIsolated {
			let plist: Any?
			
			switch type {
			case .string:
				plist = smartFeed.nameForDisplay
			default:
				plist = nil
			}
			
			return plist
		}
	}
}

