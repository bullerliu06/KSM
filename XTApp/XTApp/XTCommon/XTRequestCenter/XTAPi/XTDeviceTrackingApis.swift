//
//  XTDeviceTrackingApis.swift
//  XTApp
//
//  Created by Codex on 2026/4/30.
//

import Foundation

@objcMembers
@objc(XTDeviceApi)
class XTDeviceApi: XTPostApi {
    override func requestUrl() -> String {
        xtAppendingHeaders(to: "sixcr/device")
    }

    override func requestArgument() -> Any? {
        XTDevice.xt_share().xt_deviceInfoDic()
    }
}

@objcMembers
@objc(XTLocationApi)
class XTLocationApi: XTDictionaryPostApi {
    @objc(initDic:)
    init(dic: NSDictionary) {
        super.init(payload: dic)
    }

    override func requestUrl() -> String {
        xtAppendingHeaders(to: "sixcr/location")
    }
}

@objcMembers
@objc(XTMarketApi)
class XTMarketApi: XTPostApi {
    private let xt_idfa: String

    @objc(initIdfa:)
    init(idfa: String) {
        self.xt_idfa = idfa
        super.init()
    }

    override func requestUrl() -> String {
        xtAppendingHeaders(to: "sixcr/market")
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
class XTUpAdidApi: XTPostApi {
    private let xt_adid: String

    @objc(initAdId:)
    init(adid: String) {
        self.xt_adid = adid
        super.init()
    }

    override func requestUrl() -> String {
        xtAppendingHeaders(to: "sixcr/aio")
    }

    override func requestArgument() -> Any? {
        [
            "exepsixtionalNc": xtString(XTDevice.xt_share().xt_idfv),
            "fkgjsixgkxdkcnNc": xtString(xt_adid)
        ]
    }
}