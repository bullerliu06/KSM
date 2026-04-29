//
//  XTLoginViewModel.swift
//  XTApp
//
//  Created by Codex on 2026/4/26.
//

import Foundation

final class LoginViewModel {

    func getPhoneCode(_ phone: String, success: ((String?) -> Void)?, failure: XTBlock?) {
        NetworkService.shared.getPhoneCode(phone: phone) { result in
            switch result {
            case .success(let response):
                success?(response.message)
            case .failure:
                failure?()
            }
        }
    }

    func getLogin(_ params: NSDictionary, success: XTBlock?, failure: XTBlock?) {
        NetworkService.shared.login(params: params as? [String: Any] ?? [:]) { result in
            switch result {
            case .success(let response):
                XTUtility.xt_showTips(response.message, view: nil)
                guard let userDict = response.data?["gugosixyleNc"] as? [String: Any] else {
                    failure?()
                    return
                }
                UserSession.shared.saveUser(from: userDict)
                success?()
            case .failure(let error):
                XTUtility.xt_showTips(error.localizedDescription, view: nil)
                failure?()
            }
        }
    }
}

// MARK: - Legacy shim
typealias XTLoginViewModel = LoginViewModel
