//
//  LinkmanCell.m
// FIexiLend
//
//  Created by jacky on 2024/11/19.
//

#import "LinkmanCell.h"
#import <ContactsUI/ContactsUI.h>
#import "RelationAlert.h"
#import "IconTitleView.h"

@interface LinkmanCell () <CNContactPickerDelegate>
@property (nonatomic, strong) UILabel *nameValueLabel;
@property (nonatomic, strong) UIImageView *image;
@property (nonatomic, strong) UILabel *infoDescLabel;
@property (nonatomic, strong) UILabel *phoneValueLabel;
@property (nonatomic, strong) RelationAlert *alert;
@property (nonatomic, strong) UIView *itemBg;
@property (nonatomic, strong) IconTitleView *relationValueView;


@end

@implementation LinkmanCell

- (id)initWithFrame:(CGRect)frame data:(NSDictionary *)dic {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.whiteColor;
        self.data = [NSMutableDictionary dictionary];
        self.data[p_mobile] = dic[p_filled][p_mobile];
        self.data[p_name] = dic[p_filled][p_name];
        self.data[p_relation] = dic[p_filled][p_relation];
        self.data[p_note] = dic[p_relation];
        [self loadUI:dic];
    }
    return self;
}

- (void)infoTap:(UIButton*)sender {
    [self showLinkMan];
}

- (void)relationAction {
    NSArray *noteList = self.data[p_note];
    kWeakself;
    _alert = [[RelationAlert alloc] initWithData:noteList selected:[self.data[p_relation] stringValue] title:@"Relation Ship"];
    _alert.selectBlock = ^(NSDictionary *dic) {
        weakSelf.data[p_relation] = dic[p_key];
            [weakSelf refreshData];
        };
    [_alert show];
}


- (void)loadUI:(NSDictionary *)dic {
    
    _infoDescLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.w, 38)];
    _infoDescLabel.backgroundColor = rgba(247, 251, 255, 1);

    _infoDescLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_infoDescLabel];
    _infoDescLabel.text = dic[p_title];
    _infoDescLabel.textColor = TextBlackColor;
    _infoDescLabel.font = FontBold(14);
    
    UILabel *relationDesc = [[UILabel alloc] initWithFrame:CGRectMake(LeftMargin, _infoDescLabel.bottom, self.w - 2*LeftMargin, 50)];
    relationDesc.textColor = TextGrayColor;
    relationDesc.font = Font(14);
    [self addSubview:relationDesc];
    relationDesc.text = @"Relationship";

    
    _relationValueView = [[IconTitleView alloc] initWithFrame:CGRectMake(0, _infoDescLabel.bottom, self.w - LeftMargin, 50) title:@"Please select" color:TextGrayColor font:14 icon:@"arrow_bot"];
    _relationValueView.type = HaoBtnType4;
    [_relationValueView addTarget:self action:@selector(relationAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_relationValueView];
    
    UIView *lineGrayView = [[UIView alloc] initWithFrame:CGRectMake(16, 90, self.w - 32, 0.8)];
    [self addSubview:lineGrayView];
    lineGrayView.backgroundColor = LineGrayColor;

    
    _itemBg = [[UIView alloc] initWithFrame:CGRectMake(16, lineGrayView.bottom + 7, self.w - 32, 58)];
    [self addSubview:_itemBg];
    _itemBg.backgroundColor = rgba(239, 246, 255, 1);

        
    UIImageView *linkIcon = [[UIImageView alloc] initWithFrame:CGRectMake(_itemBg.w - 26 - LeftMargin, 13, 26, 32)];
    [_itemBg addSubview:linkIcon];
    linkIcon.image = ImageWithName(@"linkman_icon");

    
    _nameValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, _itemBg.w - 80, 24)];
    _nameValueLabel.textColor = rgba(51, 51, 51, 1);
    _nameValueLabel.font = Font(12);
    _nameValueLabel.text = @"Name";

    [_itemBg addSubview:_nameValueLabel];
    
    _phoneValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, _nameValueLabel.bottom, _itemBg.w - 80, 17)];
    _phoneValueLabel.font = Font(12);

    _phoneValueLabel.text = @"Phone Number";
    _phoneValueLabel.textColor = rgba(51, 51, 51, 1);
    [_itemBg addSubview:_phoneValueLabel];
    
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(infoTap:)]];
    [self refreshData];
}


- (void)refreshData {
    NSString *name = _data[p_name];
    NSString *mobile = _data[p_mobile];
    NSInteger relation = [_data[p_relation] integerValue];
    if (name.length == 0 || mobile.length == 0) {
        _phoneValueLabel.text = @"Phone Number";
        _nameValueLabel.font = Font(12);
        _nameValueLabel.text = @"Name";
        _infoDescLabel.backgroundColor = rgba(247, 251, 255, 1);

        _phoneValueLabel.font = Font(12);
        _itemBg.backgroundColor = rgba(239, 246, 255, 1);
    }else {
        _nameValueLabel.font = FontBold(14);
        _phoneValueLabel.font = FontBold(14);
        _nameValueLabel.text = name;
        _phoneValueLabel.text = mobile;

        _infoDescLabel.backgroundColor = rgba(255, 248, 226, 1);
        _itemBg.backgroundColor = rgba(255, 243, 205, 1);
    }
    if (relation > 0) {
        NSArray *noteList = self.data[p_note];
        for (NSDictionary *dic in noteList) {
            NSInteger key = [dic[p_key] integerValue];
            NSString *name = dic[p_name];
            if (key == relation) {
                self.relationValueView.title = notNull(name);
            }
        }
    }
}


- (void)contactPicker:(CNContactPickerViewController *)picker didSelectContactProperty:(CNContactProperty *)contactProperty {
    
    NSString *name = [NSString stringWithFormat:@"%@%@",contactProperty.contact.familyName,contactProperty.contact.givenName];
    NSString *phone = [contactProperty.value stringValue];
    self.data[p_name] = name;

    self.data[p_mobile] = phone;
    [self refreshData];
}


- (void)showLinkMan {
    CNContactPickerViewController *contactPicker = [[CNContactPickerViewController alloc] init];
    contactPicker.delegate = self;
    contactPicker.displayedPropertyKeys = @[CNContactPhoneNumbersKey];
    contactPicker.modalPresentationStyle = UIModalPresentationFullScreen;

    [Page present:contactPicker animated:YES completion:nil];
}
@end
