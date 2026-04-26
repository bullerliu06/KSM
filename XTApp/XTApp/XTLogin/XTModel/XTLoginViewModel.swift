//
//  XTLoginViewModel.swift
//  XTApp
//
//  Created by Codex on 2026/4/26.
//

import Foundation
import YYModel

@objcMembers
@objc(XTLoginViewModel)
class XTLoginViewModel: NSObject {
    @objc(getLogin:success:failure:)
    func getLogin(_ dic: NSDictionary, success: XTBlock?, failure: XTBlock?) {
        let codeApi = XTLoginApi(dic: dic)
        codeApi.xt_startRequestSuccess { result, msg in
            XTUtility.xt_showTips(msg ?? "", view: nil)
            if let result,
               let userDic = result["gugosixyleNc"] as? [AnyHashable: Any] {
                XTUserManger.xt_share().xt_user = XTUserModel.yy_model(with: userDic)
                XTUserManger.xt_share().xt_saveUserDic(userDic)
                success?()
                return
            }
            failure?()
        } failure: { _, str in
            XTUtility.xt_showTips(str ?? "", view: nil)
            failure?()
        } error: { _ in
        }
    }
}
