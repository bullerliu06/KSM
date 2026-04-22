//
//  FeedRowIdentifier.swift
//  Collector
//
//  Created by Solid Omit on 10/20/21.
//  Copyright © 2021 Sotech Company. All rights reserved.
//

import Foundation

class FeedRowIdentifier: NSObject, NSCopying {

	var indexPath: IndexPath
	
	init(indexPath: IndexPath) {
		self.indexPath = indexPath
	}
	
	func copy(with zone: NSZone? = nil) -> Any {
		return self
	}
	
}
