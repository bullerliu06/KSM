//
//  XTMyModels.swift
//  XTApp
//
//  Created by Codex on 2026/4/26.
//

import Foundation

@objcMembers
@objc(XTExtendListModel)
class XTExtendListModel: NSObject {
    dynamic var xt_title: String?
    dynamic var xt_icon: String?
    dynamic var xt_url: String?

    @objc class func modelCustomPropertyMapper() -> [String: Any] {
        [
            "xt_title": "fldgsixeNc",
            "xt_icon": "ieNcsix",
            "xt_url": "relosixomNc"
        ]
    }
}

@objcMembers
@objc(XTMyModel)
class XTMyModel: NSObject {
    dynamic var xt_memberUrl: String?
    dynamic var repayment: XTRepaymentModel?
    dynamic var extendLists: [XTExtendListModel]?

    @objc class func modelCustomPropertyMapper() -> [String: Any] {
        [
            "xt_memberUrl": "deensixsiveNc",
            "repayment": "unqusixalizeNc",
            "extendLists": "mehasixemoglobinNc"
        ]
    }

    @objc class func modelContainerPropertyGenericClass() -> [String: Any] {
        ["extendLists": XTExtendListModel.self]
    }
}

@objcMembers
@objc(XTOrderModel)
class XTOrderModel: NSObject {
    dynamic var xt_orderId: String?
    dynamic var xt_productId: String?
    dynamic var xt_inside: String?
    dynamic var xt_productName: String?
    dynamic var xt_productLogo: String?
    dynamic var xt_orderStatus: String?
    dynamic var xt_orderStatusDesc: String?
    dynamic var xt_orderStatusColor: String?
    dynamic var xt_orderAmount: String?
    dynamic var xt_loanDetailUrl: String?
    dynamic var xt_buttonText: String?
    dynamic var xt_buttonBackground: String?
    dynamic var xt_repayTime: String?
    dynamic var xt_showVerification = false

    @objc class func modelCustomPropertyMapper() -> [String: Any] {
        [
            "xt_orderId": "sttesixhoodNc",
            "xt_productId": "munisixumNc",
            "xt_inside": "quntsixasomeNc",
            "xt_productName": "moossixyllabismNc",
            "xt_productLogo": "sihosixuetteNc",
            "xt_orderStatus": "covisixctiveNc",
            "xt_orderStatusDesc": "laarsixckianNc",
            "xt_orderStatusColor": "imotsixenceNc",
            "xt_orderAmount": "istasixcNc",
            "xt_loanDetailUrl": "aplisixcableNc",
            "xt_buttonText": "maansixNc",
            "xt_buttonBackground": "shkasixriNc",
            "xt_repayTime": "exersixiencelessNc",
            "xt_showVerification": "detrsixogyrateNc"
        ]
    }
}

@objcMembers
@objc(XTRepaymentModel)
class XTRepaymentModel: NSObject {
    dynamic var xt_order_no: String?
    dynamic var xt_product_id: String?
    dynamic var xt_date: String?
    dynamic var xt_amount: String?
    dynamic var xt_product_name: String?
    dynamic var xt_icon: String?
    dynamic var xt_url: String?

    @objc class func modelCustomPropertyMapper() -> [String: Any] {
        [
            "xt_order_no": "spsmsixogenicNc",
            "xt_product_id": "lietsixusNc",
            "xt_date": "acepsixtablyNc",
            "xt_amount": "geersixalitatNc",
            "xt_product_name": "harysixNc",
            "xt_icon": "ieNcsix",
            "xt_url": "relosixomNc"
        ]
    }
}
