//
//  IDFVTools.h
//  LuckyLoan
//
//  Created by jacky on 2024/1/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface IDFVTools : NSObject

+ (void)save:(NSString *)service data:(id)data;
 
+ (id)load:(NSString *)service;
 
+ (void)delete:(NSString *)service;
 
+ (NSString *)getIDFV;

@end

NS_ASSUME_NONNULL_END
