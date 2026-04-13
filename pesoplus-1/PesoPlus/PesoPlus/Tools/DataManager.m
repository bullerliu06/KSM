//
//  DataManager.m
// FIexiLend
//
//  Created by jacky on 2024/11/18.
//

#import "DataManager.h"
#import "PPPhoneInfo.h"
#import "LocationManager.h"
#import "CustomAlert.h"

@interface DataManager ()
@property (nonatomic, strong) LocationManager *location;
@property (nonatomic, strong) CustomAlert *alert;


@end

@implementation DataManager
SingletonM(DataManager)


- (void)trackScene:(NSDictionary *)dic {
    return;
    if (!User.isLogin) {
        [User login];
        return;
    }
    NSString *longitude = User.longitude;
    NSString *latitude = User.latitude;
    NSString *start = dic[@"startTime"];
    NSString *end = dic[@"endTime"];
    NSString *seceneType = dic[@"seceneType"];
    NSString *productId = dic[@"productId"];
    NSString *orderId = dic[@"orderId"];
    NSDictionary *info = @{p_start_time:notNull(start),
                           p_end_time:notNull(end),
                           p_orderNo:notNull(orderId),
                           p_sceneType:notNull(seceneType),
                           p_longitude:notNull(longitude),
                           p_latitude:notNull(latitude),
                           p_productId:notNull(productId),
                           p_device_no:[PPPhoneInfo idfv]};
    [Http post:R_buriePoint params:info success:^(Response *response) {
        if (response.success) {
        }
    } failure:^(NSError *error) {
    }];

}

- (void)getLocationAndUpload:(CallBackBool)success {
    _location = [[LocationManager alloc] init];
    kWeakself;
    _location.resultBlock = ^(BOOL value) {
        if (value) {
            [weakSelf uploadUserInfo:success];
        }else {
            [weakSelf showAlert];
        }
    };
    [_location requestLocation];
}

- (void)showAlert {
    UIView *alertView = [[UIView alloc] initWithFrame:CGRectMake(24, ScreenHeight/2 - 270/2, ScreenWidth - 48, 194)];
    alertView.backgroundColor = UIColor.whiteColor;
    [alertView showRadius:16];
    alertView.clipsToBounds = NO;

    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(alertView.w/2 - 45, -45, 90, 90)];
    image.image = ImageWithName(@"location_note");
    [alertView addSubview:image];
    
    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    closeBtn.frame = CGRectMake(alertView.w - 55, 0, 55, 55);
    [closeBtn setImage:ImageWithName(@"close_alert") forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(closeAction) forControlEvents:UIControlEventTouchUpInside];
    [alertView addSubview:closeBtn];
    
    NSString *sstr = StrFormat(@"%@, %@, %@", @"To be able to use our app", @", please turn on y", @"our device location services.");
    UILabel *desc = [[UILabel alloc] initWithFrame:CGRectMake(20, 55, alertView.w - 40, 56)];
    desc.text = sstr;
    desc.textColor = rgba(51, 51, 51, 1);
    desc.font = Font(16);
    desc.numberOfLines = 0;
    [alertView addSubview:desc];
    
    UIButton *cancelBtn = [HView normalBtn:CGRectMake(14, desc.bottom + 20, alertView.w - 28, 42) title:@"Agree" font:18];
    [cancelBtn addTarget:self action:@selector(jumpSetting) forControlEvents:UIControlEventTouchUpInside];
    [alertView addSubview:cancelBtn];

    _alert = [[CustomAlert alloc] initWithCustomView:alertView];
    [_alert show];
}

- (void)jumpSetting {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString] options:@{} completionHandler:^(BOOL success) {
    }];
    [_alert hide];
}

- (void)closeAction {
    [_alert hide];
}

