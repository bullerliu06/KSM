//
//  RSOPMLItem.h
//  RSParser
//
//  Created by Solid Omit on 2/28/16.
//  Copyright © 2016 Sotech Company, LLC. All rights reserved.
//

@import Foundation;

@class RSOPMLFeedSpecifier;

NS_ASSUME_NONNULL_BEGIN

@interface RSOPMLItem : NSObject

@property (nonatomic, nullable) NSDictionary *attributes;
@property (nonatomic, nullable) NSArray <RSOPMLItem *> *children;

- (void)addChild:(RSOPMLItem *)child;

@property (nonatomic, nullable, readonly) RSOPMLFeedSpecifier *feedSpecifier;

@property (nonatomic, nullable, readonly) NSString *titleFromAttributes;
@property (nonatomic, readonly) BOOL isFolder;

@end

NS_ASSUME_NONNULL_END

