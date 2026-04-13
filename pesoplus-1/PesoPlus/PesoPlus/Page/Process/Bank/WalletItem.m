//
//  WalletItem.m
// FIexiLend
//
//  Created by jacky on 2024/11/20.
//

#import "WalletItem.h"

@interface WalletItem () <UITextFieldDelegate>

@property (nonatomic, strong) UIView *walletMode;
@property (nonatomic, copy) NSArray *walletsListArray;
@property (nonatomic, strong) UITextField *numberText;

@end

@implementation WalletItem

- (NSString *)account {
    return _numberText.text;
}

- (id)initWithFrame:(CGRect)frame wallets:(NSArray *)arr data:(NSMutableDictionary *)saveDic {
    self = [super initWithFrame:frame];
    if (self) {
        self.walletsListArray = arr;
        self.saveDic = saveDic;
        [self loadUI];
    }
    return self;
}

- (void)loadUI {
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.w, 38)];
    title.backgroundColor = rgba(236, 245, 255, 1);
    title.text = @"Select E-Wallet";

    [self addSubview:title];
    title.textColor = rgba(51, 51, 51, 1);
    title.textAlignment = NSTextAlignmentCenter;
    title.font = FontBold(14);
    
    _walletMode = [[UIView alloc] initWithFrame:CGRectMake(0, 38, self.w, 60*self.walletsListArray.count)];
    [self addSubview:_walletMode];
    [self refreshTypeView];
    _walletMode.backgroundColor = UIColor.whiteColor;

    
    UILabel *accountDesc = [[UILabel alloc] initWithFrame:CGRectMake(16, _walletMode.bottom, self.w - 32, 40)];
    accountDesc.textColor = rgba(51, 51, 51, 1);
    accountDesc.font = Font(12);
    accountDesc.text = @"E-wallet Account";

    [self addSubview:accountDesc];
    
    _numberText = [[UITextField alloc] initWithFrame:CGRectMake(self.w - LeftMargin - 200, _walletMode.bottom, 200, 40)];
    _numberText.borderStyle = UITextBorderStyleNone;
    _numberText.textAlignment = NSTextAlignmentRight;
    _numberText.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;

    _numberText.delegate = self;
    _numberText.font = Font(12);
    _numberText.textColor = rgba(51, 51, 51, 1);

    _numberText.keyboardType = UIKeyboardTypeAlphabet;
    _numberText.placeholder = @"Please enter";
    _numberText.clearButtonMode = UITextFieldViewModeWhileEditing;
    NSString *account = User.userName;
    if (![account hasPrefix:@"0"]) {
        account = StrFormat(@"0%@", account);
    }
    _numberText.text = account;
    [self addSubview:_numberText];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(LeftMargin, _walletMode.bottom + 40, SafeWidth, 1)];
    line.backgroundColor = rgba(187, 187, 187, 1);
    [self addSubview:line];
    
    UILabel *desc = [[UILabel alloc] initWithFrame:CGRectMake(LeftMargin, line.bottom + 22, SafeWidth, 30)];
    
    NSString *aString = @"Please confirm the account belongs";
    NSString *bString = @" to yourself and is correct, it will be used ";
    NSString *cString = @"as a receipt account to receive the funds";
    NSString *valueString = StrFormat(@"%@%@%@", aString, bString, cString);

    
    desc.text = valueString;
    desc.textColor = rgba(102, 102, 102, 1);
    desc.font = Font(12);
    desc.numberOfLines = 0;
    [self addSubview:desc];
    self.h = desc.bottom + 16;
}


- (void)typeClick:(UIButton *)sender {
    NSDictionary *dic = self.walletsListArray[sender.tag];
    _saveDic[p_channel] = dic[p_id];
    [self refreshTypeView];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    if (newString.length >= 100) {
        newString = [newString substringToIndex:100];
    }
    textField.text = newString;
    return NO;
}



- (void)refreshTypeView {
    [_walletMode removeAllViews];
        
    for (int i = 0; i < self.walletsListArray.count; i++) {
        NSDictionary *dic = self.walletsListArray[i];
        UIButton *valueButton = [UIButton buttonWithType:UIButtonTypeCustom];
        valueButton.frame = CGRectMake(0, i*60, self.w, 60);

        valueButton.tag = i;
        [valueButton addTarget:self action:@selector(typeClick:) forControlEvents:UIControlEventTouchUpInside];
        [_walletMode addSubview:valueButton];
        
        UIImageView *leadImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 34, 34)];
        [valueButton addSubview:leadImageView];
        [leadImageView sd_setImageWithURL:[NSURL URLWithString:dic[p_icon]]];

        
        UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(leadImageView.right + 10, 15, _walletMode.w - 120, 34)];
        nameLabel.textColor = rgba(51, 51, 51, 1);
        nameLabel.font = FontBold(14);
        nameLabel.text = dic[p_name];

        [valueButton addSubview:nameLabel];

        UIButton *iconButtom = [UIButton buttonWithType:UIButtonTypeCustom];
        iconButtom.frame = CGRectMake(valueButton.w - 41, 19, 26, 26);
        iconButtom.userInteractionEnabled = NO;

        [iconButtom setBackgroundImage:ImageWithName(@"gender_unselected") forState:UIControlStateNormal];
        [iconButtom setBackgroundImage:ImageWithName(@"gender_selected") forState:UIControlStateSelected];
        [valueButton addSubview:iconButtom];
        if (i < self.walletsListArray.count - 1) {
            UIView *grayLine = [[UIView alloc] initWithFrame:CGRectMake(LeftMargin, valueButton.h - 1, valueButton.w - LeftMargin, 1)];
            grayLine.backgroundColor = rgba(221, 233, 253, 1);
            [valueButton addSubview:grayLine];
        }
        NSInteger saveValue = [_saveDic[p_channel] integerValue];
        NSInteger realValue = [dic[p_id] integerValue];
        iconButtom.selected = (realValue == saveValue);

        if (realValue == saveValue) {
            self.bankName = dic[p_name];
        }
    }
}


@end
