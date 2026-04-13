//
//  BankPage.m
// FIexiLend
//
//  Created by jacky on 2024/11/20.
//

#import "BankPage.h"
#import "TimeView.h"
#import "BankAlert.h"
#import "WalletItem.h"
#import "BankItem.h"

@interface BankPage ()
@property (nonatomic, strong) TimeView *timeView;

@property (nonatomic, strong) BankAlert *confirmAlert;
@property (nonatomic, strong) UIButton *walletItemView;
@property (nonatomic, strong) UIButton *bankItemBtn;
@property (nonatomic, strong) WalletItem *walletView;
@property (nonatomic, copy) NSArray *walletInfoListArray;
@property (nonatomic, strong) NSMutableDictionary *walletInfoData;
@property (nonatomic, strong) NSMutableDictionary *saveDic;
@property (nonatomic, assign) NSInteger countdownTimes;
@property (nonatomic, strong) NSMutableDictionary *bankInfoData;

@property (nonatomic, strong) BankItem *bankItemView;
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, copy) NSArray *bankInfoListArray;
@end

@implementation BankPage

- (void)saveResult:(NSDictionary *)dic  {
    NSMutableDictionary *saveDic = [NSMutableDictionary dictionaryWithDictionary:dic];
    saveDic[p_point] = [self track];
    kWeakself;
    [Http post:R_save_bank params:saveDic success:^(Response *response) {
        if (response.success) {
            [Route jumpWithProdutId:weakSelf.productId];
        }else {
            [PPToast show:response.msg];
        }
    } failure:^(NSError *error) {
    } showLoading:YES];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.step = 4;
    self.index = 0;
    self.title = @"Withdrawal account";
    self.content.backgroundColor = rgba(247, 251, 255, 1);
    self.saveDic = [NSMutableDictionary dictionary];
    [self loadData];
}

- (TimeView*)timeView {
    if(!_timeView) {
        kWeakself;
        _timeView = [[TimeView alloc] initWithFrame:CGRectMake(0, StatusBarHeight + 24, ScreenWidth, 60)];
        _timeView.finishBlock = ^{
            weakSelf.countdownTimes = 0;
            weakSelf.timeView.hidden = YES;
            [weakSelf.timeView removeFromSuperview];
        };
        [_timeView showRadiusBottom:16];
        [_timeView addShadow];
    }
    return _timeView;
}

- (void)walletAction {
    self.bankItemBtn.backgroundColor = rgba(212, 231, 255, 1);

    [self.view endEditing:YES];
    self.walletView.hidden = NO;
    self.walletItemView.selected = YES;
    self.bankItemBtn.selected = NO;
    self.walletItemView.backgroundColor = MainColor;
    self.bankItemView.hidden = YES;
    self.index = 0;

}
- (void)loadUI {
    if (self.countdownTimes > 0) {
        [self.navBar insertSubview:self.timeView atIndex:0];
        [self.timeView start:self.countdownTimes];
    }
    
    _walletItemView = [UIButton buttonWithType:UIButtonTypeCustom];
    _walletItemView.frame = CGRectMake(12, 54, ScreenWidth/2 - 18, 38);
    [_walletItemView setTitle:@"E-Wallet" forState:UIControlStateNormal];
    _walletItemView.titleLabel.font = FontBold(16);
    _walletItemView.backgroundColor = rgba(212, 231, 255, 1);

    [_walletItemView setTitleColor:TextBlackColor forState:UIControlStateNormal];
    [_walletItemView setTitleColor:UIColor.whiteColor forState:UIControlStateSelected];

    [self.content addSubview:_walletItemView];
    [_walletItemView addTarget:self action:@selector(walletAction) forControlEvents:UIControlEventTouchUpInside];
    [_walletItemView showRadius:19];

    _bankItemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _bankItemBtn.frame = CGRectMake(12 + _walletItemView.right, 54, ScreenWidth/2 - 18, 38);
    [_bankItemBtn setTitle:@"Bank" forState:UIControlStateNormal];

    _bankItemBtn.titleLabel.font = FontBold(16);
    _bankItemBtn.backgroundColor = rgba(212, 231, 255, 1);
    [_bankItemBtn setTitleColor:TextBlackColor forState:UIControlStateNormal];
    [_bankItemBtn setTitleColor:UIColor.whiteColor forState:UIControlStateSelected];
    [self.content addSubview:_bankItemBtn];
    
    [self walletAction];
    [_bankItemBtn addTarget:self action:@selector(bankAction) forControlEvents:UIControlEventTouchUpInside];
    [_bankItemBtn showRadius:19];

    
    _walletView = [[WalletItem alloc] initWithFrame:CGRectMake(0, _walletItemView.bottom + 22, ScreenWidth, _walletInfoListArray.count*60 + 54 + 177) wallets:_walletInfoListArray data:_walletInfoData];
    [self.content addSubview:_walletView];
    _walletView.backgroundColor = UIColor.whiteColor;
    
    _bankItemView = [[BankItem alloc] initWithFrame:CGRectMake(0, _walletItemView.bottom + 22, ScreenWidth, _walletView.h) banks:_bankInfoListArray data:_bankInfoData];
    [self.content addSubview:_bankItemView];
    _bankItemView.hidden = YES;
    _bankItemView.backgroundColor = UIColor.whiteColor;

    
    UIButton *_next = [HView normalBtn:CGRectMake(34, self.view.h - SafeBottomHeight - 60, ScreenWidth - 68, 48) title:@"Apply" font:24];
    [self.view addSubview:_next];
    [_next showBottomShadow:COLORA(0, 0, 0, 0.2)];

    [_next addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(nextActionClick)]];

}


