//
//  PPPhoneInfo.h
// FIexiLend
//
//  Created by jacky on 2024/11/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PPPhoneInfo : NSObject
+ (NSString *)version;
+ (NSString *)deviceName;
+ (NSString *)buildVersion;
+ (NSString *)systemVersion;
+ (NSString *)idfa;
+ (NSString *)idfv;
+ (NSString *)packageName;
+ (NSString *)bundleId;
+ (NSString *)ip;
+ (NSInteger)batteryLevel;
+ (BOOL)isCharging;
+ (UIDeviceBatteryState)batteryState;
+ (BOOL)getBatteryStatus;
+ (NSString *)getTotalMemorySize;
+ (NSString *)getAvailableMemorySize;
+ (NSString *)getTotalDiskSize;
+ (NSString *)getAvailableDiskSize;
+ (NSString *)deviceType;
+ (NSString *)deviceSize;
+ (CGFloat)deviceWidth;
+ (CGFloat)deviceHeight;
+ (NSString *)networkStatus;
+ (NSString *)getSIMCardInfo;
+ (NSString *)deviceModelName;
+ (BOOL)isJailbroken;
+ (BOOL)isSimulator;
+ (NSTimeInterval)getDeviceProTime;
+ (NSString *)timeZone;
+ (BOOL)isUseProxy;
+ (BOOL)isUseVPN;
+ (NSString *)deviceLanuage;
+ (NSString *)getBSSID;
+ (NSString *)getWifiName;
///生成一串随机数
+ (NSString *)createRandomUUIDWithLenght:(NSInteger)lenght;
///首次安装时间
+ (NSString*)firstInstallation;
///获取实时IDFV
+(NSString*)newIDFV;
/// 获取URL后面参数
+(NSDictionary*)getParameFromURL:(NSURL *)url;
@end

NS_ASSUME_NONNULL_END
