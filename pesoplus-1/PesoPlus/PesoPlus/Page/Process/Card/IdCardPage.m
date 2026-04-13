//
//  IdCardPage.m
// FIexiLend
//
//  Created by jacky on 2024/11/19.
//

#import "IdCardPage.h"
#import "HPicture.h"
#import "DayAlert.h"
#import "TimeView.h"
#import "InfoAlert.h"
#import "InfoCell.h"
#import "GenderCell.h"
#import "InputCell.h"
#import "IdCardAlert.h"

#import "IconTitleView.h"

@interface IdCardPage () <UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>
@property (nonatomic, strong) HPicture *pictureTool;
@property (nonatomic, strong) UIView *infoBgView;
@property (nonatomic, strong) NSMutableDictionary *saveDic;
@property (nonatomic, strong) UIView *header;
@property (nonatomic, assign) NSInteger selectCardValue;
@property (nonatomic, strong) UIImage *selectedImage;
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, copy) NSArray *dataArr;

@property (nonatomic, strong) UIButton *nextItemButton;
@property (nonatomic, strong) IconTitleView *typeInfomationView;
@property (nonatomic, strong) UIButton *photo;
@property (nonatomic, strong) IdCardAlert *cardAlert;

@property (nonatomic, strong) InfoAlert *alert;

@property (nonatomic, strong) NSMutableDictionary *cardDic;
@property (nonatomic, copy) NSArray *itemArr;
@property (nonatomic, assign) NSInteger countdown;
@property (nonatomic, assign) BOOL didIdCardImageUpload;
@property (nonatomic, strong) TimeView *timeView;


@end

@implementation IdCardPage

- (id)init{
    self = [super init];
    if (self) {
        self.naviBarHidden = YES;
    }
    return self;
}


