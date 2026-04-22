//
//  Database.swift
//  RSDatabase
//
//  Created by Solid Omit on 12/15/19.
//  Copyright © 2019 Solid Omit. All rights reserved.
//

import Foundation

public enum DatabaseError: Error, Sendable {
	case suspended // On iOS, to support background refreshing, a database may be suspended.
}
