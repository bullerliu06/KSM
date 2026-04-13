//
//  PPWebPage.h
// FIexiLend
//
//  Created by jacky on 2024/11/7.
//

#import "PPBasePage.h"
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PPWebPage : PPBasePage
@property (nonatomic, strong) WKWebView *webPageV;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, assign) BOOL isPresent;
@end

NS_ASSUME_NONNULL_END
