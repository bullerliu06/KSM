//
//  ExtensionFeedAddRequest.swift
//  Collector
//
//  Created by Solid Omit on 2/10/20.
//  Copyright © 2020 Sotech Company. All rights reserved.
//

import Foundation
import Account

struct ExtensionFeedAddRequest: Codable {
	
	enum CodingKeys: String, CodingKey {
		case name
		case feedURL
		case destinationContainerID
	}

	let name: String?
	let feedURL: URL
	let destinationContainerID: ContainerIdentifier
	
}
