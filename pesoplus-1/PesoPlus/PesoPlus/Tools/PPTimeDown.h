//
//  PPTimeDown.h
// FIexiLend
//
//  Created by jacky on 2024/10/31.
//

#import <Foundation/Foundation.h>

#define CountDownLoginFinish          @"CountDownLoginFinish"
#define CountDownLogin              @"CountDownLogin"

NS_ASSUME_NONNULL_BEGIN

#define CountDown    [PPTimeDown sharedPPTimeDown]

typedef NS_ENUM(NSInteger, kCountDownType) {
    CountDownTypeLogin = 0,
};

@interface PPTimeDown : NSObject

SingletonH(PPTimeDown)
- (void)countDown:(kCountDownType)countDownType time:(NSInteger)time;
- (void)stopTimer:(kCountDownType)countDownType;

@end

NS_ASSUME_NONNULL_END
