//
//  BankAlert.m
// FIexiLend
//
//  Created by jacky on 2024/11/20.
//

#import "BankAlert.h"

@interface BankAlert ()
@property (nonatomic, strong) UIView *alertView;
@property (nonatomic, copy) NSString *bank;
@property (nonatomic, copy) NSString *account;
@end

@implementation BankAlert

- (id)initWithBank:(NSString *)bank account:(NSString *)account {
    self = [super init];
    if (self) {
        self.bank = bank;
        self.account = account;
        self.backgroundColor = UIColor.clearColor;
        [self loadUI];
    }
    return self;
}

- (void)show {
    self.alpha = 1;
    [TopWindow addSubview:self];
    [self addAnimation];
}


- (void)hide {
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0;
    }completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)loadUI {
    self.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    UIButton *bgGrayItemView = [UIButton buttonWithType:UIButtonTypeCustom];
    bgGrayItemView.backgroundColor = [UIColor blackColor];
    bgGrayItemView.alpha = 0.7;
    bgGrayItemView.frame = self.frame;

    [self addSubview:bgGrayItemView];
    [bgGrayItemView addTarget:self action:@selector(bgBtnClick:) forControlEvents:UIControlEventTouchUpInside];

    
    CGFloat alertWidth = SafeWidth;
    CGFloat alertHeight = 290;
    _alertView = [[UIView alloc]initWithFrame:CGRectMake(LeftMargin, ScreenHeight - alertHeight, alertWidth, alertHeight)];
    [self addSubview:_alertView];
    _alertView.backgroundColor = [UIColor whiteColor];

    
    UIView *topVuteItem = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _alertView.w, 71)];
    [_alertView addSubview:topVuteItem];
    topVuteItem.backgroundColor = MainColor;

    
    UIImageView *middleImage = [[UIImageView alloc] initWithFrame:CGRectMake(_alertView.w - 71 - 16, 0, 71, 71)];
    [topVuteItem addSubview:middleImage];
    middleImage.image = ImageWithName(@"confirm_note");

    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(16, 0, _alertView.w - 71 - 20, 71)];
    
    NSString *aString = @"Please confirm your withdrawa";
    NSString *bString = @"l account information belongs to";
    NSString *cString = @" yourself and is correct";
    NSString *valueString = StrFormat(@"%@%@%@", aString, bString, cString);

    titleLabel.text = valueString;

    [topVuteItem addSubview:titleLabel];
    titleLabel.textColor = UIColor.whiteColor;
    titleLabel.font = FontBold(12);
    titleLabel.numberOfLines = 0;

    UILabel *bankLeadingLable = [[UILabel alloc] initWithFrame:CGRectMake(LeftMargin, titleLabel.bottom + 5, 200, 50)];
    bankLeadingLable.text = @"Canhel/Bank";

    bankLeadingLable.textAlignment = NSTextAlignmentLeft;
    [_alertView addSubview:bankLeadingLable];
    
    bankLeadingLable.textColor = TextGrayColor;
    bankLeadingLable.font = Font(13);
    
    UILabel *bankLabel = [[UILabel alloc] initWithFrame:CGRectMake(215, titleLabel.bottom + 5, alertWidth - 230, 50)];
    bankLabel.text = _bank;

    bankLabel.textAlignment = NSTextAlignmentRight;
    [_alertView addSubview:bankLabel];
    bankLabel.textColor = TextBlackColor;
    bankLabel.font = FontBold(14);
    
    UILabel *accountLeadingLabel = [[UILabel alloc] initWithFrame:CGRectMake(LeftMargin, bankLeadingLable.bottom, 200, 50)];
    accountLeadingLabel.text = @"Account number";
    accountLeadingLabel.textAlignment = NSTextAlignmentLeft;
    [_alertView addSubview:accountLeadingLabel];
    accountLeadingLabel.textColor = TextGrayColor;
    accountLeadingLabel.font = Font(13);

    
    UILabel *accountViewItem = [[UILabel alloc] initWithFrame:CGRectMake(215, bankLeadingLable.bottom, alertWidth - 230, 50)];
    accountViewItem.text = _account;

    accountViewItem.textAlignment = NSTextAlignmentRight;
    [_alertView addSubview:accountViewItem];
    accountViewItem.textColor = TextBlackColor;
    accountViewItem.font = FontBold(14);
    
    UIView *lineViewTop = [[UIView alloc] initWithFrame:CGRectMake(LeftMargin, bankLeadingLable.bottom, alertWidth - 2*LeftMargin, 0.8)];
    [_alertView addSubview:lineViewTop];
    lineViewTop.backgroundColor = LineGrayColor;

    
    UIView *lineNormalView = [[UIView alloc] initWithFrame:CGRectMake(LeftMargin, accountLeadingLabel.bottom, alertWidth - 2*LeftMargin, 0.8)];
    [_alertView addSubview:lineNormalView];
    lineNormalView.backgroundColor = LineGrayColor;

        
    UIButton *sureBtn = [HView normalBtn:CGRectMake(14, lineNormalView.bottom + 28, alertWidth - 28, 42) title:@"Confirm" font:18];
    [_alertView addSubview:sureBtn];
    [sureBtn addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(confirmAction)]];

    UIButton *closeBtn = [HView normalBtn:CGRectMake(14, sureBtn.bottom, alertWidth - 28, 42) title:@"Back" font:18];
    closeBtn.backgroundColor = UIColor.whiteColor;
    [closeBtn setTitleColor:MainColor forState:UIControlStateNormal];
    
    [_alertView addSubview:closeBtn];
    [closeBtn addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backAction)]];

    
    _alertView.h = 300;
    _alertView.centerX = ScreenWidth/2;
    _alertView.centerY = ScreenHeight/2;
    [_alertView showRadius:16];
}

- (void)backAction {
    [self hide];
}


- (void)addAnimation {
    CAKeyframeAnimation *scale = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    scale.values = @[@(0.1),@(1.2),@(0.8),@(1.0)];
    scale.calculationMode = kCAAnimationLinear;
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = @[scale];
    animationGroup.duration = 0.3;
    [_alertView.layer addAnimation:animationGroup forKey:nil];
}

- (void)bgBtnClick:(UIButton *)btn {
    [self hide];
}


- (void)confirmAction {
    if (self.confirmBlock) {
        self.confirmBlock();
    }
    [self hide];
}



@end
