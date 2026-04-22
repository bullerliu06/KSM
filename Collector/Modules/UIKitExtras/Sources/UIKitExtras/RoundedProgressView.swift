//
//  RoundedProgressView.swift
//  Collector
//
//  Created by Solid Omit on 10/29/19.
//  Copyright © 2019 Sotech Company. All rights reserved.
//

import UIKit

public final class RoundedProgressView: UIProgressView {

	public override func layoutSubviews() {
		super.layoutSubviews()
		for subview in subviews {
			subview.layer.masksToBounds = true
			subview.layer.cornerRadius = bounds.height / 2.0
		}
	}
}
