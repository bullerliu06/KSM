//
//  FeedbinImportResult.swift
//  Account
//
//  Created by Solid Omit on 5/17/19.
//  Copyright © 2019 Sotech Company, LLC. All rights reserved.
//

import Foundation

public struct FeedbinImportResult: Codable, Sendable {

	public let importResultID: Int
	public let complete: Bool
	
	enum CodingKeys: String, CodingKey {
		case importResultID = "id"
		case complete
	}
	
}
