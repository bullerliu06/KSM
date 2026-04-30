//
//  XTLoanApis.swift
//  XTApp
//
//  Created by Codex on 2026/4/30.
//

import Foundation

@objcMembers
@objc(XTApplyApi)
class XTApplyApi: XTProductIdPostApi {
    @objc(initProductId:)
    init(productId: String) {
        super.init(storedProductId: productId)
    }

    override func requestUrl() -> String {
        xtAppendingHeaders(to: "sixnv2/gce/apply")
    }

    override func requestArgument() -> Any? {
        productArgument(extra: ["fuhasixmNc": "cakestand"])
    }
}

@objcMembers
@objc(XTDetailApi)
class XTDetailApi: XTProductIdPostApi {
    @objc(initProductId:)
    init(productId: String) {
        super.init(storedProductId: productId)
    }

    override func requestUrl() -> String {
        xtAppendingHeaders(to: "sixnv2/gce/detail")
    }

    override func requestArgument() -> Any? {
        productArgument()
    }
}

@objcMembers
@objc(XTFirstApi)
class XTFirstApi: XTGetApi {
    override func requestUrl() -> String {
        xtAppendingHeaders(to: "sixch/index")
    }
}

@objcMembers
@objc(XTPopUpApi)
class XTPopUpApi: XTGetApi {
    override func requestUrl() -> String {
        xtAppendingHeaders(to: "sixch/pop-up")
    }
}

@objcMembers
@objc(XTPushApi)
class XTPushApi: XTPostApi {
    private let orderId: String

    @objc(initOrderId:)
    init(orderId: String) {
        self.orderId = orderId
        super.init()
    }

    override func requestUrl() -> String {
        xtAppendingHeaders(to: "sixnv2/gce/push")
    }

    override func requestArgument() -> Any? {
        [
            "spsmsixogenicNc": xtString(orderId),
            "ditosixmeNc": "houijhyus"
        ]
    }
}

@objcMembers
@objc(XTHomeApi)
class XTHomeApi: XTGetApi {
    override func requestUrl() -> String {
        xtAppendingHeaders(to: "sixch/home")
    }
}

@objcMembers
@objc(XTOrderListApi)
class XTOrderListApi: XTPostApi {
    dynamic var xt_order_type: String?
    dynamic var xt_page_num = 1
    private(set) dynamic var xt_page_size = 20

    override func requestUrl() -> String {
        xtAppendingHeaders(to: "ph/loan/order-list")
    }

    override func requestArgument() -> Any? {
        [
            "hafbsixackNc": xtString(xt_order_type),
            "leitsiximismNc": "\(xt_page_num)",
            "catosixnizationNc": "\(xt_page_size)"
        ]
    }
}