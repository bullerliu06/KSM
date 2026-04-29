//
//  XTMyViewModel.swift
//  XTApp
//
//  Created by Codex on 2026/4/26.
//

import Foundation

final class MyViewModel {
    private(set) var myModel: MyModel?

    func xt_home(_ success: XTBlock?, failure: XTBlock?) {
        NetworkService.shared.fetchHome { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let response):
                guard let data = response.data,
                      let jsonData = try? JSONSerialization.data(withJSONObject: data),
                      let model = try? JSONDecoder().decode(MyModel.self, from: jsonData) else {
                    failure?()
                    return
                }
                self.myModel = model
                success?()
            case .failure:
                failure?()
            }
        }
    }

    func xt_orderList(_ orderType: String, page: Int, success: (([OrderModel]) -> Void)?, failure: XTBlock?) {
        NetworkService.shared.orderList(orderType: orderType, page: page) { result in
            switch result {
            case .success(let response):
                let list = response.data?["list"] as? [[String: Any]] ?? []
                guard let jsonData = try? JSONSerialization.data(withJSONObject: list),
                      let models = try? JSONDecoder().decode([OrderModel].self, from: jsonData) else {
                    failure?()
                    return
                }
                success?(models)
            case .failure:
                failure?()
            }
        }
    }

    func xt_logout(_ success: XTBlock?, failure: XTBlock?) {
        NetworkService.shared.logout { result in
            switch result {
            case .success:
                UserSession.shared.logout()
                success?()
            case .failure:
                failure?()
            }
        }
    }

    func xt_deleteAccount(_ success: XTBlock?, failure: XTBlock?) {
        NetworkService.shared.deleteAccount { result in
            switch result {
            case .success:
                UserSession.shared.logout()
                success?()
            case .failure:
                failure?()
            }
        }
    }

    func xt_detail(_ productId: String, success: ((String?, String?) -> Void)?, failure: XTBlock?) {
        NetworkService.shared.detail(productId: productId) { result in
            switch result {
            case .success(let response):
                guard let data = response.data else {
                    failure?()
                    return
                }
                let topInfo = data["heissixtopNc"] as? [String: Any]
                let loanInfo = data["leonsixishNc"] as? [String: Any]
                success?(
                    topInfo.map { XT_Object_To_Stirng($0["excuse"]) },
                    loanInfo.map { XT_Object_To_Stirng($0["cokesixtNc"]) }
                )
            case .failure:
                failure?()
            }
        }
    }

    func xt_push(_ orderId: String, success: ((String?) -> Void)?, failure: XTBlock?) {
        NetworkService.shared.push(orderId: orderId) { result in
            switch result {
            case .success(let response):
                guard let data = response.data else {
                    failure?()
                    return
                }
                success?(XT_Object_To_Stirng(data["relosixomNc"]))
            case .failure:
                failure?()
            }
        }
    }
}

// MARK: - Legacy shim
typealias XTMyViewModel = MyViewModel
