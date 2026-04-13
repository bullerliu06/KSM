//
//  PPCache.h
// FIexiLend
//
//  Created by jacky on 2024/10/31.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PPCache : NSObject

+ (void)setStr:(NSString *)object forKey:(NSString *)key;
+ (NSString *)getStr:(NSString *)key;

+ (void)setObject:(id)object forKey:(NSString *)key;
+ (void)deleteObject:(NSString *)key;
+ (id)getObjectForKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
