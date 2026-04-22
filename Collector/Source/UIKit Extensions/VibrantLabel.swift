//
//  VibrantLabel.swift
//  Collector
//
//  Created by Solid Omit on 10/22/19.
//  Copyright © 2019 Sotech Company. All rights reserved.
//

import UIKit

class VibrantLabel: UILabel {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		commonInit()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		commonInit()
	}
	
	private func commonInit() {
		highlightedTextColor = AppAssets.vibrantTextColor
	}

}
