//
//  XTAuthenticationApis.swift
//  XTApp
//
//  Created by Codex on 2026/4/30.
//

import AFNetworking
import Foundation

@objcMembers
@objc(XTAuthApi)
class XTAuthApi: XTProductIdPostApi {
    @objc(initProductId:)
    init(productId: String) {
        super.init(storedProductId: productId)
    }

    override func requestUrl() -> String {
        xtAppendingHeaders(to: "sixca/auth")
    }

    override func requestArgument() -> Any? {
        productArgument()
    }
}

@objcMembers
@objc(XTAuthErrApi)
class XTAuthErrApi: XTPostApi {
    private let errorStr: String

    @objc(initWithErrorStr:)
    init(errorStr: String) {
        self.errorStr = errorStr
        super.init()
    }

    override func requestUrl() -> String {
        xtAppendingHeaders(to: "sixca/auth_err")
    }

    override func requestArgument() -> Any? {
        ["darysixmanNc": xtString(errorStr)]
    }
}

@objcMembers
@objc(XTCardApi)
class XTCardApi: XTProductIdPostApi {
    @objc(initProductId:)
    init(productId: String) {
        super.init(storedProductId: productId)
    }

    override func requestUrl() -> String {
        xtAppendingHeaders(to: "sixca/card")
    }

    override func requestArgument() -> Any? {
        productArgument()
    }
}

@objcMembers
@objc(XTCardNextApi)
class XTCardNextApi: XTDictionaryPostApi {
    @objc(initWithDic:)
    init(dic: NSDictionary) {
        super.init(payload: dic)
    }

    override func requestUrl() -> String {
        xtAppendingHeaders(to: "sixca/card_next")
    }
}

@objcMembers
@objc(XTContactApi)
class XTContactApi: XTProductIdPostApi {
    @objc(initProductId:)
    init(productId: String) {
        super.init(storedProductId: productId)
    }

    override func requestUrl() -> String {
        xtAppendingHeaders(to: "sixca/contact")
    }

    override func requestArgument() -> Any? {
        productArgument(extra: ["seissixacredNc": "blaalleynk"])
    }
}

@objcMembers
@objc(XTContactNextApi)
class XTContactNextApi: XTDictionaryPostApi {
    @objc(initWithDic:)
    init(dic: NSDictionary) {
        super.init(payload: dic)
    }

    override func requestUrl() -> String {
        xtAppendingHeaders(to: "sixca/contact_next")
    }
}

@objcMembers
@objc(XTDetectionApi)
class XTDetectionApi: XTProductIdPostApi {
    private let livenessId: String

    @objc(initWithProductId:livenessId:)
    init(productId: String, livenessId: String) {
        self.livenessId = livenessId
        super.init(storedProductId: productId)
    }

    override func requestUrl() -> String {
        xtAppendingHeaders(to: "sixca/detection")
    }

    override func requestArgument() -> Any? {
        productArgument(extra: ["gyossixeNc": xtString(livenessId)])
    }
}

@objcMembers
@objc(XTLicenseApi)
class XTLicenseApi: XTPostApi {
    override func requestUrl() -> String {
        xtAppendingHeaders(to: "sixca/license")
    }

    override func requestArgument() -> Any? {
        [:]
    }
}

@objcMembers
@objc(XTLimitApi)
class XTLimitApi: XTProductIdPostApi {
    @objc(initProductId:)
    init(productId: String) {
        super.init(storedProductId: productId)
    }

    override func requestUrl() -> String {
        xtAppendingHeaders(to: "sixca/limit")
    }

    override func requestArgument() -> Any? {
        productArgument()
    }
}

@objcMembers
@objc(XTPersonApi)
class XTPersonApi: XTProductIdPostApi {
    @objc(initProductId:)
    init(productId: String) {
        super.init(storedProductId: productId)
    }

    override func requestUrl() -> String {
        xtAppendingHeaders(to: "sixca/person")
    }

    override func requestArgument() -> Any? {
        productArgument(extra: ["bunasixbleNc": "stauistill"])
    }
}

@objcMembers
@objc(XTPersonNextApi)
class XTPersonNextApi: XTDictionaryPostApi {
    @objc(initWithDic:)
    init(dic: NSDictionary) {
        super.init(payload: dic)
    }

    override func requestUrl() -> String {
        xtAppendingHeaders(to: "sixca/person_next")
    }
}

@objcMembers
@objc(XTPhotoApi)
class XTPhotoApi: XTProductIdPostApi {
    @objc(initProductId:)
    init(productId: String) {
        super.init(storedProductId: productId)
    }

    override func requestUrl() -> String {
        xtAppendingHeaders(to: "sixca/photo")
    }

    override func requestArgument() -> Any? {
        productArgument()
    }
}

@objcMembers
@objc(XTPhotoNextApi)
class XTPhotoNextApi: XTDictionaryPostApi {
    @objc(initWithDic:)
    init(dic: NSDictionary) {
        super.init(payload: dic)
    }

    override func requestUrl() -> String {
        xtAppendingHeaders(to: "sixca/photo_next")
    }
}

@objcMembers
@objc(XTSaveAuthApi)
class XTSaveAuthApi: XTDictionaryPostApi {
    @objc(initWithDic:)
    init(dic: NSDictionary) {
        super.init(payload: dic)
    }

    override func requestUrl() -> String {
        xtAppendingHeaders(to: "sixca/saveauth")
    }
}

@objcMembers
@objc(XTUpApi)
class XTUpApi: XTPostApi {
    private let path: String
    private let typeId: String

    @objc(initPath:typeId:)
    init(path: String, typeId: String) {
        self.path = path
        self.typeId = typeId
        super.init()
        constructingBodyBlock = { [path] formData in
            let fileName = (path as NSString).lastPathComponent
            let url = URL(fileURLWithPath: path)
            try? formData.appendPart(withFileURL: url, name: "am", fileName: fileName, mimeType: "image/jpeg")
        }
    }

    override func requestUrl() -> String {
        xtAppendingHeaders(to: "sixca/ocr")
    }

    override func requestArgument() -> Any? {
        ["light": xtString(typeId)]
    }
}