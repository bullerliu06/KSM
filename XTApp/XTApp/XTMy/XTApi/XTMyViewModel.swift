//
//  XTMyViewModel.swift
//  XTApp
//
//  Created by Codex on 2026/4/26.
//

import Foundation
import YYModel

@objcMembers
@objc(XTMyViewModel)
class XTMyViewModel: NSObject {
    dynamic var myModel: XTMyModel?

    @objc(xt_home:failure:)
    func xt_home(_ success: XTBlock?, failure: XTBlock?) {
        let api = XTHomeApi()
        api.xt_startRequestSuccess { [weak self] dic, _ in
            if let dic {
                self?.myModel = XTMyModel.yy_model(with: dic)
            }
            success?()
        } failure: { _, str in
            XTUtility.xt_showTips(str ?? "", view: nil)
            failure?()
        } error: { _ in
            failure?()
        }
    }
}
