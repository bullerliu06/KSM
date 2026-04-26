//
//  XTNetworkApis.swift
//  XTApp
//
//  Created by Codex on 2026/4/26.
//

import AFNetworking
import Foundation
import YTKNetwork

private let xtGetMethod = YTKRequestMethod(rawValue: 0)!
private let xtPostMethod = YTKRequestMethod(rawValue: 1)!

private func xtString(_ value: Any?) -> String {
    guard let value, !(value is NSNull) else { return "" }
    if let string = value as? String {
        return string
    }
    return "\(value)"
}

private extension XTBaseApi {
    func xtAppendingHeaders(to path: String) -> String {
        urlAppendQueryParameter(toUrl: path)
    }
}

@objcMembers
@objc(XTAuthApi)
class XTAuthApi: XTBaseApi {
    private let productId: String

    @objc(initProductId:)
    init(productId: String) {
        self.productId = productId
        super.init()
    }

    override func requestUrl() -> String {
        xtAppendingHeaders(to: "sixca/auth")
    }

    override func requestMethod() -> YTKRequestMethod {
        xtPostMethod
    }

    override func requestArgument() -> Any? {
        ["lietsixusNc": xtString(productId)]
    }
}

@objcMembers
@objc(XTAuthErrApi)
class XTAuthErrApi: XTBaseApi {
    private let errorStr: String

    @objc(initWithErrorStr:)
    init(errorStr: String) {
        self.errorStr = errorStr
        super.init()
    }

    override func requestUrl() -> String {
        xtAppendingHeaders(to: "sixca/auth_err")
    }

    override func requestMethod() -> YTKRequestMethod {
        xtPostMethod
    }

    override func requestArgument() -> Any? {
        ["darysixmanNc": xtString(errorStr)]
    }
}

@objcMembers
@objc(XTCardApi)
class XTCardApi: XTBaseApi {
    private let productId: String

    @objc(initProductId:)
    init(productId: String) {
        self.productId = productId
        super.init()
    }

    override func requestUrl() -> String {
        xtAppendingHeaders(to: "sixca/card")
    }

    override func requestMethod() -> YTKRequestMethod {
        xtPostMethod
    }

    override func requestArgument() -> Any? {
        ["lietsixusNc": xtString(productId)]
    }
}

@objcMembers
@objc(XTCardNextApi)
class XTCardNextApi: XTBaseApi {
    private let dic: NSDictionary

    @objc(initWithDic:)
    init(dic: NSDictionary) {
        self.dic = dic
        super.init()
    }

    override func requestUrl() -> String {
        xtAppendingHeaders(to: "sixca/card_next")
    }

    override func requestMethod() -> YTKRequestMethod {
        xtPostMethod
    }

    override func requestArgument() -> Any? {
        dic
    }
}

@objcMembers
@objc(XTContactApi)
class XTContactApi: XTBaseApi {
    private let productId: String

    @objc(initProductId:)
    init(productId: String) {
        self.productId = productId
        super.init()
    }

    override func requestUrl() -> String {
        xtAppendingHeaders(to: "sixca/contact")
    }

    override func requestMethod() -> YTKRequestMethod {
        xtPostMethod
    }

    override func requestArgument() -> Any? {
        [
            "lietsixusNc": xtString(productId),
            "seissixacredNc": "blaalleynk"
        ]
    }
}

@objcMembers
@objc(XTContactNextApi)
class XTContactNextApi: XTBaseApi {
    private let dic: NSDictionary

    @objc(initWithDic:)
    init(dic: NSDictionary) {
        self.dic = dic
        super.init()
    }

    override func requestUrl() -> String {
        xtAppendingHeaders(to: "sixca/contact_next")
    }

    override func requestMethod() -> YTKRequestMethod {
        xtPostMethod
    }

    override func requestArgument() -> Any? {
        dic
    }
}

@objcMembers
@objc(XTDetectionApi)
class XTDetectionApi: XTBaseApi {
    private let productId: String
    private let livenessId: String

