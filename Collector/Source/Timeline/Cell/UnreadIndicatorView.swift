//
//  UnreadIndicatorView.swift
//  Collector
//
//  Created by Solid Omit on 2/16/16.
//  Copyright © 2016 Sotech Company, LLC. All rights reserved.
//

import UIKit

class UnreadIndicatorView: UIView {

	override func layoutSubviews() {
		super.layoutSubviews()
		layer.cornerRadius = frame.size.width / 2.0
		clipsToBounds = true
	}
    
}
