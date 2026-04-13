//
//  PPHomeView.m
// FIexiLend
//
//  Created by jacky on 2024/11/6.
//

#import "PPHomeView.h"
#import "JYBanner.h"

@interface PPHomeView ()
@property (nonatomic, strong) UIImageView *headerImageView;
@property (nonatomic, strong) JYBanner *bannerView;
@property (nonatomic, strong) UIView *pravicyView;
@property (nonatomic, assign) BOOL isBlock;
@property (nonatomic, copy) NSDictionary *cardDic;
@property (nonatomic, strong) NSMutableArray *bannerItems;
@end

@implementation PPHomeView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.clearColor;
    }
    return self;
}

- (void)refreshBanner:(NSMutableArray *)bannerData card:(NSMutableArray *)cardData {
    kWeakself;
    [self removeAllViews];
    
    self.headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 325*WS)];
    self.headerImageView.userInteractionEnabled = YES;
    self.headerImageView.image = ImageWithName(@"home_header");
    
    UIImageView *advantageImageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 186*WS, ScreenWidth, 240*WS)];
    advantageImageview.image = ImageWithName(@"home_advantage");
    [self addSubview:advantageImageview];
    [self addSubview:self.headerImageView];
    
    _bannerItems = bannerData;
    NSMutableArray *imageUrlList = [NSMutableArray array];
    for (NSDictionary *dic in bannerData) {
        [imageUrlList addObject:notNull(dic[p_imgUrlNew])];
    }
    if (imageUrlList.count > 0) {
        self.bannerView = [[JYBanner alloc] initWithFrame:CGRectMake(LeftMargin, advantageImageview.bottom + 15, SafeWidth, 99) configBlock:^JYConfiguration *(JYConfiguration *carouselConfig) {
            carouselConfig.pageContollType = MiddlePageControl;
            carouselConfig.interValTime = 2;
            return carouselConfig;
        } clickBlock:^(NSInteger index) {
            [weakSelf bannerAction:index];
        }];
        [self.bannerView showRadius:8];
        [self addSubview:self.bannerView];
        [self.bannerView startCarouselWithArray:imageUrlList];
    }
    
    JYBanner *displayBanner = [[JYBanner alloc] initWithFrame:CGRectMake(0, self.bannerView.bottom + 10, ScreenWidth, 137*WS) configBlock:^JYConfiguration *(JYConfiguration *carouselConfig) {
        carouselConfig.pageContollType = NonePageControl;
        carouselConfig.interValTime = 3;
        return carouselConfig;
    } clickBlock:^(NSInteger index) {
    }];
    [self addSubview:displayBanner];
    [displayBanner startCarouselWithArray:[NSMutableArray arrayWithArray:@[@"banner1", @"banner2"]]];
    
    UIImageView *publicImageView = [[UIImageView alloc] initWithFrame:CGRectMake(40*WS, displayBanner.bottom + 15, ScreenWidth - 80*WS, 35*WS)];
    publicImageView.image = ImageWithName(@"right_desc");
    [self addSubview:publicImageView];
    
    self.pravicyView = [[UIView  alloc] initWithFrame:CGRectMake(LeftMargin, publicImageView.bottom + 15, SafeWidth, 40)];
    [self addSubview:self.pravicyView];
    [self setupPrivacy];
    
    self.h = self.pravicyView.bottom + TabBarHeight;
    _cardDic = cardData[0];
    [self setupCard:_cardDic];
    
}

- (void)selectAction:(NSDictionary *)cardInfo  {
    if (!User.isLogin) {
        [User login];
        return;
    }
    if (_isBlock) {
        return;
    }
    if (User.appstore) {
        NSString *pid = [cardInfo[p_id] stringValue];
        [Route jumpWithProdutId:pid];
        return;
    }
    [Track getLocationAndUpload:^(BOOL value) {
        if (value) {
            NSString *pid = [cardInfo[p_id] stringValue];
            [Route jumpWithProdutId:pid];
        }else {
            
        }
    }];
    [self updateApplyStatus];
}

- (void)updateApplyStatus {
    _isBlock = YES;
    [self performSelector:@selector(endBlock) withObject:nil afterDelay:1];
}

- (void)endBlock {
    _isBlock = NO;
}

- (void)bannerAction:(NSInteger)index {
    NSDictionary *item = _bannerItems[index];
    NSString *url = item[@"rseltCiopjko"];
    if (isBlankStr(url)) {
        return;
    }
    [Page push:@"PPWebPage" param:@{@"url":url}];
}