- (void)loadData {
    NSDictionary *dic = @{
        p_product_id: self.productId,
    };
    kWeakself;
    [Http post:R_id_card params:dic success:^(Response *response) {
        if (response.success) {
            weakSelf.cardDic = response.dataDic[p_card_first];
            weakSelf.dataArr = response.dataDic[p_card_first][p_note];
            weakSelf.countdown = [response.dataDic[p_countdown] integerValue];
            [weakSelf loadUI];
        }
        
    } failure:^(NSError *error) {
        NSLog(@"======faild!");
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.step = 2;
    self.selectCardValue = -1;
    self.content.backgroundColor = BGColor;
    self.saveDic = [NSMutableDictionary dictionary];
}

- (void)loadView {
    [super loadView];
    [self loadData];
}

- (void)loadUI {
//    self.countdown = 10;
    if (self.countdown > 0) {
        [self.timeView start:self.countdown];
    }
    
    [self refershHeader];


    _infoBgView = [[UIView alloc] initWithFrame:CGRectMake(0, self.header.bottom, ScreenWidth, 130 + 160*WS)];
    _infoBgView.backgroundColor = UIColor.whiteColor;
    [self.content addSubview:_infoBgView];
    
    self.tableView.y = _infoBgView.bottom;
    
    [self.content addSubview:self.tableView];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 38)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.backgroundColor = rgba(236, 245, 255, 1);

    titleLabel.textColor = TextBlackColor;
    titleLabel.text = @"Upload your ID";

    titleLabel.font = FontBold(14);
    [_infoBgView addSubview:titleLabel];
    
    UILabel *typeDesclabel = [[UILabel alloc] initWithFrame:CGRectMake(LeftMargin, titleLabel.bottom, SafeWidth, 40)];
    typeDesclabel.text = @"Select ID Type";
    typeDesclabel.textColor = TextBlackColor;
    typeDesclabel.font = Font(12);
    [_infoBgView addSubview:typeDesclabel];
    
    _typeInfomationView = [[IconTitleView alloc] initWithFrame:CGRectMake(LeftMargin, typeDesclabel.y, SafeWidth, 40) title:@"Please Select" color:rgba(187, 187, 187, 1) font:12 icon:@"arrow_bot"];
    _typeInfomationView.type = HaoBtnType4;
    [_typeInfomationView addTarget:self action:@selector(selectAction) forControlEvents:UIControlEventTouchUpInside];
    [_infoBgView addSubview:_typeInfomationView];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(16, typeDesclabel.bottom, ScreenWidth - 32, 0.8)];
    line.backgroundColor = rgba(187, 187, 187, 1);
    [_infoBgView addSubview:line];
        
    _photo = [UIButton buttonWithType:UIButtonTypeCustom];
    _photo.frame = CGRectMake(58, line.bottom + 25, 260*WS, 161*WS);
    [_photo setImage:ImageWithName(@"take_photo") forState:UIControlStateNormal];
    [_photo setBackgroundImage:ImageWithName(@"picture_default") forState:UIControlStateNormal];
    [_photo addTarget:self action:@selector(photoAction) forControlEvents:UIControlEventTouchUpInside];
    [_infoBgView addSubview:_photo];
    
    _nextItemButton = [HView normalBtn:CGRectMake(34, self.view.h - SafeBottomHeight - 60, ScreenWidth - 68, 48) title:@"Next" font:24];
    [_nextItemButton showBottomShadow:COLORA(0, 0, 0, 0.2)];
    [_nextItemButton addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(nextAction)]];
    _nextItemButton.hidden = YES;
    [self.view addSubview:_nextItemButton];
    
    NSString *url = _cardDic[p_url];
    self.saveDic[p_url] = url;
    self.saveDic[p_value] = _cardDic[p_value];
    
    _selectCardValue = [_cardDic[p_id_type] integerValue];
    self.saveDic[p_id_type] = StrValue(_selectCardValue);
    if (url.length > 0) {
        [_photo sd_setBackgroundImageWithURL:[NSURL URLWithString:url] forState:UIControlStateNormal];
        _nextItemButton.hidden = NO;
    }
    _itemArr = _cardDic[p_list];
    for (int i = 0; i < _itemArr.count; i++) {
        NSDictionary *dic = _itemArr[i];
        NSString *code = dic[p_code];
        NSString *value = [dic[p_value] stringValue];
        self.saveDic[code] = notNull(value);
    }
    
    for (int i = 0; i < _dataArr.count; i++) {
        NSDictionary *dic = _dataArr[i];
        NSInteger type = [dic[p_card_type] integerValue];
        NSString *value = dic[p_card_title];
        if (_selectCardValue == type) {
            [_typeInfomationView setTitle:notNull(value) forState:UIControlStateNormal];
            [_typeInfomationView setTitleColor:TextBlackColor forState:UIControlStateNormal];
        }
    }
    self.tableView.h =  (_itemArr.count + 2)*50;
    self.content.contentSize = CGSizeMake(ScreenWidth, self.tableView.bottom + SafeBottomHeight + 70);
    [self.tableView reloadData];


    if (_itemArr.count > 0) {
        _didIdCardImageUpload = YES;
    }
    
    if (_selectCardValue <= 0) {
        [self selectAction];
    }
}


- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, _infoBgView.bottom + 20, ScreenWidth, 100) style:UITableViewStyleGrouped];
        _tableView.backgroundColor = BGColor;

        _tableView.separatorColor = UIColor.clearColor;
        _tableView.sectionHeaderHeight = 0;
        _tableView.sectionFooterHeight = 0;
        _tableView.scrollEnabled = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    return _tableView;
}


- (void)nextAction {
    if (_selectCardValue == -1 || !self.selectedImage) {
        [PPToast show:@"Please Select"];
    }else {
        [self saveData];
    }
}

