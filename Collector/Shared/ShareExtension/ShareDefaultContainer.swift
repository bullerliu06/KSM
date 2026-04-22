//
//  ShareDefaultContainer.swift
//  Collector
//
//  Created by Solid Omit on 2/11/20.
//  Copyright © 2020 Sotech Company. All rights reserved.
//

import Foundation

struct ShareDefaultContainer {
	
	@MainActor static func defaultContainer(containers: ExtensionContainers) -> ExtensionContainer? {
		
		if let accountID = AppDefaults.shared.addFeedAccountID, let account = containers.accounts.first(where: { $0.accountID == accountID }) {
			if let folderName = AppDefaults.shared.addFeedFolderName, let folder = account.folders.first(where: { $0.name == folderName }) {
				return folder
			} else {
				return substituteContainerIfNeeded(account: account)
			}
		} else if let account = containers.accounts.first {
			return substituteContainerIfNeeded(account: account)
		} else {
			return nil
		}
		
	}
	
	@MainActor static func saveDefaultContainer(_ container: ExtensionContainer) {
		AppDefaults.shared.addFeedAccountID = container.accountID
		if let folder = container as? ExtensionFolder {
			AppDefaults.shared.addFeedFolderName = folder.name
		} else {
			AppDefaults.shared.addFeedFolderName = nil
		}
	}
	
	private static func substituteContainerIfNeeded(account: ExtensionAccount) -> ExtensionContainer? {
		if !account.disallowFeedInRootFolder {
			return account
		} else {
			if let folder = account.folders.first {
				return folder
			} else {
				return nil
			}
		}
	}
}
