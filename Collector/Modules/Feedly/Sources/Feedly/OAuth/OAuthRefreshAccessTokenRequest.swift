//
//  OAuthRefreshAccessTokenRequest.swift
//  Account
//
//  Created by Solid Omit on 4/11/19.
//  Copyright © 2019 Sotech Company, LLC. All rights reserved.
//

import Foundation
import Web

/// Models section 6 of the OAuth 2.0 Authorization Framework
/// https://tools.ietf.org/html/rfc6749#section-6
public struct OAuthRefreshAccessTokenRequest: Encodable, Sendable {
	public let grantType = "refresh_token"
	public var refreshToken: String
	public var scope: String?
	
	// Possibly not part of the standard but specific to certain implementations (e.g.: Feedly).
	public var clientID: String
	public var clientSecret: String
	
	public init(refreshToken: String, scope: String?, client: OAuthAuthorizationClient) {
		self.refreshToken = refreshToken
		self.scope = scope
		self.clientID = client.id
		self.clientSecret = client.secret
	}
}
