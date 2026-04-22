//
//  PseudoFeed.swift
//  Collector
//
//  Created by Solid Omit on 11/19/17.
//  Copyright © 2017 Sotech Company. All rights reserved.
//

#if os(macOS)

import AppKit
import Articles
import Account
import AppKitExtras

protocol PseudoFeed: AnyObject, SidebarItem, SmallIconProvider, PasteboardWriterOwner {

}

#else

import UIKit
import Articles
import Account

protocol PseudoFeed: AnyObject, SidebarItem, SmallIconProvider {
	
}

#endif
