//
//  OrderPage.h
// FIexiLend
//
//  Created by jacky on 2024/11/20.
//

#import "PPBasePage.h"

NS_ASSUME_NONNULL_BEGIN

@interface OrderPage : PPBasePage
@property (nonatomic, assign) NSInteger selectTabIndex;
@property (nonatomic, copy) NSString *orderType;// 状态 4全部 7进行中 6待还款 5已结清
@end

NS_ASSUME_NONNULL_END
