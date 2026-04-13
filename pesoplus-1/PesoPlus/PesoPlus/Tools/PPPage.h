//
//  PPPage.h
// FIexiLend
//
//  Created by jacky on 2024/10/31.
//

#import <Foundation/Foundation.h>
#import "PPBasePage.h"
#import "PPTabBarController.h"

#define Page    [PPPage sharedPPPage]

@interface PPPage : NSObject


SingletonH(PPPage)

- (void)popRoot;
- (void)popRootAnimated:(BOOL)animated;
- (void)switchTab:(NSUInteger)index;
- (PPBasePage *)popAnimated:(BOOL)animated;
- (PPBasePage *)pop;
- (NSArray *)popToVC:(UIViewController *)viewController notFoundBlock:(void(^)(void))notFoundBlock;
- (NSArray *)popToVC:(UIViewController *)viewController;
- (NSArray *)popTo:(NSString *)pageName notFoundBlock:(void(^)(void))notFoundBlock animated:(BOOL)animated;
- (NSArray *)popTo:(NSString *)pageName;
- (NSArray *)popTo:(NSString *)pageName animated:(BOOL)animated;

- (PPBasePage *)push:(NSString *)pageName param:(NSDictionary *)dic animated:(BOOL)animated;

- (PPBasePage *)push:(NSString *)pageName;

- (PPBasePage *)push:(NSString *)pageName param:(NSDictionary *)dic;

- (PPBasePage *)push:(NSString *)pageName animated:(BOOL)animated;

- (PPBasePage *)topVC;

- (void)present:(UIViewController *)vc animated: (BOOL)flag completion:(CallBackNone)completion;
- (void)dismiss;
@end
