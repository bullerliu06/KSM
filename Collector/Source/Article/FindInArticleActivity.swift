//
//  FindInArticleActivity.swift
//  Collector
//
//  Created by Solid Omit on 5/7/20.
//  Copyright © 2020 Sotech Company. All rights reserved.
//

import UIKit

class FindInArticleActivity: UIActivity {
	override var activityTitle: String? {
		NSLocalizedString("Find in Article", comment: "Find in Article")
	}
	
	override var activityType: UIActivity.ActivityType? {
		UIActivity.ActivityType(rawValue: "com.sotech.Collector.find")
	}
	
	override var activityImage: UIImage? {
		UIImage(systemName: "magnifyingglass", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .regular))
	}
	
	override class var activityCategory: UIActivity.Category {
		.action
	}
	
	override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
		true
	}
	
	override func prepare(withActivityItems activityItems: [Any]) {
		
	}
	
	override func perform() {
		NotificationCenter.default.post(Notification(name: .FindInArticle))
		activityDidFinish(true)
	}
}
