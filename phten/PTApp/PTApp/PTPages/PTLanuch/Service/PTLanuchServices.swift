//
//  PTLanuchServices.swift
//  PTApp
//

import Foundation
import YTKNetwork

class PTDictionaryRequest: PTBaseRequest {
    private let data: NSDictionary
    private let path: String
    private let method: YTKRequestMethod

    @objc(initWithData:path:)
    init(data: NSDictionary, path: String) {
        self.data = data
        self.path = path
        self.method = .POST
        super.init()
    }

    init(data: NSDictionary = [:], path: String, method: YTKRequestMethod = .POST, showLoading: Bool = false) {
        self.data = data
        self.path = path
        self.method = method
        super.init()
        isShowLoading = showLoading
    }

    override func requestUrl() -> String {
        path
    }

    override func requestTimeoutInterval() -> TimeInterval {
        30
    }

    override func requestMethod() -> YTKRequestMethod {
        method
    }

    override func requestArgument() -> Any {
        data
    }
}

@objc(PTLanuchService)
class PTLanuchService: PTDictionaryRequest {
    @objc(initWithData:)
    init(data: NSDictionary) {
        super.init(data: data, path: "tencr/market")
    }
}

@objc(PTDeviceService)
class PTDeviceService: PTDictionaryRequest {
    @objc(initWithData:)
    init(data: NSDictionary) {
        super.init(data: data, path: "tencr/device")
    }
}

@objc(PTLocationService)
class PTLocationService: PTDictionaryRequest {
    @objc(initWithData:)
    init(data: NSDictionary) {
        super.init(data: data, path: "tencr/location")
    }
}

@objc(PTUploadAdidService)
class PTUploadAdidService: PTDictionaryRequest {
    @objc(initWithData:)
    init(data: NSDictionary) {
        super.init(data: data, path: "tencr/aio")
    }
}