- (void)refershHeader {
    [self.header removeAllViews];
    self.header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SafeWidth, NavBarHeight + 64)];
    [self.content addSubview:self.header];
    
    UIView *headerBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, NavBarHeight + 64)];
    headerBgView.backgroundColor = MainColor;
    [headerBgView showRadiusBottom:16];
    
    UIImageView *headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, NavBarHeight, ScreenWidth, 64)];
    headImageView.image = ImageWithName(@"header_step3");
    [headerBgView addSubview:headImageView];
    
    UIButton *backBtnItem = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtnItem.frame = CGRectMake(0, StatusBarHeight, 48, 44);
    [backBtnItem setImage:ImageWithName(@"page_back") forState:UIControlStateNormal];
    [backBtnItem addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [headerBgView addSubview:backBtnItem];
    
    UILabel *titleViewLabel = [[UILabel alloc] initWithFrame:CGRectMake(LeftMargin + 44, StatusBarHeight, SafeWidth - 44*2, 44)];
    titleViewLabel.text = @"Identification";
    titleViewLabel.textColor = UIColor.whiteColor;
    titleViewLabel.textAlignment = NSTextAlignmentCenter;
    [headerBgView addSubview:titleViewLabel];
    titleViewLabel.font = FontCustom(16);

    if (self.countdown == 0) {
        self.timeView.hidden = YES;
        self.header.h = NavBarHeight + 64;
    }else {
        [self.header addSubview:self.timeView];
        self.timeView.hidden = NO;
        self.header.h = NavBarHeight + 64 + 40;
    }
    [self.header addSubview:headerBgView];
    [self.tableView reloadData];
}

- (void)refreshUI {
    for (int i = 0; i < _itemArr.count; i++) {
        NSDictionary *dic = _itemArr[i];
        NSString *code = dic[p_code];
        NSString *value = [dic[p_value] stringValue];
        self.saveDic[code] = notNull(value);
    }
    self.tableView.h =  (_itemArr.count + 2)*50;
    self.content.contentSize = CGSizeMake(ScreenWidth, self.tableView.bottom + SafeBottomHeight + 70);
    [self.tableView reloadData];
    _nextItemButton.hidden = NO;
}

- (void)selectAction {
    if (_didIdCardImageUpload) {
        return;
    }
    _cardAlert = [[IdCardAlert alloc] initWithData:_dataArr selected:StrValue(_selectCardValue) title:@"Please select"];
    kWeakself;
    _cardAlert.selectBlock = ^(NSDictionary *dic) {
        [weakSelf selectType:dic];
    };
    [_cardAlert show];
}

- (void)selectType:(NSDictionary *)dic {
    [_typeInfomationView setTitle:notNull(dic[p_card_title]) forState:UIControlStateNormal];
    [_typeInfomationView setTitleColor:TextBlackColor forState:UIControlStateNormal];
    [_photo sd_setBackgroundImageWithURL:[NSURL URLWithString:dic[p_card_bg]] forState:UIControlStateNormal];
    _selectCardValue = [dic[p_card_type] integerValue];
    self.selectedImage = nil;
    self.itemArr = @[];
    [self.tableView reloadData];
}


- (TimeView*)timeView {
    if(!_timeView) {
        kWeakself;
        _timeView = [[TimeView alloc] initWithFrame:CGRectMake(0, NavBarHeight + 64 - 20, ScreenWidth, 60)];
        _timeView.finishBlock = ^{
            weakSelf.countdown = 0;
            [weakSelf refershHeader];
            weakSelf.infoBgView.y = weakSelf.header.bottom;
            weakSelf.tableView.y = weakSelf.infoBgView.bottom;
        };
        [_timeView showRadiusBottom:16];
        [_timeView addShadow];
    }
    return _timeView;
}


- (UIImage *)scaleBiteImage:(UIImage *)image toKBite:(NSInteger)kbiteSize {
    if (!image) {
        return image;
    }
    kbiteSize*=1024;
    CGFloat scale = 0.9f;
    CGFloat maxScaleValue = 0.1f;
    NSData *imageData = UIImageJPEGRepresentation(image, scale);
    while ([imageData length] > kbiteSize && scale > maxScaleValue) {
        scale -= 0.1;
        imageData = UIImageJPEGRepresentation(image, scale);
    }
    return [UIImage imageWithData:imageData];
}

