//
//  XTFirstViewModel.swift
//  XTApp
//
//  Created by Codex on 2026/4/26.
//

import Foundation
import YYModel

private func xtViewModelString(_ value: Any?) -> String {
    guard let value, !(value is NSNull) else { return "" }
    if let string = value as? String {
        return string
    }
    return "\(value)"
}

private func xtViewModelBool(_ value: Any?) -> Bool {
    NSString(string: xtViewModelString(value)).boolValue
}

@objcMembers
@objc(XTFirstViewModel)
class XTFirstViewModel: NSObject {
    dynamic var indexModel: XTIndexModel?

    @objc(getFirstSuccess:failure:)
    func getFirstSuccess(_ success: XTBlock?, failure: XTBlock?) {
        let firstApi = XTFirstApi()
        firstApi.xt_startRequestSuccess { [weak self] dic, _ in
            if let dic {
                self?.indexModel = XTIndexModel.yy_model(with: dic)
            }
            success?()
        } failure: { _, str in
            XTUtility.xt_showTips(str ?? "", view: nil)
            failure?()
        } error: { _ in
            failure?()
        }
    }

    @objc(xt_popUpSuccess:failure:)
    func xt_popUpSuccess(_ success: ((_ imgUrl: String, _ url: String, _ buttonText: String) -> Void)?, failure: XTBlock?) {
        let api = XTPopUpApi()
        api.xt_startRequestSuccess { dic, str in
            if let dic {
                let imgUrl = xtViewModelString(dic["meulsixloblastomaNc"])
                let url = xtViewModelString(dic["relosixomNc"])
                let buttonText = xtViewModelString(dic["maansixNc"])
                success?(imgUrl, url, buttonText)
            } else {
                XTUtility.xt_showTips(str ?? "", view: nil)
                failure?()
            }
        } failure: { _, str in
            XTUtility.xt_showTips(str ?? "", view: nil)
            failure?()
        } error: { _ in
            failure?()
        }
    }

    @objc(xt_apply:success:failure:)
    func xt_apply(_ productId: String, success: ((_ uploadType: Int, _ url: String, _ isList: Bool) -> Void)?, failure: XTBlock?) {
        let api = XTApplyApi(productId: productId)
        api.xt_startRequestSuccess { dic, str in
            if let dic {
                let uploadType = Int(xtViewModelString(dic["flcNsixc"])) ?? 0
                let url = xtViewModelString(dic["relosixomNc"])
                let isList = xtViewModelBool(dic["detrsixogyrateNc"])
                success?(uploadType, url, isList)
            } else {
                XTUtility.xt_showTips(str ?? "", view: nil)
                failure?()
            }
        } failure: { _, str in
            XTUtility.xt_showTips(str ?? "", view: nil)
            failure?()
        } error: { _ in
            failure?()
        }
    }

    @objc(xt_detail:success:failure:)
    func xt_detail(_ productId: String, success: ((_ code: String?, _ orderId: String?) -> Void)?, failure: XTBlock?) {
        let api = XTDetailApi(productId: productId)
        api.xt_startRequestSuccess { dic, str in
            if let dic,
               let loanInfo = dic["leonsixishNc"] as? [AnyHashable: Any] {
                let topInfo = dic["heissixtopNc"] as? [AnyHashable: Any]
                let code = topInfo.map { xtViewModelString($0["excuse"]) }
                let orderId = xtViewModelString(loanInfo["cokesixtNc"])
                success?(code, orderId)
            } else {
                XTUtility.xt_showTips(str ?? "", view: nil)
                failure?()
            }
        } failure: { _, str in
            XTUtility.xt_showTips(str ?? "", view: nil)
            failure?()
        } error: { _ in
            failure?()
        }
    }

    @objc(xt_push:success:failure:)
    func xt_push(_ orderId: String, success: XTStrBlock?, failure: XTBlock?) {
        let api = XTPushApi(orderId: orderId)
        api.xt_startRequestSuccess { dic, str in
            if let dic {
                success?(xtViewModelString(dic["relosixomNc"]))
            } else {
                XTUtility.xt_showTips(str ?? "", view: nil)
                failure?()
            }
        } failure: { _, str in
            XTUtility.xt_showTips(str ?? "", view: nil)
            failure?()
        } error: { _ in
            failure?()
        }
    }
}
