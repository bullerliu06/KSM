//
//  ParserData.h
//  RSParser
//
//  Created by Solid Omit on 10/4/17.
//  Copyright © 2017 Sotech Company, LLC. All rights reserved.
//

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

__attribute__((swift_attr("@Sendable")))
@interface ParserData : NSObject

@property (nonatomic, readonly) NSString *url;
@property (nonatomic, readonly) NSData *data;

- (instancetype)initWithURL:(NSString *)url data:(NSData *)data;

@end

NS_ASSUME_NONNULL_END

