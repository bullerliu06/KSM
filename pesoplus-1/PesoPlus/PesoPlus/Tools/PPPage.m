//
//  PPPage.m
// FIexiLend
//
//  Created by jacky on 2024/10/31.
//

#import "PPPage.h"
#import "AppDelegate.h"

@interface PPPage() <UITabBarControllerDelegate>

@property (nonatomic, strong) UINavigationController *navController;
@property (nonatomic, strong) PPTabBarController *tabBarController;

@end

@implementation PPPage

SingletonM(PPPage)

- (id)init{
    self = [super init];
    if (self) {
        [self config];
    }
    return self;
}

- (void)config {
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    self.tabBarController = app.tabBarController;
    self.navController = app.navController;
}

- (void)popRoot{
    [self popRootAnimated:YES];
}

- (void)popRootAnimated:(BOOL)animated{
    [self.navController popToViewController:self.tabBarController animated:animated];
}

- (PPBasePage *)pop{
    return [self popAnimated:YES];
}

- (void)switchTab:(NSUInteger)index{
    if (self.tabBarController) {
        [self.tabBarController setSelectedIndex:index];
        [self popRootAnimated:NO];
    }
}

- (PPBasePage *)popAnimated:(BOOL)animated{
    if (self.navController.viewControllers.count == 0) {
        return nil;
    }
    
    UIViewController *viewController = [self.navController popViewControllerAnimated:animated];
    if (![viewController isKindOfClass:[PPBasePage class]]) {
        return nil;
    }
    
    return (PPBasePage *)viewController;
}

- (NSArray *)popToVC:(UIViewController *)viewController {
    return [self popToVC:viewController notFoundBlock:NULL];
}

- (NSArray *)popToVC:(UIViewController *)viewController notFoundBlock:(void(^)(void))notFoundBlock {
    if ((!viewController)||(![viewController isKindOfClass:UIViewController.self])) {
        notFoundBlock();
        return nil;
    }
    
    NSArray *viewControllers = self.navController.viewControllers;
    for (UIViewController *vc in [viewControllers reverseObjectEnumerator]) {
        if (vc == viewController) {
            return [self.navController popToViewController:viewController animated:YES];
        } else if ([vc isEqual:self.tabBarController]) {
            NSArray *views = self.tabBarController.viewControllers;
            for (UIViewController* tabVC in views) {
                if (tabVC == viewController) {
                    return [self.navController popToViewController:self.tabBarController animated:YES];
                }
            }
        }
    }
    
    if (notFoundBlock) {
        notFoundBlock();
    }
    
    return nil;
}

- (NSArray *)popTo:(NSString *)pageName {
    return [self popTo:pageName notFoundBlock:NULL animated:YES];
}

- (NSArray *)popTo:(NSString *)pageName animated:(BOOL)animated {
    return [self popTo:pageName notFoundBlock:NULL animated:animated];
}

- (NSArray *)popTo:(NSString *)pageName notFoundBlock:(void(^)(void))notFoundBlock animated:(BOOL)animated {
    if (isBlankStr(pageName)) {
        return nil;
    }
    
    NSArray *viewControllers = self.navController.viewControllers;
    for (UIViewController *viewController in [viewControllers reverseObjectEnumerator]) {
        NSString *tempName = NSStringFromClass([viewController class]);
        if ([tempName isEqualToString:pageName]) {
            return [self.navController popToViewController:viewController animated:animated];
        } else if ([viewController isEqual:self.tabBarController]) {
            NSArray *views = self.tabBarController.viewControllers;
            for (UIViewController* tabView in views) {
                if ([pageName isEqualToString:NSStringFromClass([tabView class])]) {
                    return [self.navController popToViewController:self.tabBarController animated:animated];
                }
            }
        }
    }
    
    if (notFoundBlock) {
        notFoundBlock();
    }
    
    return nil;
}

- (PPBasePage *)topVC {
    UIViewController *topVC = self.navController.topViewController;
    if ([topVC isKindOfClass:[UITabBarController class]]) {
        return self.tabBarController.selectedViewController;
    }
    
    if (![topVC isKindOfClass:[PPBasePage class]]) {
        return nil;
    }
    
    return (PPBasePage *)topVC;
}

- (PPBasePage *)push:(NSString *)pageName{
    return [self push:pageName animated:YES];
}

- (PPBasePage *)push:(NSString *)pageName param:(NSDictionary *)dic{
    return [self push:pageName param:dic animated:YES];
}

- (PPBasePage *)push:(NSString *)pageName animated:(BOOL)animated{
    return [self push:pageName param:nil animated:animated];
}

- (PPBasePage *)push:(NSString *)pageName param:(NSDictionary *)dic animated:(BOOL)animated{
    PPBasePage *viewController = [self createViewController:pageName param:dic];
    if (!viewController) {
        return nil;
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self pushViewController:viewController animated:animated];
    });
    
    return viewController;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    [self.navController pushViewController:viewController animated:animated];
}


- (PPBasePage *)createViewController:(NSString *)pageName param:(NSDictionary *)dic{
    if (isBlankStr(pageName)) {
        return nil;
    }
    
    Class targetClass = NSClassFromString(pageName);
    if (!targetClass) {
        return nil;
    }
    
    PPBasePage *viewController = [[targetClass alloc] init];
    if (!viewController || ![viewController isKindOfClass:[PPBasePage class]]) {
        return nil;
    }
    
    viewController.paramDic = dic;
    [self checkParamDic:viewController];
    return viewController;
}

- (void)checkParamDic:(PPBasePage *)targetViewController{
    if (!targetViewController.paramDic) {
        return;
    }
    
    [targetViewController.paramDic enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if (![key isKindOfClass:[NSString class]]) {
            return;
        }
        
        NSString *upperKey = [key stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:[[key substringToIndex:1] uppercaseString]];
        
        SEL setMethod = NSSelectorFromString([NSString stringWithFormat:@"set%@:", upperKey]);
        if (![targetViewController respondsToSelector:setMethod]) {
            return;
        }
        
        [targetViewController setValue:obj forKeyPath:key];
    }];
}

- (void)present:(UIViewController *)vc animated: (BOOL)flag completion:(CallBackNone)completion {
    [self.topVC presentViewController:vc animated:YES completion:completion];
}

- (void)dismiss {
    [self.topVC.presentedViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
