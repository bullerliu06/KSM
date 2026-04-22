//
//  InitialFeedDownloader.swift
//  Collector
//
//  Created by Solid Omit on 9/3/16.
//  Copyright © 2016 Sotech Company, LLC. All rights reserved.
//

import Foundation
import Parser
import ParserObjC
import Web

public struct InitialFeedDownloader {

	public static func download(_ url: URL) async -> ParsedFeed? {

		guard let downloadData = try? await DownloadWithCacheManager.shared.download(url) else {
			return nil
		}

		guard let data = downloadData.data else {
			return nil
		}

		let parserData = ParserData(url: url.absoluteString, data: data)
		guard let parsedFeed = try? await FeedParser.parse(parserData) else {
			return nil
		}

		return parsedFeed
	}
}
