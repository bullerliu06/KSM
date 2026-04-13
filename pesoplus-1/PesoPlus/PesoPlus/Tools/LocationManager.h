//
//  LocationManager.h
// FIexiLend
//
//  Created by jacky on 2024/11/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LocationManager : NSObject
@property (nonatomic, copy) CallBackBool resultBlock;
@property(nonatomic, copy) CallBackNone  resultlocationBlock;
- (void)requestLocation;

@end

NS_ASSUME_NONNULL_END
