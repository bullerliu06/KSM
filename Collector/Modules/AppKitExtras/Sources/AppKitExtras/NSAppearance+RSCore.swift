//
//  NSAppearance+RSCore.swift
//  RSCore
//
//  Created by Solid Omit on 8/28/18.
//  Copyright © 2018 Sotech Company, LLC. All rights reserved.
//

#if os(macOS)
import AppKit

extension NSAppearance {
	
	public var isDarkMode: Bool {
		bestMatch(from: [.darkAqua, .aqua]) == .darkAqua
	}
}
#endif
