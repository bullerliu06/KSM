//
//  NodePath.swift
//  RSTree
//
//  Created by Solid Omit on 9/5/16.
//  Copyright © 2016 Sotech Company, LLC. All rights reserved.
//

import Foundation

@MainActor public struct NodePath {

	let components: [Node]

	public init(node: Node) {

		var tempArray = [node]

		var nomad: Node = node
		while true {
			if let parent = nomad.parent {
				tempArray.append(parent)
				nomad = parent
			}
			else {
				break
			}
		}

		self.components = tempArray.reversed()
	}

	public init?(representedObject: AnyObject, treeController: TreeController) {

		if let node = treeController.nodeInTreeRepresentingObject(representedObject) {
			self.init(node: node)
		}
		else {
			return nil
		}
	}
}
