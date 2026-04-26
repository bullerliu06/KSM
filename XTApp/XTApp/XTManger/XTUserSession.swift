//
//  XTUserSession.swift
//  XTApp
//
//  Created by Codex on 2026/4/26.
//

import Foundation
import UIKit
import YYModel

private let xtUserPath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first ?? "") + "/XT_USER"

@objcMembers
@objc(XTUserModel)
class XTUserModel: NSObject {
    dynamic var xt_isOld: String?
    dynamic var xt_smsMaxId: String?
    dynamic var xt_userId: String?
    dynamic var xt_phone: String?
    dynamic var xt_realname: String?
    dynamic var xt_token: String?
    dynamic var xt_userSessionid: String?
    dynamic var xt_is_aduit = false

    @objc class func modelCustomPropertyMapper() -> [String: Any] {
        [
            "xt_isOld": "phsisixographicalNc",
            "xt_smsMaxId": "heersixochromaticNc",
            "xt_userId": "bamysixNc",
            "xt_phone": "stwasixrdessNc",
            "xt_realname": "edNcsix",
            "xt_token": "tetosixgenesisNc",
            "xt_userSessionid": "fifosixotedNc",
            "xt_is_aduit": "aoNcsix"
        ]
    }
}

@objcMembers
@objc(XTUserManger)
class XTUserManger: NSObject {
    private static let shared = XTUserManger()
    private var storedUser: XTUserModel?

    dynamic var xt_user: XTUserModel? {
        get {
            if storedUser == nil,
               FileManager.default.fileExists(atPath: xtUserPath),
               let dictionary = NSDictionary(contentsOfFile: xtUserPath) as? [AnyHashable: Any] {
                storedUser = XTUserModel.yy_model(with: dictionary)
            }
            return storedUser
        }
        set {
            storedUser = newValue
        }
    }

    @objc class func xt_share() -> XTUserManger {
        shared
    }

    @objc class func xt_isLogin() -> Bool {
        guard let user = shared.xt_user,
              let userId = user.xt_userId,
              let sessionId = user.xt_userSessionid else {
            return false
        }
        return !userId.isEmpty && !sessionId.isEmpty
    }

    @objc(xt_saveUserDic:)
    func xt_saveUserDic(_ dic: [AnyHashable: Any]) {
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: xtUserPath) {
            do {
                try fileManager.removeItem(atPath: xtUserPath)
            } catch {
                NSLog("删除文件失败:%@", "\(error)")
            }
        }
        (dic as NSDictionary).write(toFile: xtUserPath, atomically: true)
    }

    @objc func xt_loginOut() {
        XTUtility.xt_share().xt_removeFile(withPath: xtUserPath)
        xt_user = nil
        (UIApplication.shared.delegate as? AppDelegate)?.xt_loginView()
    }
}
