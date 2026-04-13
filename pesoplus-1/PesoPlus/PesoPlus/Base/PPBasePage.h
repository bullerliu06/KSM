//
//  PPBasePage.h
// FIexiLend
//
//  Created by jacky on 2024/10/31.
//

#import <UIKit/UIKit.h>
#import "PPContentView.h"
#import "PPNavBar.h"

NS_ASSUME_NONNULL_BEGIN

@interface PPBasePage : UIViewController
@property (nonatomic, strong) PPContentView *content;
@property (nonatomic, strong) NSDictionary *paramDic;
@property (nonatomic, assign) BOOL naviBarHidden;
@property (nonatomic, assign) BOOL canGestureBack;
@property (nonatomic, strong) PPNavBar *navBar;

- (void)backAction;
@end

NS_ASSUME_NONNULL_END
