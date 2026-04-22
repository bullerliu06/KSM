//
//  CroppingPreviewParameters.swift
//  Collector
//
//  Created by Solid Omit on 11/23/19.
//  Copyright © 2019 Sotech Company. All rights reserved.
//

import UIKit

class CroppingPreviewParameters: UIPreviewParameters {
	
	override init() {
		super.init()
	}
	
	init(view: UIView) {
		super.init()
		let newBounds = CGRect(x: 1, y: 1, width: view.bounds.width - 2, height: view.bounds.height - 2)
		let visiblePath = UIBezierPath(roundedRect: newBounds, cornerRadius: 10)
		self.visiblePath = visiblePath
	}

}
