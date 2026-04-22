//
//  Set+Extensions.swift
//  RSCore
//
//  Created by Solid Omit on 3/13/16.
//  Copyright © 2016 Sotech Company, LLC. All rights reserved.
//

import Foundation

public extension Set {

	func anyObject() -> Element? {
		
		if self.isEmpty {
			return nil
		}
		return self[startIndex]
	}
}
