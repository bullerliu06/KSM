//
//  UIView-Extensions.swift
//  RSCore
//
//  Created by Solid Omit on 4/20/19.
//  Copyright © 2019 Sotech Company, LLC. All rights reserved.
//

#if os(iOS)
import UIKit

extension UIView {
	
	public func setFrameIfNotEqual(_ rect: CGRect) {
		if !self.frame.equalTo(rect) {
			self.frame = rect
		}
	}

	public func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
	
}
#endif
