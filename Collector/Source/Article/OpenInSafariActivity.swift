//
//  OpenInBrowserActivity.swift
//  Collector
//
//  Created by Solid Omit on 1/9/20.
//  Copyright © 2020 Sotech Company. All rights reserved.
//

import UIKit

class OpenInBrowserActivity: UIActivity {
	
	private var activityItems: [Any]?

	override var activityTitle: String? {
		return NSLocalizedString("Open in Browser", comment: "Open in Browser")
	}
	
	override var activityImage: UIImage? {
		return UIImage(systemName: "globe", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .regular))
	}
	
	override var activityType: UIActivity.ActivityType? {
		return UIActivity.ActivityType(rawValue: "com.rancharo.Collector-Evergreen.safari")
	}

	override class var activityCategory: UIActivity.Category {
		return .action
	}
	
	override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
		return true
	}
	
	override func prepare(withActivityItems activityItems: [Any]) {
		self.activityItems = activityItems
	}
	
	override func perform() {
		guard let url = activityItems?.first(where: { $0 is URL }) as? URL else {
			activityDidFinish(false)
			return
		}
		
		Task { @MainActor in
			UIApplication.shared.open(url, options: [:], completionHandler: nil)
		}
		activityDidFinish(true)
	}
}
