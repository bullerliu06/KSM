//
//  SmallIconProvider.swift
//  Collector
//
//  Created by Solid Omit on 12/16/17.
//  Copyright © 2017 Sotech Company. All rights reserved.
//

import Foundation
import Articles
import Account
import Images

protocol SmallIconProvider {

	@MainActor var smallIcon: IconImage? { get }
}

extension Account: SmallIconProvider {
	var smallIcon: IconImage? {
		let image = AppAsset.Account.image(for: accountType)
		return IconImage(image)
	}
}

extension Feed: SmallIconProvider {

	@MainActor var smallIcon: IconImage? {
		if let iconImage = FaviconDownloader.shared.favicon(for: self) {
			return iconImage
		}
		return FaviconGenerator.favicon(self)
	}
}

extension Folder: SmallIconProvider {
	var smallIcon: IconImage? {
		AppAsset.folder
	}
}
