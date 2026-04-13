//
//  PPLoading.m
// FIexiLend
//
//  Created by jacky on 2024/10/31.
//

#import "PPLoading.h"

@interface PPLoading ()

@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;

@end

@implementation PPLoading

+ (instancetype)sharedInstance {
    static PPLoading *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] initWithFrame:[UIScreen mainScreen].bounds];
        sharedInstance.backgroundColor = UIColor.clearColor;
        [sharedInstance setupActivityIndicator];
    });
    return sharedInstance;
}

- (void)setupActivityIndicator {
    self.activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleLarge];
    self.activityIndicator.center = self.center;
    self.activityIndicator.color = [UIColor blackColor];
    [self addSubview:self.activityIndicator];
}

+ (void)showLoading {
    PPLoading *hud = [PPLoading sharedInstance];
    [TopWindow addSubview:hud];
    [hud.activityIndicator startAnimating];
}

+ (void)hideLoading {
    PPLoading *hud = [PPLoading sharedInstance];
    [hud.activityIndicator stopAnimating];
    [hud removeFromSuperview];
}

@end
