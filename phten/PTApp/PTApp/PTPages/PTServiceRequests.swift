//
//  PTServiceRequests.swift
//  PTApp
//

import Foundation
import YTKNetwork

private func ptValue(_ value: String?) -> String {
    value ?? ""
}

@objc(PTLoginGetSMSCodeService)
class PTLoginGetSMSCodeService: PTDictionaryRequest {
    @objc(initWithPhoneNumber:)
    init(phoneNumber: String?) {
        super.init(
            data: [
                "chtenreographyNc": ptValue(phoneNumber),
                "betentyNc": "juyttrr"
            ],
            path: "tencp/get_code",
            showLoading: true
        )
    }
}

@objc(PTLoginService)
class PTLoginService: PTDictionaryRequest {
    @objc(initWithPhoneDataDic:)
    init(phoneDataDic dataDic: NSDictionary?) {
        super.init(data: dataDic ?? [:], path: "tencp/login", showLoading: true)
    }
}

@objc(PTHomeIndexService)
class PTHomeIndexService: PTDictionaryRequest {
    @objc(initWithhomeIndex)
    init() {
        super.init(data: [:], path: "tench/index", method: .GET)
    }
}

@objc(PTHomePopApi)
class PTHomePopApi: PTDictionaryRequest {
    init() {
        super.init(data: [:], path: "tench/pop-up", method: .GET)
    }
}

@objc(PTHomeGCeDetailService)
class PTHomeGCeDetailService: PTDictionaryRequest {
    @objc(initWithProductId:)
    init(productId: String?) {
        super.init(
            data: ["litenetusNc": ptValue(productId)],
            path: "tennv2/gce/detail",
            showLoading: true
        )
    }
}

@objc(PTHomeGCePushService)
class PTHomeGCePushService: PTDictionaryRequest {
    @objc(initWithOrderId:)
    init(orderId: String?) {
        super.init(
            data: [
                "sptensmogenicNc": ptValue(orderId),
                "qutennquevalentNc": "dddd",
                "ditentomeNc": "houijhyus"
            ],
            path: "tennv2/gce/push"
        )
    }
}

@objc(PTHomeGceApplyService)
class PTHomeGceApplyService: PTDictionaryRequest {
    @objc(initWithlitenetusNc:)
    init(litenetusNc: String?) {
        super.init(
            data: [
                "litenetusNc": ptValue(litenetusNc),
                "futenhamNc": "cakestand"
            ],
            path: "tennv2/gce/apply",
            showLoading: true
        )
    }
}

@objc(PTAuthenTicationSerive)
class PTAuthenTicationSerive: PTDictionaryRequest {
    @objc(initWithlitenetusNc:)
    init(litenetusNc: String?) {
        super.init(
            data: ["litenetusNc": ptValue(litenetusNc)],
            path: "tennv2/gce/detail",
            showLoading: true
        )
    }
}

@objc(PTMineIndexService)
class PTMineIndexService: PTDictionaryRequest {
    @objc(initWithMineIndex)
    init() {
        super.init(data: [:], path: "tench/home", method: .GET, showLoading: true)
    }
}

@objc(PTSettLogoutService)
class PTSettLogoutService: PTDictionaryRequest {
    @objc(initWithSettLogout)
    init() {
        super.init(data: [:], path: "tencp/logout", method: .GET, showLoading: true)
    }
}

@objc(PTOrderAPI)
class PTOrderAPI: PTDictionaryRequest {
    @objc(initWithNumber:page:pageSize:)
    init(status: Int, page: Int, pageSize: Int) {
        super.init(
            data: [
                "hatenfbackNc": "\(status)",
                "letenitimismNc": "\(page)",
                "catentonizationNc": 20
            ],
            path: "tenco/list",
            showLoading: true
        )
    }
}

