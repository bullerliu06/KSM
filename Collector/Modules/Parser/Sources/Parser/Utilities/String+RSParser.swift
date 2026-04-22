//
//  String+RSParser.swift
//  RSParser
//
//  Created by Solid Omit on 2020-01-19.
//  Copyright © 2020 Sotech Company, LLC. All rights reserved.
//

import Foundation

extension String {

	var nilIfEmptyOrWhitespace: String? {
		return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? nil : self
	}

}
