//
//  RSAtomParser.h
//  RSParser
//
//  Created by Solid Omit on 1/15/15.
//  Copyright (c) 2015 Sotech Company LLC. All rights reserved.
//

@import Foundation;

@class ParserData;
@class RSParsedFeed;

@interface RSAtomParser : NSObject

+ (RSParsedFeed *)parseFeedWithData:(ParserData *)parserData;

@end