    @objc(initWithProductId:livenessId:)
    init(productId: String, livenessId: String) {
        self.productId = productId
        self.livenessId = livenessId
        super.init()
    }

    override func requestUrl() -> String {
        xtAppendingHeaders(to: "sixca/detection")
    }

    override func requestMethod() -> YTKRequestMethod {
        xtPostMethod
    }

    override func requestArgument() -> Any? {
        [
            "lietsixusNc": xtString(productId),
            "gyossixeNc": xtString(livenessId)
        ]
    }
}

@objcMembers
@objc(XTLicenseApi)
class XTLicenseApi: XTBaseApi {
    override func requestUrl() -> String {
        xtAppendingHeaders(to: "sixca/license")
    }

    override func requestMethod() -> YTKRequestMethod {
        xtPostMethod
    }

    override func requestArgument() -> Any? {
        [:]
    }
}

@objcMembers
@objc(XTLimitApi)
class XTLimitApi: XTBaseApi {
    private let productId: String

    @objc(initProductId:)
    init(productId: String) {
        self.productId = productId
        super.init()
    }

    override func requestUrl() -> String {
        xtAppendingHeaders(to: "sixca/limit")
    }

    override func requestMethod() -> YTKRequestMethod {
        xtPostMethod
    }

    override func requestArgument() -> Any? {
        ["lietsixusNc": xtString(productId)]
    }
}

@objcMembers
@objc(XTPersonApi)
class XTPersonApi: XTBaseApi {
    private let productId: String

    @objc(initProductId:)
    init(productId: String) {
        self.productId = productId
        super.init()
    }

    override func requestUrl() -> String {
        xtAppendingHeaders(to: "sixca/person")
    }

    override func requestMethod() -> YTKRequestMethod {
        xtPostMethod
    }

    override func requestArgument() -> Any? {
        [
            "lietsixusNc": xtString(productId),
            "bunasixbleNc": "stauistill"
        ]
    }
}

@objcMembers
@objc(XTPersonNextApi)
class XTPersonNextApi: XTBaseApi {
    private let dic: NSDictionary

    @objc(initWithDic:)
    init(dic: NSDictionary) {
        self.dic = dic
        super.init()
    }

    override func requestUrl() -> String {
        xtAppendingHeaders(to: "sixca/person_next")
    }

    override func requestMethod() -> YTKRequestMethod {
        xtPostMethod
    }

    override func requestArgument() -> Any? {
        dic
    }
}

@objcMembers
@objc(XTPhotoApi)
class XTPhotoApi: XTBaseApi {
    private let productId: String

    @objc(initProductId:)
    init(productId: String) {
        self.productId = productId
        super.init()
    }

    override func requestUrl() -> String {
        xtAppendingHeaders(to: "sixca/photo")
    }

    override func requestMethod() -> YTKRequestMethod {
        xtPostMethod
    }

    override func requestArgument() -> Any? {
        ["lietsixusNc": xtString(productId)]
    }
}

@objcMembers
@objc(XTPhotoNextApi)
class XTPhotoNextApi: XTBaseApi {
    private let dic: NSDictionary

    @objc(initWithDic:)
    init(dic: NSDictionary) {
        self.dic = dic
        super.init()
    }

    override func requestUrl() -> String {
        xtAppendingHeaders(to: "sixca/photo_next")
    }

    override func requestMethod() -> YTKRequestMethod {
        xtPostMethod
    }

    override func requestArgument() -> Any? {
        dic
    }
}

@objcMembers
@objc(XTSaveAuthApi)
class XTSaveAuthApi: XTBaseApi {
    private let dic: NSDictionary

    @objc(initWithDic:)
    init(dic: NSDictionary) {
        self.dic = dic
        super.init()
    }

    override func requestUrl() -> String {
        xtAppendingHeaders(to: "sixca/saveauth")
    }

    override func requestMethod() -> YTKRequestMethod {
        xtPostMethod
    }

    override func requestArgument() -> Any? {
        dic
    }
}

@objcMembers
@objc(XTUpApi)
class XTUpApi: XTBaseApi {
    private let path: String
    private let typeId: String

