//
//  NSResponder-Extensions.swift
//  RSCore
//
//  Created by Solid Omit on 10/10/16.
//  Copyright © 2016 Sotech Company, LLC. All rights reserved.
//
#if os(macOS)
import AppKit

public extension NSResponder {
	
	func hasAncestor(_ ancestor: NSResponder) -> Bool {
		
		var nomad: NSResponder = self
		while(true) {
			if nomad === ancestor {
				return true
			}
			if let _ = nomad.nextResponder {
				nomad = nomad.nextResponder!
			}
			else {
				break
			}
		}
		
		return false
	}
}
#endif
