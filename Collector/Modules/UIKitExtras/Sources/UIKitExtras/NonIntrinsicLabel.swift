//
//  NonIntrinsicLabel.swift
//  Collector
//
//  Created by Solid Omit on 4/22/19.
//  Copyright © 2019 Sotech Company. All rights reserved.
//

import UIKit

public final class NonIntrinsicLabel: UILabel {

	// Prevent autolayout from messing around with our frame settings
	public override var intrinsicContentSize: CGSize {
		return CGSize(width: UIView.noIntrinsicMetric, height: UIView.noIntrinsicMetric)
	}
	
}
