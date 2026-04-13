//
//  LinkmanPage.m
// FIexiLend
//
//  Created by jacky on 2024/11/19.
//

#import "LinkmanPage.h"
#import "LinkmanCell.h"
#import "TimeView.h"
#import "InfoAlert.h"
#import "DayAlert.h"

@interface LinkmanPage ()
@property (nonatomic, strong) UIView *contactView;
@property (nonatomic, strong) TimeView *timeView;
@property (nonatomic, assign) NSInteger countdown;
@property (nonatomic, strong) NSMutableArray *cotnactArr;
@property (nonatomic, copy) NSArray *dataArr;

@property (nonatomic, strong) InfoAlert *alert;
@property (nonatomic, strong) UIView *headerView;

@end

@implementation LinkmanPage

- (void)requestInfoData {
    NSDictionary *dic = @{
        p_product_id: self.productId,
        @"rsunderlaidCiopjko":@"blaalleynk"
    };
    kWeakself;
    [Http post:R_contact params:dic success:^(Response *response) {
        if (response.success) {
            weakSelf.dataArr = response.dataDic[p_items];
            weakSelf.countdown = [response.dataDic[p_countdown] integerValue];
            [weakSelf loadUI];
        }
        
    } failure:^(NSError *error) {
        NSLog(@"======faild!");
    }];
}

- (id)init{
    self = [super init];
    if (self) {
        self.naviBarHidden = YES;
    }
    return self;
}

- (void)loadHeader {
    [self.headerView removeAllViews];
    
    self.headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SafeWidth, NavBarHeight + 64)];
    UIView *headerBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, NavBarHeight + 64)];
    headerBgView.backgroundColor = MainColor;
    [headerBgView showRadiusBottom:16];
    
    UIImageView *headerImageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, NavBarHeight, ScreenWidth, 64)];
    headerImageV.image = ImageWithName(@"header_step2");
    [headerBgView addSubview:headerImageV];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, StatusBarHeight, 48, 44);
    [backBtn setImage:ImageWithName(@"page_back") forState:UIControlStateNormal];
    [headerBgView addSubview:backBtn];
    [backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *titleView = [[UILabel alloc] initWithFrame:CGRectMake(LeftMargin + 44, StatusBarHeight, SafeWidth - 44*2, 44)];
    titleView.textColor = UIColor.whiteColor;
    titleView.textAlignment = NSTextAlignmentCenter;
    titleView.text = @"Contact";
    titleView.font = FontCustom(16);
    [headerBgView addSubview:titleView];
    if (self.countdown == 0) {
        self.timeView.hidden = YES;
        self.headerView.h = NavBarHeight + 64;
    }else {
        [self.headerView addSubview:self.timeView];
        self.timeView.hidden = NO;
        self.headerView.h = NavBarHeight + 64 + 40;
    }
    [self.headerView addSubview:headerBgView];
    [self.content addSubview:self.headerView];
}


- (void)loadUI {
//    self.countdown = 10;
    if (self.countdown > 0) {
        [self.timeView start:self.countdown];
    }
    [self loadHeader];

    _contactView = [[UIView alloc] initWithFrame:CGRectMake(0, self.headerView.bottom + 10, ScreenWidth, 170*_dataArr.count)];
    _contactView.backgroundColor = UIColor.whiteColor;
    [self.content addSubview:_contactView];
    
    self.content.contentSize = CGSizeMake(ScreenWidth, self.contactView.bottom + SafeBottomHeight + 70);
    
    _cotnactArr = [NSMutableArray array];
    
    for (int i = 0; i < _dataArr.count; i++) {
        NSDictionary *dic = _dataArr[i];
        LinkmanCell *contact = [[LinkmanCell alloc] initWithFrame:CGRectMake(0, 170*i, ScreenWidth, 170) data:dic];
        contact.lever = i;
        [_contactView addSubview:contact];
        [_cotnactArr addObject:contact];
    }
    
    UIButton *nextBtnItem = [HView normalBtn:CGRectMake(34, self.view.h - SafeBottomHeight - 60, ScreenWidth - 68, 48) title:@"Next" font:24];
    [nextBtnItem showBottomShadow:COLORA(0, 0, 0, 0.2)];
    [nextBtnItem addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(nextAction)]];
    [self.view addSubview:nextBtnItem];
}

- (void)nextAction {
    for (int i = 0; i < _cotnactArr.count; i++) {
        LinkmanCell *contact = _cotnactArr[i];
        NSString *name = contact.data[p_name];
        NSInteger relation = [contact.data[p_relation] integerValue];
        NSString *mobile = contact.data[p_mobile];
        if (name.length == 0 || mobile.length == 0 || relation < 1) {
            [PPToast show:@"Please complete information"];
            return;
        }
    }
    [self saveData];

}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.step = 1;
    self.content.backgroundColor = BGColor;
    [self requestInfoData];
}


- (void)saveData {
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:@{p_product_id:notNull(self.productId)}];
    for (int i = 0; i < _cotnactArr.count; i++) {
        LinkmanCell *contact = _cotnactArr[i];
        NSString *name = contact.data[p_name];
        NSString *mobile = contact.data[p_mobile];
        NSArray *fieldArr = _dataArr[i][p_field];
        if (fieldArr.count == 3) {
            NSString *nameKey = fieldArr[0][p_name];
            NSString *mobileKey = fieldArr[1][p_name];
            NSString *relationKey = fieldArr[2][p_name];
            dic[notNull(nameKey)] = name;
            dic[notNull(mobileKey)] = mobile;
            dic[notNull(relationKey)] = StrFormat(@"%@", @(i + 1));
        }
    }
    dic[p_point] = [self track];
    kWeakself;
    [Http post:R_save_contact params:dic success:^(Response *response) {
        if (response.success) {
            [Route jumpWithProdutId:weakSelf.productId];
        }else {
            [PPToast show:response.msg];
        }
    } failure:^(NSError *error) {

    } showLoading:YES];
}

- (TimeView*)timeView {
    if(!_timeView) {
        kWeakself;
        _timeView = [[TimeView alloc] initWithFrame:CGRectMake(0, NavBarHeight + 64 - 20, ScreenWidth, 60)];
        _timeView.finishBlock = ^{
            weakSelf.countdown = 0;
            [weakSelf loadHeader];
            weakSelf.contactView.y = weakSelf.headerView.bottom + 10;
        };
        [_timeView showRadiusBottom:16];
        [_timeView addShadow];
    }
    return _timeView;
}



@end
