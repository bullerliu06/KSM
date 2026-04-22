//
//  VibrantButton.swift
//  Collector
//
//  Created by Solid Omit on 10/22/19.
//  Copyright © 2019 Sotech Company. All rights reserved.
//

import UIKit

class VibrantButton: UIButton {
	
	@IBInspectable var backgroundHighlightColor: UIColor = AppAssets.secondaryAccentColor

	override init(frame: CGRect) {
		super.init(frame: frame)
		commonInit()
	}
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		commonInit()
	}
	
	private func commonInit() {
		setTitleColor(AppAssets.vibrantTextColor, for: .highlighted)
		let disabledColor = AppAssets.secondaryAccentColor.withAlphaComponent(0.5)
		setTitleColor(disabledColor, for: .disabled)
	}

	override var isHighlighted: Bool {
		didSet {
			backgroundColor = isHighlighted ? backgroundHighlightColor : nil
		}
	}

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        isHighlighted = true
        super.touchesBegan(touches, with: event)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isHighlighted = false
        super.touchesEnded(touches, with: event)
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        isHighlighted = false
        super.touchesCancelled(touches, with: event)
    }
	
}
