//
//  OPMLRepresentable.swift
//  DataModel
//
//  Created by Solid Omit on 7/1/17.
//  Copyright © 2017 Sotech Company, LLC. All rights reserved.
//

import Foundation

public protocol OPMLRepresentable {

	@MainActor func OPMLString(indentLevel: Int, allowCustomAttributes: Bool) -> String
}

public extension OPMLRepresentable {

	@MainActor func OPMLString(indentLevel: Int) -> String {
		return OPMLString(indentLevel: indentLevel, allowCustomAttributes: false)
	}
}
