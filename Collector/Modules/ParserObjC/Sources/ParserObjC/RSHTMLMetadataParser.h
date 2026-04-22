//
//  RSHTMLMetadataParser.h
//  RSParser
//
//  Created by Solid Omit on 3/6/16.
//  Copyright © 2016 Sotech Company, LLC. All rights reserved.
//

@import Foundation;


@class RSHTMLMetadata;
@class ParserData;

NS_ASSUME_NONNULL_BEGIN

@interface RSHTMLMetadataParser : NSObject

+ (RSHTMLMetadata *)HTMLMetadataWithParserData:(ParserData *)parserData;


@end

NS_ASSUME_NONNULL_END
