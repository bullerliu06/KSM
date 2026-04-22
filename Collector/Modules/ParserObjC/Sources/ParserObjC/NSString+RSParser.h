//
//  NSString+RSParser.h
//  RSParser
//
//  Created by Solid Omit on 9/25/15.
//  Copyright © 2015 Sotech Company, LLC. All rights reserved.
//

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@interface NSString (RSParser)

- (NSString *)rsparser_stringByDecodingHTMLEntities;

/// Returns a copy of \c self with <, >, and & entity-encoded.
@property (readonly, copy)	NSString	*rsparser_stringByEncodingRequiredEntities;

- (NSString *)rsparser_md5Hash;

- (BOOL)rsparser_contains:(NSString *)s;

@end

NS_ASSUME_NONNULL_END