- (void)setupCard:(NSDictionary *)data {
        
    NSString *amountDesc = data[p_amountRange];
    if (amountDesc.length > 1) {
        NSString *firstCharacter = [amountDesc substringToIndex:1];
        NSString *remainingCharacters = [amountDesc substringFromIndex:1];
                
        UILabel *amountLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 61*WS, 20, 80)];
        amountLabel.text = remainingCharacters;
        amountLabel.textColor = UIColor.whiteColor;
        amountLabel.font = FontBold(65);
        amountLabel.textAlignment = NSTextAlignmentLeft;
        [amountLabel sizeToFit];
        amountLabel.h = 80;
        amountLabel.centerX = self.w/2 + 5;
        [self.headerImageView addSubview:amountLabel];
        
        UILabel *leadLabel = [[UILabel alloc] initWithFrame:CGRectMake(amountLabel.x - 24, 92*WS, 24, 48)];
        leadLabel.text = firstCharacter;
        leadLabel.textColor = UIColor.whiteColor;
        leadLabel.font = FontBold(24);
        leadLabel.textAlignment = NSTextAlignmentCenter;
        [self.headerImageView addSubview:leadLabel];
    }
    
    UILabel *valueDesc = [[UILabel alloc] initWithFrame:CGRectMake(0, 137*WS, self.w, 24)];
    valueDesc.text = notNull(data[p_amountRangeDes]);
    valueDesc.textColor = UIColor.whiteColor;
    valueDesc.font = FontBold(20);
    valueDesc.textAlignment = NSTextAlignmentCenter;
    [self.headerImageView addSubview:valueDesc];
    
    UILabel *leftDesc = [[UILabel alloc] initWithFrame:CGRectMake(42*WS, 172*WS, self.w - 42*WS, 20)];
    leftDesc.text = StrFormat(@"%@:", notNull(data[p_termInfoDes]));
    leftDesc.textColor = UIColor.whiteColor;
    leftDesc.font = Font(14);
    leftDesc.textAlignment = NSTextAlignmentLeft;
    [self.headerImageView addSubview:leftDesc];
    
    UILabel *leftValue = [[UILabel alloc] initWithFrame:CGRectMake(42*WS, leftDesc.bottom , self.w - 42*WS, 20)];
    leftValue.text = notNull(data[p_termInfo]);
    leftValue.textColor = UIColor.whiteColor;
    leftValue.font = FontCustom(14);
    leftValue.textAlignment = NSTextAlignmentLeft;
    [self.headerImageView addSubview:leftValue];
    
    UILabel *rightDesc = [[UILabel alloc] initWithFrame:CGRectMake(16 + self.w/2, 172*WS, self.w - 42*WS, 20)];
    rightDesc.text = StrFormat(@"%@:", notNull(data[p_loanRateDes]));
    rightDesc.textColor = UIColor.whiteColor;
    rightDesc.font = Font(14);
    rightDesc.textAlignment = NSTextAlignmentLeft;
    [self.headerImageView addSubview:rightDesc];

    UILabel *rightInfo = [[UILabel alloc] initWithFrame:CGRectMake(16 + self.w/2, rightDesc.bottom, self.w/2 - 16, 20)];
    rightInfo.text = notNull(data[p_loanRate]);
    rightInfo.textColor = UIColor.whiteColor;
    rightInfo.font = FontCustom(14);
    rightInfo.textAlignment = NSTextAlignmentLeft;
    rightInfo.adjustsFontSizeToFitWidth = YES;
    [self.headerImageView addSubview:rightInfo];
    
    NSString *applyDesc = data[p_buttonText];
    NSString *applyColor = data[p_buttoncolor];
    
    UIButton *apply = [[UIButton alloc] initWithFrame:CGRectMake(self.headerImageView.w/2 - 44*WS, self.headerImageView.h - 23*WS - 88*WS, 88*WS, 88*WS)];
//    apply.titleLabel.adjustsFontSizeToFitWidth = YES;
    apply.titleLabel.font = FontCustom(22);
    apply.titleLabel.numberOfLines = 2;
    apply.titleLabel.textAlignment = NSTextAlignmentCenter;
    [apply setTitle:notNull(applyDesc) forState:UIControlStateNormal];
    [apply setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    apply.backgroundColor = [PPHelper colorFromHex:notNull(applyColor)];
    apply.layer.borderColor = COLORA(238, 175, 0, 1).CGColor;
    apply.layer.borderWidth = 4;
    apply.layer.cornerRadius = 44;
    apply.layer.masksToBounds = YES;
    [apply addTarget:self action:@selector(applyAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.headerImageView addSubview:apply];
}

- (void)applyAction {
    [self selectAction:_cardDic];
}

- (void)setupPrivacy {
    UIImageView *tips = [[UIImageView alloc] initWithFrame:CGRectMake(0, 6, 12, 12)];
    tips.image = ImageWithName(@"home_tips");
    [self.pravicyView addSubview:tips];
    
    UILabel *click = [[UILabel alloc] initWithFrame:CGRectMake(tips.right + 5, 0, 0, 24)];
    click.text = @"Click to view the ";
    click.textColor = COLORA(61, 61, 61, 1);
    click.font = Font(10);
    [click sizeToFit];
    click.h = 24;
    [self.pravicyView addSubview:click];
    
    UILabel *pravicy = [[UILabel alloc] initWithFrame:CGRectMake(click.right, 0, 0, 24)];
    pravicy.userInteractionEnabled = YES;
    pravicy.text = @"Privacy Agreement>>>";
    pravicy.textColor = MainColor;
    pravicy.font = Font(12);
    [pravicy sizeToFit];
    pravicy.h = 24;
    [pravicy addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(agreementAction)]];
    [self.pravicyView addSubview:pravicy];
    
    self.pravicyView.w = pravicy.right;
    self.pravicyView.centerX = self.w/2;
}


- (void)agreementAction {
    NSString *urlStr = StrFormat(@"%@%@", Http.h5Url, PrivacyUrl);
    [Page push:@"PPWebPage" param:@{@"url":urlStr}];
}

@end