    @objc(initPath:typeId:)
    init(path: String, typeId: String) {
        self.path = path
        self.typeId = typeId
        super.init()
    }

    override func requestUrl() -> String {
        xtAppendingHeaders(to: "sixca/ocr")
    }

    override var constructingBodyBlock: AFConstructingBlock? {
        get {
            { [path] formData in
                let fileName = (path as NSString).lastPathComponent
                let url = URL(fileURLWithPath: path)
                try? formData.appendPart(withFileURL: url, name: "am", fileName: fileName, mimeType: "image/jpeg")
            }
        }
        set {
            super.constructingBodyBlock = newValue
        }
    }

    override func requestMethod() -> YTKRequestMethod {
        xtPostMethod
    }

    override func requestArgument() -> Any? {
        ["light": xtString(typeId)]
    }
}

@objcMembers
@objc(XTDeviceApi)
class XTDeviceApi: XTBaseApi {
    override func requestUrl() -> String {
        xtAppendingHeaders(to: "sixcr/device")
    }

    override func requestMethod() -> YTKRequestMethod {
        xtPostMethod
    }

    override func requestArgument() -> Any? {
        XTDevice.xt_share().xt_deviceInfoDic()
    }
}

@objcMembers
@objc(XTLocationApi)
class XTLocationApi: XTBaseApi {
    private let dic: NSDictionary

    @objc(initDic:)
    init(dic: NSDictionary) {
        self.dic = dic
        super.init()
    }

    override func requestUrl() -> String {
        xtAppendingHeaders(to: "sixcr/location")
    }

    override func requestMethod() -> YTKRequestMethod {
        xtPostMethod
    }

    override func requestArgument() -> Any? {
        dic
    }
}

@objcMembers
@objc(XTMarketApi)
class XTMarketApi: XTBaseApi {
    private let xt_idfa: String

    @objc(initIdfa:)
    init(idfa: String) {
        self.xt_idfa = idfa
        super.init()
    }

    override func requestUrl() -> String {
        xtAppendingHeaders(to: "sixcr/market")
    }

    override func requestMethod() -> YTKRequestMethod {
        xtPostMethod
    }

    override func requestArgument() -> Any? {
        [
            "manisixcideNc": xtString(XTDevice.xt_share().xt_idfv),
            "patusixrageNc": xtString(xt_idfa),
            "asdfasasdgwg": "fewfdf",
            "ATETH": "123123555"
        ]
    }
}

@objcMembers
@objc(XTUpAdidApi)
class XTUpAdidApi: XTBaseApi {
    private let xt_adid: String

    @objc(initAdId:)
    init(adid: String) {
        self.xt_adid = adid
        super.init()
    }

    override func requestUrl() -> String {
        xtAppendingHeaders(to: "sixcr/aio")
    }

    override func requestMethod() -> YTKRequestMethod {
        xtPostMethod
    }

    override func requestArgument() -> Any? {
        [
            "exepsixtionalNc": xtString(XTDevice.xt_share().xt_idfv),
            "fkgjsixgkxdkcnNc": xtString(xt_adid)
        ]
    }
}

@objcMembers
@objc(XTApplyApi)
class XTApplyApi: XTBaseApi {
    private let productId: String

    @objc(initProductId:)
    init(productId: String) {
        self.productId = productId
        super.init()
    }

    override func requestUrl() -> String {
        xtAppendingHeaders(to: "sixnv2/gce/apply")
    }

    override func requestMethod() -> YTKRequestMethod {
        xtPostMethod
    }

    override func requestArgument() -> Any? {
        [
            "lietsixusNc": xtString(productId),
            "fuhasixmNc": "cakestand"
        ]
    }
}

@objcMembers
@objc(XTDetailApi)
class XTDetailApi: XTBaseApi {
    private let productId: String

    @objc(initProductId:)
    init(productId: String) {
        self.productId = productId
        super.init()
    }

    override func requestUrl() -> String {
        xtAppendingHeaders(to: "sixnv2/gce/detail")
    }

