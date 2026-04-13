//
//  InfoCell.h
// FIexiLend
//
//  Created by jacky on 2024/11/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface InfoCell : UITableViewCell

@property (nonatomic, strong) UITextField *text;
@property (nonatomic, strong) NSMutableDictionary *saveDic;
- (void)loadData:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