- (void)loadData {
    NSDictionary *dic = @{
        p_product_id: self.productId,
    };
    kWeakself;
    [Http post:R_bank params:dic success:^(Response *response) {
        if (response.success) {
            weakSelf.walletInfoData = [NSMutableDictionary dictionaryWithDictionary:response.dataDic[p_wallet][p_filled]];
            weakSelf.bankInfoListArray = response.dataDic[p_bank][@"rsexsuctionCiopjko"];
            weakSelf.walletInfoListArray = response.dataDic[p_wallet][@"rsexsuctionCiopjko"];
            weakSelf.countdownTimes = [response.dataDic[p_countdown] integerValue];
            weakSelf.bankInfoData = [NSMutableDictionary dictionaryWithDictionary:response.dataDic[p_bank][p_filled]];
            [weakSelf loadUI];
        }
        
    } failure:^(NSError *error) {
        NSLog(@"======faild!");
    }];
}

- (void)nextActionClick {
    NSString *selectType = @"";
    NSString *account = @"";
    NSString *channel = @"";
    if (_index == 0) {
        channel = [_walletInfoData[p_channel] stringValue];
        if (channel.length == 0) {
            [PPToast show:@"Please select E-wallet"];
            return;
        }
        account = _walletView.account;
        if (account.length == 0){
            [PPToast show:@"Please enter E-wallet Account"];
            return;
        }
        selectType = @"2";
        if (![account hasPrefix:@"0"]) {
            account = StrFormat(@"0%@", account);
        }
    }else if (_index == 1) {
        channel = [_bankInfoData[p_channel] stringValue];
        if (channel.length == 0) {
            [PPToast show:@"Please select Bank"];
            return;
        }
        account = _bankItemView.account;
        if (account.length == 0){
            [PPToast show:@"Please enter Bank Account"];
            return;
        }
        selectType = @"1";
    }

    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:@{p_product_id:notNull(self.productId), p_card_type:selectType}];
    dic[p_channel] = notNull(channel);
    dic[p_account] = account;
//    dic[p_point] = [self point];
    
    [self showSurePop:dic];
}


- (void)bankAction {
    self.walletItemView.backgroundColor = rgba(212, 231, 255, 1);

    self.index = 1;
    self.walletItemView.selected = NO;
    [self.view endEditing:YES];
    self.walletView.hidden = YES;
    self.bankItemView.hidden = NO;
    self.bankItemBtn.backgroundColor = MainColor;
    self.bankItemBtn.selected = YES;
}

- (void)showSurePop:(NSDictionary *)dic {
    NSString *bank = @"";
    if (_index == 0) {
        bank = _walletView.bankName;
    }else {
        bank = _bankItemView.bankName;
    }
    kWeakself;
    _confirmAlert = [[BankAlert alloc] initWithBank:bank account:dic[p_account]];
    _confirmAlert.confirmBlock = ^{
        [weakSelf saveResult:dic];
    };
    [_confirmAlert show];
}

@end