- (void)uploadUserInfo:(CallBackBool)success {
    if (User.latitude.length == 0) {
        success(NO);
        return;
    }
    NSDictionary *dic = User.loctionDic;
    NSDictionary *info = @{p_admin_area:dic[@"province"],
                           p_country_code:dic[@"code"],
                           p_country_name:dic[@"country"],
                           p_feature_name:dic[@"street"],
                           p_longitude:dic[@"longitude"],
                           p_latitude:dic[@"latitude"],
                           p_locality:dic[@"locality"],
                           p_sub_admin_area:dic[@"subLocality"]};
    [Http post:R_uploadLocation params:info success:^(Response *response) {
        if (response.success) {
            success(YES);
        }else {
            success(NO);
        }
    } failure:^(NSError *error) {
    } showLoading:YES];
}

- (void)uploadDevice:(CallBackBool)success {
    
    NSDictionary *dic = @{
    @"battementMc": @{//（ 单位Byte字节）
        @"peronistaMc": [PPPhoneInfo getAvailableDiskSize], //可用存储大小
        @"realizationMc": [PPPhoneInfo getTotalDiskSize],  //总存储大小
        @"anxietyMc": [PPPhoneInfo getTotalMemorySize],  //总内存大小
        @"lueticMc": [PPPhoneInfo getAvailableMemorySize] //内存可用大小
    },
    @"battery_status": @{
        @"landfillMc": @([PPPhoneInfo batteryLevel]),  //剩余电量（百分比）
        @"battery_status": @([PPPhoneInfo getBatteryStatus] ? 1 : 0),  //Battery full
        @"gemologicalMc": @([PPPhoneInfo isCharging] ? 1 : 0)   //是否正在充电 0、1
    },
    @"hardware": @{
        @"crossarmMc": [PPPhoneInfo systemVersion], //系统版本
        @"beagleMc": @"iPhone", //设备名牌
        @"vanadiniteMc": [PPPhoneInfo deviceModelName],//设备型号
        @"ricerMc": @([PPPhoneInfo deviceHeight]),//分辨率高
        @"repugnantMc": @([PPPhoneInfo deviceWidth]),//分辨率宽
        @"inordinatelyMc": [PPPhoneInfo deviceSize],//物理尺寸
        @"societalMc": @([PPPhoneInfo getDeviceProTime]),//手机出厂时间戳
    },
    @"neuropathMc": @{},
    @"pneumatoceleMc": @{
        @"allowablyMc": @"0",//信号强度，传0即可
        @"curtilageMc": @([PPPhoneInfo isSimulator] ? 1 : 0),//是否为模拟器
        @"talmiMc": @([PPPhoneInfo isJailbroken] ? 1 : 0) //是否越狱
    },
    @"kibedMc": @{
        @"patoisMc": [PPPhoneInfo timeZone],//时区的 ID
        @"jujubeMc": @([PPPhoneInfo isUseProxy] ? 1 : 0),//是否使用代理 0、1
        @"hardcaseMc": @([PPPhoneInfo isUseVPN] ? 1 : 0),//是否使用vpn 0、1
        @"agadaMc": [PPPhoneInfo getSIMCardInfo],
        @"climeMc": [PPPhoneInfo idfv],//idfv
        @"millihenryMc": [PPPhoneInfo deviceLanuage],//语言
        @"brahmaMc": [PPPhoneInfo networkStatus],//网络类型 2G、3G、4G、5G、WIFI、OTHER、NONE
        @"barbicelMc": @1,//指示设备电话类型的常量1 手机;2 平板
        @"gramdanMc": [PPPhoneInfo ip],//外网ip
        @"noisefulMc": [PPPhoneInfo idfa]//idfa
    },
    @"committeemanMc": @{
        @"thermelMc": @[@{
                @"sandbaggerMc": [PPPhoneInfo getBSSID],//基本服务集标识符；设备的的虚拟mac
                @"chiffonierMc": [PPPhoneInfo getWifiName],//服务集标识符
                @"scarMc": [PPPhoneInfo getBSSID],//wifimac地址
                @"postliterateMc": [PPPhoneInfo getWifiName]//wifi 名称
        }]}
    };
    [Http post:R_uploadDevice params:dic success:^(Response *response) {
        
    } failure:^(NSError *error) {
    } showLoading:YES];
}

@end