@objc(PTBasicVerifyService)
class PTBasicVerifyService: PTDictionaryRequest {
    @objc(initWithProductId:)
    init(productId: String?) {
        super.init(
            data: [
                "litenetusNc": ptValue(productId),
                "butennableNc": "stauistill"
            ],
            path: "tenca/person",
            showLoading: true
        )
    }
}

@objc(PTSaveBasicVerifyService)
class PTSaveBasicVerifyService: PTDictionaryRequest {
    @objc(initWithDic:)
    init(dic: NSDictionary?) {
        super.init(data: dic ?? [:], path: "tenca/person_next", showLoading: true)
    }
}

@objc(PTGetContactService)
class PTGetContactService: PTDictionaryRequest {
    @objc(initWithProductId:)
    init(productId: String?) {
        super.init(
            data: [
                "litenetusNc": ptValue(productId),
                "setenisacredNc": "blaalleynk"
            ],
            path: "tenca/contact",
            showLoading: true
        )
    }
}

@objc(PTSaveContactService)
class PTSaveContactService: PTDictionaryRequest {
    @objc(initWithDic:)
    init(dic: NSDictionary?) {
        super.init(data: dic ?? [:], path: "tenca/contact_next", showLoading: true)
    }
}

@objc(PTGetIdentifyService)
class PTGetIdentifyService: PTDictionaryRequest {
    @objc(initWithProductId:)
    init(productId: String?) {
        super.init(data: ["litenetusNc": ptValue(productId)], path: "tenca/photo", showLoading: true)
    }
}

@objc(PTSaveIdentifyService)
class PTSaveIdentifyService: PTDictionaryRequest {
    @objc(initWithDic:)
    init(dic: NSDictionary?) {
        super.init(data: dic ?? [:], path: "tenca/photo_next", showLoading: true)
    }
}

@objc(PTInitLiveService)
class PTInitLiveService: PTDictionaryRequest {
    @objc(initWithProductId:)
    init(productId: String?) {
        super.init(data: ["litenetusNc": ptValue(productId)], path: "tenca/auth", showLoading: true)
    }
}

@objc(PTLimitLiveService)
class PTLimitLiveService: PTDictionaryRequest {
    @objc(initWithProductId:)
    init(productId: String?) {
        super.init(data: ["litenetusNc": ptValue(productId)], path: "tenca/limit", showLoading: true)
    }
}

@objc(PTAuthLiveService)
class PTAuthLiveService: PTDictionaryRequest {
    init() {
        super.init(data: [:], path: "tenca/license", method: .GET, showLoading: true)
    }
}

@objc(PTDetectionLiveService)
class PTDetectionLiveService: PTDictionaryRequest {
    @objc(initWithProductId:liveness_id:)
    init(productId: String?, livenessId: String?) {
        super.init(
            data: [
                "litenetusNc": ptValue(productId),
                "gytenoseNc": ptValue(livenessId)
            ],
            path: "tenca/detection",
            showLoading: true
        )
    }
}

@objc(PTSaveLiveService)
class PTSaveLiveService: PTDictionaryRequest {
    @objc(initWithDic:)
    init(dic: NSDictionary?) {
        super.init(data: dic ?? [:], path: "tenca/saveauth", showLoading: true)
    }
}

@objc(PTAuthErrorLiveService)
class PTAuthErrorLiveService: PTDictionaryRequest {
    @objc(initWithError:)
    init(error: String?) {
        super.init(data: ["datenrymanNc": ptValue(error)], path: "tenca/auth_err")
    }
}

@objc(PTGetBankService)
class PTGetBankService: PTDictionaryRequest {
    @objc(initWithProductId:)
    init(productId: String?) {
        super.init(data: ["litenetusNc": ptValue(productId)], path: "tenca/card", showLoading: true)
    }
}

@objc(PTSaveBankService)
class PTSaveBankService: PTDictionaryRequest {
    @objc(initWithDic:)
    init(dic: NSDictionary?) {
        super.init(data: dic ?? [:], path: "tenca/card_next", showLoading: true)
    }
}
