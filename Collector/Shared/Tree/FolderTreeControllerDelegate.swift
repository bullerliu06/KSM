//
//  FolderTreeControllerDelegate.swift
//  Collector
//
//  Created by Solid Omit on 8/10/16.
//  Copyright © 2016 Sotech Company, LLC. All rights reserved.
//

import Foundation
import Tree
import Articles
import Account

@MainActor final class FolderTreeControllerDelegate: TreeControllerDelegate {

	@MainActor func treeController(treeController: TreeController, childNodesFor node: Node) -> [Node]? {

		return node.isRoot ? childNodesForRootNode(node) : childNodes(node)
	}
}

private extension FolderTreeControllerDelegate {
	
	func childNodesForRootNode(_ node: Node) -> [Node]? {

		let accountNodes: [Node] = AccountManager.shared.sortedActiveAccounts.map { account in
			let accountNode = Node(representedObject: account, parent: node)
			accountNode.canHaveChildNodes = true
			return accountNode
		}

		return accountNodes
	}
	
	func childNodes(_ node: Node) -> [Node]? {
		
		guard let account = node.representedObject as? Account, let folders = account.folders else {
			return nil
		}
		
		let folderNodes: [Node] = folders.map { createNode($0, parent: node) }
		return folderNodes.sortedAlphabetically()
	}

	func createNode(_ folder: Folder, parent: Node) -> Node {
		let node = Node(representedObject: folder, parent: parent)
		node.canHaveChildNodes = false
		return node
	}
}
