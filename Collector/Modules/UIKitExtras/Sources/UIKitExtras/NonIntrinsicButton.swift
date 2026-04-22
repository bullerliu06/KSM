//
//  NonIntrinsicButton.swift
//  Collector
//
//  Created by Solid Omit on 8/25/19.
//  Copyright © 2019 Sotech Company. All rights reserved.
//

import Foundation

import UIKit

public final class NonIntrinsicButton: UIButton {

	// Prevent autolayout from messing around with our frame settings
	public override var intrinsicContentSize: CGSize {
		return CGSize(width: UIView.noIntrinsicMetric, height: UIView.noIntrinsicMetric)
	}

}
