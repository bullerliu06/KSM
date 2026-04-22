//
//  UserAgent.swift
//  RSWeb
//
//  Created by Solid Omit on 8/27/16.
//  Copyright © 2016 Sotech Company, LLC. All rights reserved.
//

import Foundation

public struct UserAgent {
	
	public static let fromInfoPlist: String = {

		Bundle.main.object(forInfoDictionaryKey: "UserAgent") as! String
	}()

	public static let headers: [String: String] = {

		let userAgent = fromInfoPlist
		return [HTTPRequestHeader.userAgent: userAgent]
	}()
}
