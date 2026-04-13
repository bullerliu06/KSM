//
//  PPHomePage.m
// FIexiLend
//
//  Created by jacky on 2024/10/31.
//

#import "PPHomePage.h"
#import "MJRefresh.h"
#import "PPHomeView.h"
#import "PPCreditView.h"
#import "CustomAlert.h"

@interface PPHomePage ()
@property (nonatomic, strong) PPHomeView *homeView;
@property (nonatomic, strong) PPCreditView *leningedCardView;
@property (nonatomic, strong) NSMutableArray *itemList;
@property (nonatomic, strong) NSMutableArray *bannerData;
@property (nonatomic, strong) NSMutableArray *defaultCardData;
@property (nonatomic, strong) NSMutableArray *lendingLittleData;
@property (nonatomic, strong) NSMutableArray *payData;
@property (nonatomic, copy) NSDictionary *serviceData;
@property (nonatomic, strong) MJRefreshNormalHeader *refreshHeader;
@property (nonatomic, assign) BOOL isBlock;
@property (nonatomic, strong) CustomAlert *openAlert;
@property (nonatomic, copy) NSString *jumpUrl;
@end

@implementation PPHomePage

- (void)viewDidLoad {
    [super viewDidLoad];
    self.content.backgroundColor = BGColor;
    self.content.h = ScreenHeight;

    kWeakself;
    _refreshHeader = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf loadData];
    }];
    self.content.mj_header = _refreshHeader;
    
    self.homeView = [[PPHomeView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 0)];
    [self.content addSubview:self.homeView];
    self.leningedCardView = [[PPCreditView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 0)];
    [self.content addSubview:self.leningedCardView];
    [self loadLaunchData];

}

- (void)loadLaunchData {
    if (!User.isLogin) {
        return;
    }
    kWeakself;
    [Http get:R_openAlert params:nil success:^(Response *response) {
        if (response.success) {
            NSString *imgUrl = response.dataDic[p_imgUrl];
            weakSelf.jumpUrl = response.dataDic[p_url];
            [weakSelf openAlert:imgUrl];
        }
    } failure:^(NSError *error) {
    }];
}

- (void)openAlert:(NSString *)imgUrl {
    if (![imgUrl containsString:@"http"]) {
        return;
    }
    CGFloat alertWidth = ScreenWidth - 32*2;
    CGFloat alertHeight = alertWidth;
    
    SDAnimatedImageView *alertView = [[SDAnimatedImageView alloc] initWithFrame:CGRectMake(32, ScreenHeight - alertHeight, alertWidth, alertHeight)];
    alertView.centerX = ScreenWidth/2;
    alertView.centerY = ScreenHeight/2;
    alertView.userInteractionEnabled = YES;
    [alertView sd_setImageWithURL:[NSURL URLWithString:imgUrl]];
    [alertView showRadius:16];
    [alertView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sureAction)]];
    
    _openAlert = [[CustomAlert alloc] initWithCustomView:alertView];
    [_openAlert show];
}

- (void)sureAction {
    [Route jump:self.jumpUrl];
    [_openAlert hide];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (!User.isLogin) {
        return;
    }
    [self loadData];
}

- (void)loadData {
    kWeakself;
    [Http get:R_home params:@{} success:^(Response *response) {
        [weakSelf.content.mj_header endRefreshing];
        if (response.success) {
            weakSelf.serviceData = response.dataDic[p_icon];
            NSArray *list = response.dataDic[p_list];
            [weakSelf setupData:list];
        }
    } failure:^(NSError *error) {
        
    } showLoading:YES];
}

- (void)setupData:(NSArray *)items {
    for (NSDictionary *dic in items) {
        NSString *type = dic[p_type];
        if ([type isEqualToString:p_BANNER]) {
            self.bannerData = dic[p_item];
        }
        if ([type isEqualToString:p_LARGE_CARD]) {
            self.defaultCardData = dic[p_item];
        }
        if ([type isEqualToString:p_REPAY]) {
            self.payData = dic[p_item];
        }
        if ([type isEqualToString:p_SMALL_CARD]) {
            self.lendingLittleData = dic[p_item];
        }
        if ([type isEqualToString:p_PRODUCT_LIST]) {
            self.itemList = dic[p_item];
        }
    }
    [self createUI];
}

- (void)createUI {
    if (self.defaultCardData.count > 0) {
        self.leningedCardView.hidden = YES;
        self.homeView.hidden = NO;
        [self.homeView refreshBanner:self.bannerData card:self.defaultCardData];
        [self.content fitView:self.homeView];
    }else if (self.lendingLittleData.count > 0){
        self.homeView.hidden = YES;
        self.leningedCardView.hidden = NO;
        [self.leningedCardView refreshBanner:self.bannerData card:self.lendingLittleData payData:self.payData items:self.itemList];
        [self.content fitView:self.leningedCardView];
    }
    User.suspendDic = [NSMutableDictionary dictionaryWithDictionary:self.serviceData];
    [User showSuspend];
}

@end
