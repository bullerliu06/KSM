//
//  PPLoginPage.m
// FIexiLend
//
//  Created by jacky on 2024/11/1.
//

#import "PPLoginPage.h"
#import "PPAuthCodePage.h"
#import "PPWebPage.h"

@interface PPLoginPage () <UITextFieldDelegate>

@property (nonatomic, strong) UITextField *phoneTextView;
@property (nonatomic, strong) UIButton *sureBtn;
@property (nonatomic, strong) UIButton *selectBtn;

@end

@implementation PPLoginPage

- (void)agreementAction {
    NSString *urlStr = StrFormat(@"%@%@", Http.h5Url, PrivacyUrl);
    PPWebPage *web = [[PPWebPage alloc] init];
    web.url = urlStr;
    web.isPresent = YES;
    web.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:web animated:YES completion:^{
        
    }];
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
    self.sureBtn.userInteractionEnabled = NO;
    self.sureBtn.backgroundColor = COLORA(212, 231, 255, 1);
    return YES;
}

- (void)readClick:(UIButton *)sender {
    sender.selected = !sender.selected;
}

- (void)viewDidLoad {
    
    
    [super viewDidLoad];
    self.view.backgroundColor = COLORA(247, 251, 255, 1);
    UIImageView *loginHeaderBg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 255*WS)];
    loginHeaderBg.image = ImageWithName(@"login_header");
    [self.content addSubview:loginHeaderBg];
    
    UIImageView *loginLogo = [[UIImageView alloc] initWithFrame:CGRectMake(12, StatusBarHeight + 18, 30, 30)];
    loginLogo.image = ImageWithName(@"app_icon");
    [loginHeaderBg addSubview:loginLogo];
    
    UIImageView *loginService = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth - 32, StatusBarHeight + 18, 20, 20)];
    loginService.image = ImageWithName(@"login_service");
    [loginHeaderBg addSubview:loginService];
    
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, loginHeaderBg.h - 20, 36, 36)];
    image.image = ImageWithName(@"header_bottom");
    image.centerX = ScreenWidth/2;
    [loginHeaderBg addSubview:image];
    
    UILabel *descLabel = [[UILabel alloc] initWithFrame:CGRectMake(LeftMargin, loginHeaderBg.bottom + 16, SafeWidth, 40)];
    
    NSString *aString = @"Log in to";
    NSString *bString = @" experience personal ";
    NSString *cString = @"loan \nservices now";
    NSString *valueString = StrFormat(@"%@%@%@", aString, bString, cString);
    
    descLabel.text = valueString;
    descLabel.textColor = UIColor.blackColor;
    descLabel.font = Font(16);
    descLabel.numberOfLines = 0;
    [self.content addSubview:descLabel];
    
    UILabel *leNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(LeftMargin, descLabel.bottom + 10, 40, 44)];
    leNumberLabel.text = @"+63";
    leNumberLabel.textColor = TextBlackColor;
    leNumberLabel.font = FontBold(18);
    [self.content addSubview:leNumberLabel];
    
    UILabel *middleVerLine = [[UILabel alloc] initWithFrame:CGRectMake(leNumberLabel.right, leNumberLabel.y - 3, 30, 44)];
    middleVerLine.text = @"|";
    middleVerLine.textColor = COLORA(193, 214, 240, 1);
    middleVerLine.font = Font(30);
    [self.content addSubview:middleVerLine];
    
    self.phoneTextView = [[UITextField alloc] initWithFrame:CGRectMake(middleVerLine.right, leNumberLabel.y, ScreenWidth - middleVerLine.right - 16, 44)];
    self.phoneTextView.borderStyle = UITextBorderStyleNone;
    self.phoneTextView.font = Font(16);
    self.phoneTextView.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.phoneTextView.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.phoneTextView.placeholder = @"Phone number";
    self.phoneTextView.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Phone number" attributes:@{NSForegroundColorAttributeName: COLORA(193, 214, 240, 1)}];
    self.phoneTextView.keyboardType = UIKeyboardTypeNumberPad;
    self.phoneTextView.delegate = self;
    self.phoneTextView.textColor = TextBlackColor;
    self.phoneTextView.tintColor = MainColor;
    self.phoneTextView.textAlignment = NSTextAlignmentLeft;
    [self.content addSubview:self.phoneTextView];
    
    UIView *hoerline = [[UIView alloc] initWithFrame:CGRectMake(24, self.phoneTextView.bottom + 4, ScreenWidth - 48, 1)];
    hoerline.backgroundColor = UIColor.blackColor;
    [self.content addSubview:hoerline];
    
    self.selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.selectBtn addTarget:self action:@selector(readClick:) forControlEvents:UIControlEventTouchUpInside];
    self.selectBtn.frame = CGRectMake(16, hoerline.bottom + 25, 34, 34);
    [self.selectBtn setImage:ImageWithName(@"login_unselect") forState:UIControlStateNormal];
    self.selectBtn.selected = YES;
    [self.selectBtn setImage:ImageWithName(@"login_select") forState:UIControlStateSelected];
    [self.content addSubview:self.selectBtn];
    
    UILabel *readDesc = [[UILabel alloc] initWithFrame:CGRectMake(self.selectBtn.right, hoerline.bottom + 20, 40, 44)];
    
    NSString *aStrings = @"I have r";
    NSString *bStrings = @"ead and agree";
    NSString *cStrings = @" with the ";
    NSString *valueStrings = StrFormat(@"%@%@%@", aStrings, bStrings, cStrings);

    readDesc.text = valueStrings;
    readDesc.textColor = COLORA(188, 188, 188, 1);
    readDesc.font = Font(12);
    [readDesc sizeToFit];
    readDesc.h = 44;
    [self.content addSubview:readDesc];
    
    UILabel *agreement = [[UILabel alloc] initWithFrame:CGRectMake(readDesc.right, hoerline.bottom + 20, 40, 44)];
    agreement.userInteractionEnabled = YES;
    agreement.text = @"Privacy Agreement";
    agreement.textColor = COLORA(75, 135, 211, 1);
    agreement.font = Font(12);
    [agreement sizeToFit];
    agreement.h = 44;
    [agreement addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(agreementAction)]];
    [self.content addSubview:agreement];
    
    self.sureBtn = [[UIButton alloc] initWithFrame:CGRectMake(25, readDesc.bottom + 60, ScreenWidth - 50, 48)];
    [self.sureBtn setTitle:@"Let's Go" forState:UIControlStateNormal];
    [self.sureBtn addTarget:self action:@selector(sureAction) forControlEvents:UIControlEventTouchUpInside];
    self.sureBtn.userInteractionEnabled = NO;
    self.sureBtn.backgroundColor = COLORA(212, 231, 255, 1);
    self.sureBtn.titleLabel.font = FontCustom(18);
    [self.sureBtn showRadius:24];
    [self.content addSubview:self.sureBtn];
}

