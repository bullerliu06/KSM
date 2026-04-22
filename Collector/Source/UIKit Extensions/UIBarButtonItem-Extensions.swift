//
//  UIBarButtonItem-Extensions.swift
//  Collector
//
//  Created by Solid Omit on 4/27/19.
//  Copyright © 2019 Sotech Company. All rights reserved.
//

import UIKit

public extension UIBarButtonItem {
	
	@IBInspectable var accEnabled: Bool {
		get {
			return isAccessibilityElement
		}
		set {
			isAccessibilityElement = newValue
		}
	}
	
	@IBInspectable var accLabelText: String? {
		get {
			return accessibilityLabel
		}
		set {
			accessibilityLabel = newValue
		}
	}
	
}
