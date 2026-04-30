//
//  XTSessionApis.swift
//  XTApp
//
//  Created by Codex on 2026/4/30.
//

import Foundation

@objcMembers
@objc(XTLoginApi)
class XTLoginApi: XTDictionaryPostApi {
    @objc(initDic:)
    init(dic: NSDictionary) {
        super.init(payload: dic)
    }

    override func requestUrl() -> String {
        xtAppendingHeaders(to: "sixcp/login")
    }
}

@objcMembers
@objc(XTPhoneCodeApi)
class XTPhoneCodeApi: XTPostApi {
    private let phone: String

    @objc(initPhone:)
    init(phone: String) {
        self.phone = phone
        super.init()
    }

    override func requestUrl() -> String {
        xtAppendingHeaders(to: "sixcp/get_code")
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
class XTDelAccountApi: XTPostApi {
    override func requestUrl() -> String {
        xtAppendingHeaders(to: "ph/user/del-account")
    }
}

@objcMembers
@objc(XTLogoutApi)
class XTLogoutApi: XTGetApi {
    override func requestUrl() -> String {
        xtAppendingHeaders(to: "sixcp/logout")
    }
}