    override func requestMethod() -> YTKRequestMethod {
        xtPostMethod
    }

    override func requestArgument() -> Any? {
        ["lietsixusNc": xtString(productId)]
    }
}

@objcMembers
@objc(XTFirstApi)
class XTFirstApi: XTBaseApi {
    override func requestUrl() -> String {
        xtAppendingHeaders(to: "sixch/index")
    }

    override func requestMethod() -> YTKRequestMethod {
        xtGetMethod
    }
}

@objcMembers
@objc(XTPopUpApi)
class XTPopUpApi: XTBaseApi {
    override func requestUrl() -> String {
        xtAppendingHeaders(to: "sixch/pop-up")
    }

    override func requestMethod() -> YTKRequestMethod {
        xtGetMethod
    }
}

@objcMembers
@objc(XTPushApi)
class XTPushApi: XTBaseApi {
    private let orderId: String

    @objc(initOrderId:)
    init(orderId: String) {
        self.orderId = orderId
        super.init()
    }

    override func requestUrl() -> String {
        xtAppendingHeaders(to: "sixnv2/gce/push")
    }

    override func requestMethod() -> YTKRequestMethod {
        xtPostMethod
    }

    override func requestArgument() -> Any? {
        [
            "spsmsixogenicNc": xtString(orderId),
            "ditosixmeNc": "houijhyus"
        ]
    }
}

@objcMembers
@objc(XTLoginApi)
class XTLoginApi: XTBaseApi {
    private let dic: NSDictionary

    @objc(initDic:)
    init(dic: NSDictionary) {
        self.dic = dic
        super.init()
    }

    override func requestUrl() -> String {
        xtAppendingHeaders(to: "sixcp/login")
    }

    override func requestMethod() -> YTKRequestMethod {
        xtPostMethod
    }

    override func requestArgument() -> Any? {
        dic
    }
}

@objcMembers
@objc(XTPhoneCodeApi)
class XTPhoneCodeApi: XTBaseApi {
    private let phone: String

    @objc(initPhone:)
    init(phone: String) {
        self.phone = phone
        super.init()
    }

    override func requestUrl() -> String {
        xtAppendingHeaders(to: "sixcp/get_code")
    }

    override func requestMethod() -> YTKRequestMethod {
        xtPostMethod
    }

    override func requestArgument() -> Any? {
        [
            "chresixographyNc": xtString(phone),
            "betysixNc": "juyttrr"
        ]
    }
}

@objcMembers
@objc(XTDelAccountApi)
class XTDelAccountApi: XTBaseApi {
    override func requestUrl() -> String {
        xtAppendingHeaders(to: "ph/user/del-account")
    }

    override func requestMethod() -> YTKRequestMethod {
        xtPostMethod
    }
}

@objcMembers
@objc(XTHomeApi)
class XTHomeApi: XTBaseApi {
    override func requestUrl() -> String {
        xtAppendingHeaders(to: "sixch/home")
    }

    override func requestMethod() -> YTKRequestMethod {
        xtGetMethod
    }
}

@objcMembers
@objc(XTLogoutApi)
class XTLogoutApi: XTBaseApi {
    override func requestUrl() -> String {
        xtAppendingHeaders(to: "sixcp/logout")
    }

    override func requestMethod() -> YTKRequestMethod {
        xtGetMethod
    }
}

@objcMembers
@objc(XTOrderListApi)
class XTOrderListApi: XTBaseApi {
    dynamic var xt_order_type: String?
    dynamic var xt_page_num = 1
    private(set) dynamic var xt_page_size = 20

    override func requestUrl() -> String {
        xtAppendingHeaders(to: "ph/loan/order-list")
    }

    override func requestMethod() -> YTKRequestMethod {
        xtPostMethod
    }

    override func requestArgument() -> Any? {
        [
            "hafbsixackNc": xtString(xt_order_type),
            "leitsiximismNc": "\(xt_page_num)",
            "catosixnizationNc": "\(xt_page_size)"
        ]
    }
}
