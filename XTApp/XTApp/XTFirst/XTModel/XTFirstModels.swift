//
//  XTFirstModels.swift
//  XTApp
//
//  Created by Codex on 2026/4/26.
//

import Foundation
import YYModel

private func xtModelString(_ value: Any?) -> String {
    guard let value, !(value is NSNull) else { return "" }
    if let string = value as? String {
        return string
    }
    return "\(value)"
}

private func xtModelDictionary(_ value: Any?) -> [AnyHashable: Any]? {
    if let dictionary = value as? [AnyHashable: Any] {
        return dictionary
    }
    return value as? NSDictionary as? [AnyHashable: Any]
}

@objcMembers
@objc(XTBannerModel)
class XTBannerModel: NSObject {
    dynamic var relosixomNc: String?
    dynamic var cahesixctNc: String?
    dynamic var lietsixusNc: String?
    dynamic var fldgsixeNc: String?
    dynamic var meulsixloblastomaNc: String?
    dynamic var arissixNc: String?
    dynamic var meabsixolismNc: String?
    dynamic var unrosixhibitedNc: String?
    dynamic var flnksixydomNc: String?
    dynamic var quntsixasomeNc: String?
    dynamic var bukbsixeanNc: String?
}

@objcMembers
@objc(XTCardModel)
class XTCardModel: NSObject {
    dynamic var regnsixNc: String?
    dynamic var moossixyllabismNc: String?
    dynamic var sihosixuetteNc: String?
    dynamic var maansixNc: String?
    dynamic var spffsixlicateNc: String?
    dynamic var eahosixleNc: String?
    dynamic var cotesixnderNc: String?
    dynamic var urtesixrNc: String?
    dynamic var paadsixosNc: String?
    dynamic var fiansixcialNc: String?
    dynamic var fatisixshNc: String?
    dynamic var seiasixutobiographicalNc: String?
    dynamic var codosixgNc: String?
    dynamic var brvasixdoNc: String?
    dynamic var enpisixritNc = false
    dynamic var pacasixrditisNc = false
    dynamic var deensixsiveNc: String?
}

@objcMembers
@objc(XTIconModel)
class XTIconModel: NSObject {
    dynamic var intasixntNc: String?
    dynamic var kichsixiNc: String?
}

@objcMembers
@objc(XTLanternModel)
class XTLanternModel: NSObject {
    dynamic var thcksixleafNc: String?
    dynamic var epgysixnyNc: String?
}

@objcMembers
@objc(XTProductModel)
class XTProductModel: NSObject {
    dynamic var regnsixNc: String?
    dynamic var moossixyllabismNc: String?
    dynamic var eahosixleNc: String?
    dynamic var sefisixshNc: [Any]?
    dynamic var liotsixesNc: String?
    dynamic var sihosixuetteNc: String?
    dynamic var maansixNc: String?
    dynamic var spffsixlicateNc: String?
    dynamic var cotesixnderNc: String?
    dynamic var fatisixshNc: String?
    dynamic var godosixlaNc: String?
    dynamic var prgesixstinNc: String?
    dynamic var quntsixasomeNc: String?
    dynamic var magisixnNc: String?
    dynamic var cogesixnitallyNc: String?
    dynamic var sesisixtisationNc: String?
    dynamic var relosixomNc: String?
    dynamic var urtesixrNc: String?
    dynamic var stthsixoscopyNc: String?
    dynamic var scumsixmageNc: [Any]?
    dynamic var lipssixyNc: String?
    dynamic var casusixpNc: [Any]?
    dynamic var budisixeNc: String?
    dynamic var noilsixladaNc: String?
    dynamic var fiansixcialNc: String?
    dynamic var brvasixdoNc: String?
    dynamic var enpisixritNc = false
    dynamic var pacasixrditisNc = false
    dynamic var covisixctiveNc: String?
}

@objcMembers
@objc(XTRepayModel)
class XTRepayModel: NSObject {
    dynamic var fldgsixeNc: String?
    dynamic var upeasixrNc: String?
    dynamic var frwnsixNc: String?
    dynamic var relosixomNc: String?
}

@objcMembers
@objc(XTIndexModel)
class XTIndexModel: NSObject {
    dynamic var iconModel: XTIconModel?
    dynamic var bannerArr: [XTBannerModel]?
    dynamic var big: XTCardModel?
    dynamic var small: XTCardModel?
    dynamic var repayArr: [XTRepayModel]?
    dynamic var lanternArr: [XTLanternModel]?
    dynamic var productArr: [XTProductModel]?
    dynamic var noticeModel: XTRepayModel?

    @objc dynamic var xathsixosisNc: [NSDictionary]? {
        didSet {
            xathsixosisNc?.forEach { item in
                let type = xtModelString(item["itlisixanizeNc"])
                let values = item["gugosixyleNc"] as? [Any]

                if type == "AASIXTENAV" {
                    if let values {
                        bannerArr = NSArray.yy_modelArray(with: XTBannerModel.self, json: values) as? [XTBannerModel]
                    }
                } else if type == "AASIXTENAW" {
                    if let values {
                        lanternArr = NSArray.yy_modelArray(with: XTLanternModel.self, json: values) as? [XTLanternModel]
                    }
                } else if type == "AASIXTENAX" {
                    if let dictionary = xtModelDictionary(values?.first) {
                        big = XTCardModel.yy_model(with: dictionary)
                    }
                } else if type == "AASIXTENAY" {
                    if let dictionary = xtModelDictionary(values?.first) {
                        small = XTCardModel.yy_model(with: dictionary)
                    }
                } else if type == "AASIXTENAZ" {
                    if let values {
                        productArr = NSArray.yy_modelArray(with: XTProductModel.self, json: values) as? [XTProductModel]
                    }
                } else if type == "REPAY_NOTICE" {
                    if let dictionary = xtModelDictionary(values?.first) {
                        noticeModel = XTRepayModel.yy_model(with: dictionary)
                    }
                }
            }
        }
    }

    @objc class func modelCustomPropertyMapper() -> [String: Any] {
        ["iconModel": "ieNcsix"]
    }
}
