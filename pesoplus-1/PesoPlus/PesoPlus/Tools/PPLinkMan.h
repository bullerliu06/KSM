//
//  PPLinkMan.h
// FIexiLend
//
//  Created by jacky on 2024/10/31.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PPLinkMan : NSObject
@property (nonatomic, copy) CallBackDic selectBlock;
- (void)show;
@end

NS_ASSUME_NONNULL_END
