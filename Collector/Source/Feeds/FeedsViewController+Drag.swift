//
//  FeedViewController+Drag.swift
//  Collector
//
//  Created by Solid Omit on 11/20/19.
//  Copyright © 2019 Sotech Company. All rights reserved.
//

import UIKit
import MobileCoreServices
import Account
import UniformTypeIdentifiers

extension SidebarViewController: UITableViewDragDelegate {
	
	func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
		guard let node = coordinator.nodeFor(indexPath), let feed = node.representedObject as? Feed else {
			return [UIDragItem]()
		}
		
		let data = feed.url.data(using: .utf8)
		let itemProvider = NSItemProvider()
		  
		itemProvider.registerDataRepresentation(forTypeIdentifier: UTType.url.identifier, visibility: .ownProcess) { completion in
			completion(data, nil)
			return nil
		}
		
		let dragItem = UIDragItem(itemProvider: itemProvider)
		dragItem.localObject = node
		return [dragItem]
	}
	
}
