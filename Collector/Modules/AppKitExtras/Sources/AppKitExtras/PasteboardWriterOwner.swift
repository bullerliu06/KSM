//
//  PasteboardWriterOwner.swift
//  RSCore
//
//  Created by Solid Omit on 2/11/18.
//  Copyright © 2018 Sotech Company, LLC. All rights reserved.
//
#if os(macOS)
import AppKit

public protocol PasteboardWriterOwner {

	@MainActor var pasteboardWriter: NSPasteboardWriting { get }
}
#endif
