//
//  ProcessPage.h
// FIexiLend
//
//  Created by jacky on 2024/11/20.
//

#import "PPBasePage.h"

NS_ASSUME_NONNULL_BEGIN

@interface ProcessPage : PPBasePage
@property (nonatomic, copy) NSString *productId;
@property (nonatomic, copy) NSString *startTime;
@property (nonatomic, copy) NSString *endTime;
@property (nonatomic, assign) NSInteger step;
- (NSDictionary *)track;
@end

NS_ASSUME_NONNULL_END
