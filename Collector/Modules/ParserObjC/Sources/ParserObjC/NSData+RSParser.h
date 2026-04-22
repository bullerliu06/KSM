//
//  NSData+RSParser.h
//  RSParser
//
//  Created by Solid Omit on 6/24/17.
//  Copyright © 2017 Sotech Company, LLC. All rights reserved.
//

@import Foundation;


@interface NSData (RSParser)

- (BOOL)isProbablyHTML;
- (BOOL)isProbablyXML;
- (BOOL)isProbablyJSON;

- (BOOL)isProbablyJSONFeed;
- (BOOL)isProbablyRSSInJSON;
- (BOOL)isProbablyRSS;
- (BOOL)isProbablyAtom;

@end



