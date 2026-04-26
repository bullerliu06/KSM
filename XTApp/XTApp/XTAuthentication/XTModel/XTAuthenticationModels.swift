//
//  XTAuthenticationModels.swift
//  XTApp
//
//  Created by Codex on 2026/4/26.
//

import UIKit

@objcMembers
@objc(XTNoteModel)
class XTNoteModel: NSObject {
    dynamic var xt_name: String?
    dynamic var xt_type: String?
    dynamic var xt_icon: String?

    @objc class func modelCustomPropertyMapper() -> [String: Any] {
        [
            "xt_name": "uporsixnNc",
            "xt_type": ["itlisixanizeNc", "dempsixhasizeNc", "regnsixNc"],
            "xt_icon": "ieNcsix"
        ]
    }
}

@objcMembers
@objc(XTOcrNoteModel)
class XTOcrNoteModel: XTNoteModel {
    dynamic var xt_bg_img: String?

    override class func modelCustomPropertyMapper() -> [String: Any] {
        [
            "xt_bg_img": "ovrpsixunchNc",
            "xt_name": "roansixizeNc",
            "xt_type": "ceNcsix"
        ]
    }
}

@objcMembers
@objc(XTListModel)
class XTListModel: NSObject {
    dynamic var xt_id: String?
    dynamic var xt_title: String?
    dynamic var xt_subtitle: String?
    dynamic var xt_code: String?
    dynamic var xt_cate: String?
    dynamic var noteList: [XTNoteModel]?
    dynamic var xt_optional = false
    dynamic var xt_value: String? {
        didSet {
            value = xt_value
        }
    }
    private var nameStorage: String?
    dynamic var value: String?
    @objc dynamic weak var cell: UITableViewCell?
    dynamic var isHiddenCell = false

    dynamic var name: String? {
        get {
            if nameStorage == nil {
                if xt_cate == "AASIXTENBG" || xt_cate == "AASIXTENBL" || xt_cate == "AASIXTENBJ" {
                    nameStorage = value
                } else if (Int(value ?? "") ?? 0) > 0 {
                    nameStorage = noteList?.first { $0.xt_type == value }?.xt_name
                } else {
                    nameStorage = ""
                }
            }
            return nameStorage
        }
        set {
            nameStorage = newValue
        }
    }

    @objc class func modelCustomPropertyMapper() -> [String: Any] {
        [
            "xt_id": "regnsixNc",
            "xt_title": "fldgsixeNc",
            "xt_subtitle": "orinsixarilyNc",
            "xt_code": "imeasixsurabilityNc",
            "xt_cate": "lebosixardNc",
            "noteList": "tubosixdrillNc",
            "xt_value": "darysixmanNc",
            "xt_optional": "tapasixxNc"
        ]
    }

    @objc class func modelContainerPropertyGenericClass() -> [String: Any] {
        ["noteList": XTNoteModel.self]
    }
}

@objcMembers
@objc(XTItemsModel)
class XTItemsModel: NSObject {
    dynamic var xt_title: String?
    dynamic var xt_sub_title: String?
    dynamic var xt_more = false
    dynamic var list: [XTListModel]?
    dynamic var hiddenChild = false

    @objc class func modelCustomPropertyMapper() -> [String: Any] {
        [
            "xt_title": "fldgsixeNc",
            "xt_sub_title": "sub_title",
            "xt_more": "more",
            "list": "xathsixosisNc"
        ]
    }

    @objc class func modelContainerPropertyGenericClass() -> [String: Any] {
        ["list": XTListModel.self]
    }
}

@objcMembers
@objc(XTVerifyBaseModel)
class XTVerifyBaseModel: NSObject {
    dynamic var xt_countdown = 0
    dynamic var items: [XTItemsModel]?

    @objc class func modelCustomPropertyMapper() -> [String: Any] {
        [
            "xt_countdown": "paeosixgrapherNc",
            "items": "ovrfsixraughtNc"
        ]
    }

    @objc class func modelContainerPropertyGenericClass() -> [String: Any] {
        ["items": XTItemsModel.self]
    }
}

@objcMembers
@objc(XTContactItemModel)
class XTContactItemModel: NSObject {
    dynamic var xt_title: String?
    dynamic var xt_field: [Any]?
    dynamic var relation: [XTNoteModel]?
    dynamic var xt_name: String?
    dynamic var xt_mobile: String?
    dynamic var xt_relation: String?
    private var firstValueStorage: String?
    private var secondValueStorage: String?
    private var threeValueStorage: String?
    private var threeNameStorage: String?

    dynamic var firstValue: String? {
        get { firstValueStorage ?? xt_name }
        set { firstValueStorage = newValue }
    }

    dynamic var secondValue: String? {
        get { secondValueStorage ?? xt_mobile }
        set { secondValueStorage = newValue }
    }

    dynamic var threeValue: String? {
        get { threeValueStorage ?? xt_relation }
        set { threeValueStorage = newValue }
    }

    dynamic var threeName: String? {
        get {
            if threeNameStorage == nil {
                threeNameStorage = relation?.first { $0.xt_type == xt_relation }?.xt_name
            }
            return threeNameStorage
        }
        set {
            threeNameStorage = newValue
        }
    }

