//
//  ModalNavigationController.swift
//  Collector
//
//  Created by Solid Omit on 11/16/19.
//  Copyright © 2019 Sotech Company. All rights reserved.
//

import UIKit

class ModalNavigationController: UINavigationController {

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		// This hack is to resolve an issue
		let frame = navigationBar.frame
		navigationBar.frame = CGRect(x: frame.minX, y: frame.minY, width: frame.size.width, height: 64.0)
	}
	
}
