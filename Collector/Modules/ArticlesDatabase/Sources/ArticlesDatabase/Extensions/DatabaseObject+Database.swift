//
//  DatabaseObject+Database.swift
//  Collector
//
//  Created by Solid Omit on 9/13/17.
//  Copyright © 2017 Sotech Company. All rights reserved.
//

import Foundation
import Database
import Articles

extension Array where Element == DatabaseObject {
	
	func asAuthors() -> Set<Author>? {
		let authors = Set(self.map { $0 as! Author })
		return authors.isEmpty ? nil : authors
	}
}
