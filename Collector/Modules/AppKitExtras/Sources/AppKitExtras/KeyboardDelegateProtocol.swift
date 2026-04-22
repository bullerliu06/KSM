//
//  KeyboardDelegateProtocol.swift
//  Collector
//
//  Created by Solid Omit on 10/11/16.
//  Copyright © 2016 Sotech Company, LLC. All rights reserved.
//
#if os(macOS)
import AppKit

//let keypadEnter: unichar = 3

@objc public protocol KeyboardDelegate: AnyObject {
	
	// Return true if handled.
	@MainActor func keydown(_: NSEvent, in view: NSView) -> Bool
}
#endif
