//
//  XTApiShared.swift
//  XTApp
//
//  Created by Codex on 2026/4/30.
//

import Foundation
import YTKNetwork

let xtGetMethod = YTKRequestMethod(rawValue: 0)!
let xtPostMethod = YTKRequestMethod(rawValue: 1)!

func xtString(_ value: Any?) -> String {
    guard let value, !(value is NSNull) else { return "" }
    if let string = value as? String {
        return string
    }
    return "\(value)"
}

extension XTBaseApi {
    func xtAppendingHeaders(to path: String) -> String {
        urlAppendQueryParameter(toUrl: path)
    }
}

class XTPostApi: XTBaseApi {
    override func requestMethod() -> YTKRequestMethod {
        xtPostMethod
    }
}

class XTGetApi: XTBaseApi {
    override func requestMethod() -> YTKRequestMethod {
        xtGetMethod
    }
}

class XTDictionaryPostApi: XTPostApi {
    let dic: NSDictionary

    init(payload: NSDictionary) {
        self.dic = payload
        super.init()
    }

    override func requestArgument() -> Any? {
        dic
    }
}

class XTProductIdPostApi: XTPostApi {
    let productId: String

    init(storedProductId: String) {
        self.productId = storedProductId
        super.init()
    }

    func productArgument(extra: [String: Any] = [:]) -> [String: Any] {
        var arguments: [String: Any] = ["lietsixusNc": xtString(productId)]
        extra.forEach { arguments[$0.key] = $0.value }
        return arguments
    }
}