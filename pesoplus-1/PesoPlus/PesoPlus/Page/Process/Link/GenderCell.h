//
//  GenderCell.h
// FIexiLend
//
//  Created by jacky on 2024/11/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GenderCell : UITableViewCell
@property (nonatomic, strong) NSMutableDictionary *saveDic;
- (void)loadData:(NSDictionary *)dic;
@end

NS_ASSUME_NONNULL_END
