//
//  RSParserInternal.h
//  RSParser
//
//  Created by Solid Omit on 12/26/16.
//  Copyright © 2016 Sotech Company, LLC. All rights reserved.
//

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

BOOL RSParserObjectIsEmpty(id _Nullable obj);
BOOL RSParserStringIsEmpty(NSString * _Nullable s);


@interface NSDictionary (RSParserInternal)

- (nullable id)rsparser_objectForCaseInsensitiveKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END

