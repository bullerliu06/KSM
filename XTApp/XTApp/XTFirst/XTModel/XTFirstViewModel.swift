//
//  XTFirstViewModel.swift
//  XTApp
//
//  Created by Codex on 2026/4/26.
//

import Foundation

final class FirstViewModel {
    private(set) var indexModel: IndexModel?

    struct ApplyResult {
        let uploadType: Int
        let url: String
        let isList: Bool
    }

    func getFirstSuccess(_ success: XTBlock?, failure: XTBlock?) {
        NetworkService.shared.fetchIndex { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let response):
                guard let data = response.data,
                      let jsonData = try? JSONSerialization.data(withJSONObject: data),
                      let model = try? JSONDecoder().decode(IndexModel.self, from: jsonData) else {
                    failure?()
                    return
                }
                self.indexModel = model
                success?()
            case .failure:
                failure?()
            }
        }
    }

    func xt_popUpSuccess(_ success: ((String, String, String) -> Void)?, failure: XTBlock?) {
        NetworkService.shared.fetchPopUp { result in
            switch result {
            case .success(let response):
                guard let data = response.data else {
                    failure?()
                    return
                }
                success?(
                    XT_Object_To_Stirng(data["meulsixloblastomaNc"]),
                    XT_Object_To_Stirng(data["relosixomNc"]),
                    XT_Object_To_Stirng(data["maansixNc"])
                )
            case .failure:
                failure?()
            }
        }
    }

    func xt_apply(_ productId: String, success: ((Int, String, Bool) -> Void)?, failure: XTBlock?) {
        NetworkService.shared.apply(productId: productId) { result in
            switch result {
            case .success(let response):
                guard let data = response.data else {
                    failure?()
                    return
                }
                let uploadType = Int(XT_Object_To_Stirng(data["flcNsixc"])) ?? 0
                let url = XT_Object_To_Stirng(data["relosixomNc"])
                let isList: Bool
                if let boolVal = data["detrsixogyrateNc"] as? Bool {
                    isList = boolVal
                } else if let intVal = data["detrsixogyrateNc"] as? Int {
                    isList = intVal != 0
                } else {
                    isList = false
                }
                success?(uploadType, url, isList)
            case .failure:
                failure?()
            }
        }
    }

    func xt_detail(_ productId: String, success: ((String, String) -> Void)?, failure: XTBlock?) {
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
                    XT_Object_To_Stirng(topInfo?["excuse"]),
                    XT_Object_To_Stirng(loanInfo?["cokesixtNc"])
                )
            case .failure:
                failure?()
            }
        }
    }

    func xt_push(_ orderId: String, success: ((String) -> Void)?, failure: XTBlock?) {
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

// MARK: - Legacy ObjC shim
typealias XTFirstViewModel = FirstViewModel
