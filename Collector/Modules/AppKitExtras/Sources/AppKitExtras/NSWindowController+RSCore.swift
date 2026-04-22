//
//  NSWindowController+RSCore.swift
//  RSCore
//
//  Created by Solid Omit on 2/17/18.
//  Copyright © 2018 Sotech Company, LLC. All rights reserved.
//
#if os(macOS)
import AppKit

public extension NSWindowController {

	var isDisplayingSheet: Bool {

		return window?.isDisplayingSheet ?? false
	}

	var isOpen: Bool {

		return isWindowLoaded && window!.isVisible
	}
}
#endif