- (void)uploadImage {
    kWeakself;
    NSDictionary *dic = @{@"light":@(_selectCardValue)};
    UIImage *image = [self scaleBiteImage:_selectedImage toKBite:404];
    
    [Http upload:R_ocr_upload params:dic thumbName:@"am" image:image success:^(Response *response) {
        if (response.success) {
            weakSelf.itemArr = response.dataDic[p_list];
            weakSelf.saveDic[p_value] = response.dataDic[p_relation_id];
            weakSelf.didIdCardImageUpload = YES;
            [weakSelf refreshUI];
            [weakSelf.photo setBackgroundImage:image forState:UIControlStateNormal];
            [weakSelf.photo setImage:nil forState:UIControlStateNormal];
        }else {
            [PPToast show:response.msg];
        }
    } failure:^(NSError *error) {
        
    }];
}

- (void)photoAction {
    if (_didIdCardImageUpload) {
        return;
    }
    if (_selectCardValue <= 0) {
        [self selectAction];
        return;
    }
    _pictureTool = [[HPicture alloc] init];
    [_pictureTool selectPicture:^(id object) {
        UIImage *image = (UIImage *)object;
        self.selectedImage = image;
        self.didIdCardImageUpload = NO;
        self.itemArr = @[];
        [self.tableView reloadData];
        [self uploadImage];
    }];
}


- (void)saveData {
    for (int i = 0; i < _itemArr.count; i++) {
        NSDictionary *dicInfomation = _itemArr[i];
        NSString *codestr = dicInfomation[p_code];
        NSString *titlestring = dicInfomation[p_title];
        NSString *catestring = dicInfomation[p_cate];
        NSInteger optionalstr = [dicInfomation[p_optional] integerValue];
        NSString *valuestring = self.saveDic[codestr];

        if (isBlankStr(valuestring) && optionalstr == 0) {
            if ([catestring isEqualToString:p_option]) {
                [PPToast show:StrFormat(@"Please select %@", titlestring)];
            }else {
                [PPToast show:StrFormat(@"Please enter %@", titlestring)];
            }
            return;
        }
    }
    
    self.saveDic[p_ocr_relation_id] = self.saveDic[p_value];
    self.saveDic[p_product_id] = notNull(self.productId);
    self.saveDic[p_point] = [self track];

    kWeakself;
    [Http post:R_save_id_card params:self.saveDic success:^(Response *response) {
        if (response.success) {
            [Route jumpWithProdutId:weakSelf.productId];
        }else {
            [PPToast show:response.msg];
        }
    } failure:^(NSError *error) {

    } showLoading:YES];
    [Track uploadDevice:^(BOOL value) {
    }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.view endEditing:YES];
    NSDictionary *cellDic = _itemArr[indexPath.row];
    NSString *code = cellDic[p_code];

    NSString *cate = cellDic[p_cate];
    if ([cate isEqualToString:@"txt"]) {
        return;
    }
    kWeakself;
    if ([cate isEqualToString:p_day]) {
        NSString *date = @"";
        NSString *selectDate = self.saveDic[code];
        if (selectDate.length > 0) {
            date = selectDate;
        }else {
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
            [dateFormatter setDateFormat: @"dd-MM-yyyy"];
            date = [dateFormatter stringFromDate:[NSDate date]];
        }
        DayAlert *alert = [[DayAlert alloc] initWithData:date title:cellDic[p_title]];
        alert.selectBlock = ^(NSString *str) {
            UITableViewCell *cellTmp = [tableView cellForRowAtIndexPath:indexPath];
            InfoCell *cell = (InfoCell *)cellTmp;
            weakSelf.saveDic[code] = str;
            cell.text.text = notNull(str);
        };
        [alert show];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _itemArr.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dic = _itemArr[indexPath.row];
    NSString *cate = dic[p_cate];
    if ([cate isEqualToString:p_day]) {
        static NSString *cellID = @"SelctCell";
        InfoCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (!cell) {
            cell = [[InfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        cell.saveDic = self.saveDic;
        [cell loadData:dic];
        return cell;
    }else if ([cate isEqualToString:p_txt]) {
        static NSString *cellID = @"InputCell";
        InputCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (!cell) {
            cell = [[InputCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        cell.saveDic = self.saveDic;
        [cell loadData:dic];
        return cell;
    }else {
        static NSString *cellID = @"GenderCell";
        GenderCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (!cell) {
            cell = [[GenderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        cell.saveDic = self.saveDic;
        [cell loadData:dic];
        return cell;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.1;
}

@end