- (void)sureAction {
    if (!_selectBtn.selected) {
        NSString *aString = @"Please ";
        NSString *bString = @"agree to the privacy";
        NSString *cString = @" agreement.";
        NSString *valueString = StrFormat(@"%@%@%@", aString, bString, cString);

        [PPToast show:valueString];
        return;
    }
    NSDictionary *dic = @{
        p_phone: notNull(self.phoneTextView.text),
        @"rsexpiableCiopjko": @"juyttrr"
    };
    kWeakself;
    [Http post:R_send_sms params:dic success:^(Response *response) {
        if (response.success) {
            NSDictionary *item = response.dataDic[p_item];
            NSInteger time = [item[p_time] integerValue];
            NSString *msg = item[p_message];
            [weakSelf nextPage:time message:msg];
        }
    } failure:^(NSError *error) {
        
    } showLoading:YES];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (![self isNumber:string]) {
        return NO;
    }
    NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    if (newString.length >= 15) {
        newString = [newString substringToIndex:15];
    }
    if (newString.length >= 8) {
        self.sureBtn.userInteractionEnabled = YES;
        self.sureBtn.backgroundColor = MainColor;
    }else {
        self.sureBtn.userInteractionEnabled = NO;
        self.sureBtn.backgroundColor = COLORA(212, 231, 255, 1);
    }
    textField.text = newString;
    return NO;
}


- (void)nextPage:(NSInteger)time message:(NSString *)msg {
    PPAuthCodePage *login = [[PPAuthCodePage alloc] init];
    login.naviBarHidden = YES;
    login.time = time;
    login.msg = msg;
    login.phone = notNull(self.phoneTextView.text);
    login.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:login animated:NO completion:nil];

}

- (BOOL)isNumber:(NSString *)string {
    unichar c;
    for (int i = 0; i < string.length; i++) {
        c = [string characterAtIndex:i];
        if (!isdigit(c)) {
            return NO;
        }
    }
    return YES;
}

@end
