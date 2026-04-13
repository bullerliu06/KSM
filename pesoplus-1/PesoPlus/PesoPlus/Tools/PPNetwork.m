//
//  PPNetwork.m
// FIexiLend
//
//  Created by jacky on 2024/11/1.
//

#import "PPNetwork.h"
#import <AFNetworking/AFNetworking.h>
#import "PPPhoneInfo.h"

@interface PPNetwork()

@property (nonatomic, strong) AFHTTPSessionManager *manager;

@end

@implementation PPNetwork

SingletonM(PPNetwork)

- (id)init{
    self = [super init];
    if (self) {
        _manager = [[AFHTTPSessionManager alloc] initWithBaseURL:nil sessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        _manager.requestSerializer = [AFJSONRequestSerializer serializer];
        _manager.requestSerializer.timeoutInterval = 60;
        _manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/json", @"text/javascript", @"text/html", nil];
        [_manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [_manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        _manager.securityPolicy = [AFSecurityPolicy defaultPolicy];
        [self refreshHeader];
        self.baseUrl = @"https://api-23i.ph.dev.ksmdev.top/api/";

        self.h5Url = @"https://api-23i.ph.dev.ksmdev.top";
    }
    return self;
}

- (void)refreshHeader {
    if (User.isLogin) {
        self.headerString = StrFormat(@"rssonicationCiopjko=%@&rswastepaperCiopjko=%@&rskulanCiopjko=%@&rssynoptistCiopjko=%@&rsdysteleologistCiopjko=%@&rsuncreolizedCiopjko=%@&rspaulinizeCiopjko=%@&rseliminateCiopjko=%@&rsgeneratrixCiopjko=%@", User.userName, User.sessionid, @"iOS", [PPPhoneInfo version], [PPPhoneInfo deviceModelName], [PPPhoneInfo idfv], [PPPhoneInfo systemVersion], @"ph", [PPPhoneInfo bundleId]);
    }else {
        self.headerString = StrFormat(@"rskulanCiopjko=%@&rssynoptistCiopjko=%@&rsdysteleologistCiopjko=%@&rsuncreolizedCiopjko=%@&rspaulinizeCiopjko=%@&rseliminateCiopjko=%@&rsgeneratrixCiopjko=%@", @"iOS", [PPPhoneInfo version], [PPPhoneInfo deviceModelName], [PPPhoneInfo idfv], [PPPhoneInfo systemVersion], @"ph", [PPPhoneInfo bundleId]);
    }
}

- (void)get:(NSString *)path params:(NSDictionary *)params success:(SuccessBlock)success failure:(FailureBlock)failure {
    [self get:path params:params success:success failure:failure showLoading:NO];
}

- (void)get:(NSString *)path params:(NSDictionary *)params success:(SuccessBlock)success failure:(FailureBlock)failure showLoading:(BOOL)loading {
    if (loading) {
        [PPLoading showLoading];
    }
    __block BOOL load = loading;
    __block NSString *pathStr = path;
    NSString *urlString = [self.baseUrl stringByAppendingPathComponent:path];
    urlString = StrFormat(@"%@?%@", urlString, notNull(self.headerString));
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];

    [_manager GET:urlString parameters:params headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (load) {
            [PPLoading hideLoading];
        }
        NSDictionary *resDic = (NSDictionary *)responseObject;
        Response *response = [[Response alloc] initResult:resDic path:pathStr];
        if ([self requestResult:response]) {
            return;
        }
        success(response);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (load) {
            [PPLoading hideLoading];
        }
        failure(error);
    }];
}

- (void)post:(NSString *)path params:(NSDictionary *)params success:(SuccessBlock)success failure:(FailureBlock)failure {
    [self post:path params:params success:success failure:failure showLoading:NO];
}

- (void)post:(NSString *)path params:(NSDictionary *)params success:(SuccessBlock)success failure:(FailureBlock)failure showLoading:(BOOL)loading {
    if (loading) {
        [PPLoading showLoading];
    }
    __block BOOL load = loading;
    __block NSString *pathStr = path;
    NSString *urlString = [self.baseUrl stringByAppendingPathComponent:path];
    urlString = StrFormat(@"%@?%@", urlString, notNull(self.headerString));
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    [_manager POST:urlString parameters:params headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (load) {
            [PPLoading hideLoading];
        }
        NSDictionary *resDic = (NSDictionary *)responseObject;
        Response *response = [[Response alloc] initResult:resDic path:pathStr];
        if ([self requestResult:response]) {
            return;
        }
        success(response);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (load) {
            [PPLoading hideLoading];
        }
        failure(error);
        NSLog(@"faild==%@", error);
    }];
}

