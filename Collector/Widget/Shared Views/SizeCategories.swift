//
//  SizeCategories.swift
//  Collector iOS Widget Extension
//
//  Created by Solid Omit on 24/12/2020.
//  Copyright © 2020 Sotech Company. All rights reserved.
//

import SwiftUI

struct SizeCategories {
	
	let largeSizeCategories: [ContentSizeCategory] = [.extraExtraLarge,
													  .extraExtraExtraLarge,
													  .accessibilityMedium,
													  .accessibilityLarge,
													  .accessibilityExtraLarge,
													  .accessibilityExtraExtraLarge,
													  .accessibilityExtraExtraExtraLarge]
	
	
	func isSizeCategoryLarge(category: ContentSizeCategory) -> Bool {
		largeSizeCategories.filter{ $0 == category }.count == 1
	}
	
}
