//
//  ShareArticleActivityViewController.swift
//  Collector
//
//  Created by Solid Omit on 01/11/20.
//  Copyright © 2020 Sotech Company. All rights reserved.
//

import UIKit

extension UIActivityViewController {
	convenience init(url: URL, title: String?, applicationActivities: [UIActivity]?) {
		let itemSource = ArticleActivityItemSource(url: url, subject: title)
		let titleSource = TitleActivityItemSource(title: title)
		
		self.init(activityItems: [titleSource, itemSource], applicationActivities: applicationActivities)
	}
}
