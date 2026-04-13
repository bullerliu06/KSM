//
//  OrderCell.h
// FIexiLend
//
//  Created by jacky on 2024/11/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OrderCell : UITableViewCell
- (void)loadData:(NSDictionary *)dic;
+ (CGFloat)cellHeight:(NSDictionary *)dic;
@end

NS_ASSUME_NONNULL_END