- (BOOL)requestResult:(Response *)response {
    if (response.success) {
        if ([@[R_login_sms] containsObject:response.path]) {
            [self loginResult:response];
        }
        return NO;
    }
    if ([response.code isEqualToString:@"-2"]) {//token失效
        [PPToast show:@"please login" time:3];
        [User login];
        return YES;
    }else if (!response.success) {
        [PPToast show:response.msg time:1.5];
        return NO;
    }
    return NO;
}

- (void)loginResult:(Response *)response {
    NSDictionary *item = response.dataDic[p_item];

    User.isLogin = YES;
    User.userName = item[p_username];
    User.sessionid = item[p_sessionid];
    User.token = item[p_token];
    User.appstore = [item[p_appstore] boolValue];
    
    [PPCache setStr:User.userName forKey:@"UserAcc"];
    [PPCache setStr:User.sessionid forKey:@"UserSid"];
    [PPCache setStr:User.token forKey:@"Token"];
    [PPCache setStr:User.appstore ? @"1" : @"0" forKey:@"InStoreAcc"];
    [self refreshHeader];
}

- (void)upload:(NSString *)path params:(NSDictionary *)params thumbName:(NSString *)thumbName image:(UIImage *)image success:(SuccessBlock)success failure:(FailureBlock)failure {
    [PPLoading showLoading];;
    NSData *data = UIImageJPEGRepresentation(image, 0.5);
    __block NSString *pathStr = path;
    NSString *urlString = [self.baseUrl stringByAppendingPathComponent:path];
    urlString = StrFormat(@"%@?%@", urlString, notNull(self.headerString));
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    [_manager POST:urlString parameters:params headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyyMMddHHmmss";
        NSString *str = [formatter stringFromDate:[NSDate date]];
        NSString *fileName = [[NSString alloc] init];
        if (UIImagePNGRepresentation(image) != nil) {
            fileName = StrFormat(@"%@%@.png", thumbName,str);
        }else{
            fileName = StrFormat(@"%@%@.jpg", thumbName,str);
        }
        [formData appendPartWithFileData:data name:StrFormat(@"%@", thumbName) fileName:fileName mimeType:@"image/png"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [PPLoading hideLoading];
        NSDictionary *resDic = (NSDictionary *)responseObject;
        Response *model = [[Response alloc] initResult:resDic path:pathStr];
        if (!model.success) {
            [PPToast show:model.msg];
        }
        success(model);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [PPLoading hideLoading];
        failure(error);
    }];
}

- (void)refreshNetwork {
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status){
        [[NSNotificationCenter defaultCenter] postNotificationName:@"NetworkTypeChanged" object:self];
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                self.networkStatus = PPNetworkNone;
                break;
            case AFNetworkReachabilityStatusNotReachable:
                self.networkStatus = PPNetworkUnknown;
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                self.networkStatus = PPNetworkWAN;
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                self.networkStatus = PPNetworkWiFi;
                break;
            default:
                break;
        }
    }];
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}

- (void)cleanHttpHeaders {
    [User clearUserInfo];
    [PPCache setStr:@"" forKey:@"UserAcc"];
    [PPCache setStr:@"" forKey:@"UserSid"];
    [PPCache setStr:@"" forKey:@"Token"];
    [PPCache setStr:@"" forKey:@"InStoreAcc"];
}

@end


@implementation Response

- (id)initResult:(NSDictionary *)dic path:(NSString *)path {
    self = [super init];
    if (self) {
        self.code = [dic[p_code] stringValue];
        self.msg = dic[p_message];
        self.path = path;
        self.success = [@[@"00", @"0"] containsObject:self.code];
        if (!dic[p_data]) {
            return self;
        }
        if ([dic[p_data] isKindOfClass:[NSDictionary class]]) {
            self.dataDic = dic[p_data];
        }
    }
    return self;
}

@end

