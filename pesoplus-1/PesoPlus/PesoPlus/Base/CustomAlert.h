//
//  CustomAlert.h
// FIexiLend
//
//  Created by jacky on 2024/11/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomAlert : UIView
- (id)initWithCustomView:(UIView *)customView;
- (void)show;
- (void)hide;
@end

NS_ASSUME_NONNULL_END
