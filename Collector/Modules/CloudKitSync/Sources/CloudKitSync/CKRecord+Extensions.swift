//
//  CKRecord+Extensions.swift
//  Account
//
//  Created by Solid Omit on 3/29/20.
//  Copyright © 2020 Sotech Company, LLC. All rights reserved.
//

import Foundation
import CloudKit

public extension CKRecord {

	var externalID: String {
		return recordID.externalID
	}
}

public extension CKRecord.ID {

	var externalID: String {
		return recordName
	}
}
