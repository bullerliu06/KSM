//
//  PPUser.h
// FIexiLend
//
//  Created by jacky on 2024/11/1.
//

#import <Foundation/Foundation.h>
#import "PopView.h"

NS_ASSUME_NONNULL_BEGIN

#define User     [PPUser sharedPPUser]

@interface PPUser : NSObject
@property (nonatomic, assign) BOOL isLogin;
@property (nonatomic, assign) BOOL appstore;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *token;
@property (nonatomic, copy) NSString *sessionid;
@property (nonatomic, copy) NSString *longitude;
@property (nonatomic, copy) NSString *latitude;
@property (nonatomic, copy) NSDictionary *loctionDic;
@property (nonatomic, strong) PopView *suspend;
@property (nonatomic, strong) NSMutableDictionary *suspendDic;

SingletonH(PPUser)

- (void)setupUserInfo;

- (void)clearUserInfo;

- (void)login;


- (void)showSuspend;
- (void)hideSuspend;

@end
NS_ASSUME_NONNULL_END
