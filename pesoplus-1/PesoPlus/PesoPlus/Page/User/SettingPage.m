//
//  SettingPage.m
// FIexiLend
//
//  Created by jacky on 2024/11/18.
//

#import "SettingPage.h"
#import "CustomAlert.h"

@interface SettingPage ()
@property (nonatomic, strong) CustomAlert *alert;
@end

@implementation SettingPage

- (void)logoutConfirmAction {
    [_alert hide];
    [self loadQuitRequest];
}

- (void)cancelAccountConfirmAction {
    [_alert hide];
    [self loadQuitRequest];
}

- (void)clearAction {
    [Http cleanHttpHeaders];
    [Page popRootAnimated:NO];
    [Page switchTab:0];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Set Up";
    [self refreshUI];
    self.content.backgroundColor = BGColor;
}

- (void)refreshUI {
    UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(34, 40, 60, 60)];
    icon.image = ImageWithName(@"app_icon");
    icon.centerX = ScreenWidth/2;
    [self.content addSubview:icon];
    [icon showRadius:4];

    
    UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(LeftMargin, 10 + icon.bottom, SafeWidth, 24)];
    name.text = @"FIexiLend";
    name.textColor = TextBlackColor;
    name.font = FontCustom(20);
    name.textAlignment = NSTextAlignmentCenter;
    [self.content addSubview:name];
    
    NSMutableArray *dataArr = [NSMutableArray arrayWithArray:@[@{@"title":@"Websit", @"desc":@"https://www.mirjhalending.com"}, @{@"title":@"Email", @"desc":@"customer@mirjhalending.com"}, @{@"title":@"Edition", @"desc":StrFormat(@"%@", notNull([PPPhoneInfo version]))}]];
    
    
    UIView *itemBg = [[UIView alloc] initWithFrame:CGRectMake(0, name.bottom + 20, ScreenWidth, 68*dataArr.count)];
    [self.content addSubview:itemBg];
    itemBg.backgroundColor = UIColor.whiteColor;

    for (int i = 0; i < dataArr.count; i++) {
        NSDictionary *dic = dataArr[i];
        UIButton *item = [[UIButton alloc] initWithFrame:CGRectMake(20, i*68, ScreenWidth - 40, 68)];
        [itemBg addSubview:item];
        item.backgroundColor = UIColor.whiteColor;


        UILabel *titlelanel = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, item.w, 20)];
        titlelanel.textColor = TextGrayColor;
        titlelanel.textAlignment = NSTextAlignmentLeft;
        titlelanel.font = Font(14);

        titlelanel.text = dic[@"title"];

        [item addSubview:titlelanel];
        
        UILabel *descLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, titlelanel.bottom + 6, item.w, 22)];
        descLabel.textColor = TextBlackColor;
        descLabel.font = FontBold(16);
        [item addSubview:descLabel];
        descLabel.text = dic[@"desc"];

    }
    
    UIButton *logoutButton = [UIButton buttonWithType:UIButtonTypeCustom];
    logoutButton.backgroundColor = MainColor;
    logoutButton.titleLabel.font = FontCustom(12);
    logoutButton.frame = CGRectMake(34, self.content.h - 120 - SafeBottomHeight, ScreenWidth - 68, 42);
    [logoutButton setTitle:@"Logout" forState:UIControlStateNormal];
    [logoutButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    logoutButton.centerX = ScreenWidth/2;
    [self.content addSubview:logoutButton];
    [logoutButton showRadius:21];
    [logoutButton addTarget:self action:@selector(logoutAction) forControlEvents:UIControlEventTouchUpInside];


    UIButton *cencelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    cencelButton.titleLabel.font = FontCustom(12);
    cencelButton.backgroundColor = UIColor.whiteColor;
    cencelButton.frame = CGRectMake(34, logoutButton.bottom + 12, ScreenWidth - 68, 42);

    [cencelButton setTitleColor:rgba(206, 228, 255, 1) forState:UIControlStateNormal];
    cencelButton.centerX = ScreenWidth/2;
    [cencelButton setTitle:@"Cancel Account" forState:UIControlStateNormal];

    [self.content addSubview:cencelButton];
    
    [cencelButton addTarget:self action:@selector(cencelBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [cencelButton showRadius:21];
}



- (void)cancelAction {
    [_alert hide];
}

- (void)logoutAction {
    SEL selector = NSSelectorFromString(@"logoutConfirmAction");
    NSString *str = [NSString stringWithFormat:@"%@%@", @"Are you sure \n you", @" want to leave the software?"];
    [self showAlert:str selector:selector];
}

- (void)cencelBtnAction {
    SEL selector = NSSelectorFromString(@"cancelAccountConfirmAction");
    NSString *aString = @"Are you";
    NSString *bString = @" sure \n you want ";
    NSString *cString = @"to log out this user ? ";
    NSString *valueString = StrFormat(@"%@%@%@", aString, bString, cString);
    [self showAlert:valueString selector:selector];
}

- (void)showAlert:(NSString *)title selector:(SEL)selector {
    UIView *alertView = [[UIView alloc] initWithFrame:CGRectMake(24, ScreenHeight/2 - 207/2, ScreenWidth - 48, 207)];
    alertView.backgroundColor = UIColor.whiteColor;
    [alertView showRadius:16];
    
    UIView *topVtem = [[UIView alloc] initWithFrame:CGRectMake(0, 0, alertView.w, 86)];
    topVtem.backgroundColor = MainColor;
    [alertView addSubview:topVtem];
    
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(alertView.w - 68 - 24, 9, 68, 68)];
    image.image = ImageWithName(@"emoji");
    [topVtem addSubview:image];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 25, alertView.w - 128, 45)];
    label.text = title;
    label.textColor = UIColor.whiteColor;
    label.font = Font(14);
    label.numberOfLines = 0;
    [topVtem addSubview:label];
    
    UIButton *cancelBtnItem = [HView normalBtn:CGRectMake(14, topVtem.bottom + 38, alertView.w - 28, 42) title:@"Cancel" font:18];
    [cancelBtnItem addTarget:self action:@selector(cancelAction) forControlEvents:UIControlEventTouchUpInside];
    [alertView addSubview:cancelBtnItem];
    
    UIButton *sureBtnItem = [HView normalBtn:CGRectMake(14, cancelBtnItem.bottom, alertView.w - 28, 42) title:@"Confirm" font:18];
    sureBtnItem.backgroundColor = UIColor.whiteColor;
    [sureBtnItem setTitleColor:MainColor forState:UIControlStateNormal];
    [sureBtnItem addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    [alertView addSubview:sureBtnItem];
    
    _alert = [[CustomAlert alloc] initWithCustomView:alertView];
    [_alert show];
}

- (void)loadQuitRequest {
    kWeakself;
    [Http post:R_logout params:nil success:^(Response *response) {
        if (response.success) {
            [weakSelf clearAction];
        }
    } failure:^(NSError *error) {
        NSLog(@"======faild!");
    }];
}

@end