    @objc class func modelCustomPropertyMapper() -> [String: Any] {
        [
            "xt_title": "fldgsixeNc",
            "xt_field": "inhosixationNc",
            "relation": "bedisixeNc",
            "xt_name": "koNcsix.uporsixnNc",
            "xt_mobile": "koNcsix.halosixwNc",
            "xt_relation": "koNcsix.bedisixeNc"
        ]
    }

    @objc class func modelContainerPropertyGenericClass() -> [String: Any] {
        ["relation": XTNoteModel.self]
    }
}

@objcMembers
@objc(XTVerifyContactModel)
class XTVerifyContactModel: NSObject {
    dynamic var xt_countdown = 0
    dynamic var items: [XTContactItemModel]?

    @objc class func modelCustomPropertyMapper() -> [String: Any] {
        [
            "xt_countdown": "paeosixgrapherNc",
            "items": "ovrfsixraughtNc"
        ]
    }

    @objc class func modelContainerPropertyGenericClass() -> [String: Any] {
        ["items": XTContactItemModel.self]
    }
}

@objcMembers
@objc(XTPhotoModel)
class XTPhotoModel: NSObject {
    dynamic var xt_relation_id: String?
    dynamic var xt_img: String?
    dynamic var xt_type: String?
    private var xtNameStorage: String?
    dynamic var note: [XTOcrNoteModel]?
    dynamic var list: [XTListModel]?
    dynamic var path: String?
    dynamic var value: String?

    dynamic var xt_name: String? {
        get {
            if xtNameStorage == nil {
                xtNameStorage = note?.first { $0.xt_type == xt_type }?.xt_name
            }
            return xtNameStorage
        }
        set {
            xtNameStorage = newValue
        }
    }

    @objc class func modelCustomPropertyMapper() -> [String: Any] {
        [
            "xt_relation_id": "darysixmanNc",
            "xt_img": "relosixomNc",
            "xt_type": "decasixleNc",
            "note": "tubosixdrillNc",
            "list": "xathsixosisNc"
        ]
    }

    @objc class func modelContainerPropertyGenericClass() -> [String: Any] {
        [
            "note": XTOcrNoteModel.self,
            "list": XTListModel.self
        ]
    }
}

@objcMembers
@objc(XTOcrModel)
class XTOcrModel: NSObject {
    dynamic var xt_countdown = 0
    dynamic var model: XTPhotoModel?

    @objc class func modelCustomPropertyMapper() -> [String: Any] {
        [
            "xt_countdown": "paeosixgrapherNc",
            "model": "casasixbNc"
        ]
    }
}

@objcMembers
@objc(XTFaceModel)
class XTFaceModel: NSObject {
    dynamic var xt_relation_id: String?
    dynamic var xt_url: String?
    dynamic var xt_is_huoti: NSNumber?

    @objc class func modelCustomPropertyMapper() -> [String: Any] {
        [
            "xt_relation_id": "darysixmanNc",
            "xt_url": "relosixomNc",
            "xt_is_huoti": "fonNsixc"
        ]
    }
}

@objcMembers
@objc(XTBankItemModel)
class XTBankItemModel: NSObject {
    dynamic var note: [XTNoteModel]?
    dynamic var xt_channel: String?
    private var channelNameStorage: String?
    private var accountStorage: String?

    dynamic var xt_channel_name: String? {
        get {
            if channelNameStorage == nil {
                channelNameStorage = note?.first { $0.xt_type == xt_channel }?.xt_name
            }
            return channelNameStorage
        }
        set {
            channelNameStorage = newValue
        }
    }

    dynamic var xt_account: String? {
        get {
            if accountStorage == nil {
                let phone = XTUserManger.xt_share().xt_user?.xt_phone ?? ""
                accountStorage = phone.hasPrefix("0") ? phone : "0\(phone)"
            }
            return accountStorage
        }
        set {
            accountStorage = newValue
        }
    }

    @objc class func modelCustomPropertyMapper() -> [String: Any] {
        [
            "note": "unrdsixerlyNc",
            "xt_channel": "koNcsix.blthsixelyNc",
            "xt_account": "koNcsix.ovrcsixutNc"
        ]
    }

    @objc class func modelContainerPropertyGenericClass() -> [String: Any] {
        ["note": XTNoteModel.self]
    }
}

@objcMembers
@objc(XTBankModel)
class XTBankModel: NSObject {
    dynamic var xt_countdown = 0
    dynamic var bankModel: XTBankItemModel?
    dynamic var walletModel: XTBankItemModel?

    @objc class func modelCustomPropertyMapper() -> [String: Any] {
        [
            "xt_countdown": "paeosixgrapherNc",
            "bankModel": "murasixyNc",
            "walletModel": "abensixtlyNc"
        ]
    }
}

@objcMembers
@objc(XTVerifyListModel)
class XTVerifyListModel: NSObject {
    dynamic var noassixsessabilityNc: String?
    dynamic var fldgsixeNc: String?
    dynamic var doabsixleNc: String?
    dynamic var frllsixyNc = false
}
