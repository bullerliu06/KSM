//
//  PTHomeModels.swift
//  PTApp
//

import Foundation

@objcMembers
class PTHomeBaseModel: PTBaseModel {
    dynamic var level: Int = 0
    dynamic var cellType: String = ""
    dynamic var cellHigh: Int = 0
}

@objcMembers
class PTHomeApplyModel: PTBaseModel {
    dynamic var retenloomNc: String = ""
    dynamic var fltencNc: Int = 0
    dynamic var detentrogyrateNc: Bool = false
}

@objcMembers
class PTHomeIetenNcModel: PTHomeBaseModel {
    dynamic var intentantNc: String = ""
    dynamic var kitenchiNc: String = ""
}

@objcMembers
class PTHomeBannerItemModel: PTHomeBaseModel {
    dynamic var retenloomNc: String = ""
    dynamic var artenisNc: String = ""
}

@objcMembers
class PTHomeBannerModel: PTHomeBaseModel {
    dynamic var ittenlianizeNc: String = ""
    dynamic var gutengoyleNc: [PTHomeBannerItemModel] = []

    override var level: Int {
        get { 6 }
        set { super.level = newValue }
    }

    @objc class func modelContainerPropertyGenericClass() -> [String: AnyClass] {
        ["gutengoyleNc": PTHomeBannerItemModel.self]
    }
}

@objcMembers
class PTHomeLargeEcardItemModel: PTHomeBaseModel {
    dynamic var retengnNc: String = ""
    dynamic var motenosyllabismNc: String = ""
    dynamic var sitenhoutteNc: String = ""
    dynamic var matenanNc: String = ""
    dynamic var sptenfflicateNc: String = ""
    dynamic var eatenholeNc: String = ""
    dynamic var cotentenderNc: String = ""
    dynamic var urtenterNc: String = ""
    dynamic var patenadosNc: String = ""
    dynamic var fitenancialNc: String = ""
    dynamic var fatentishNc: String = ""
    dynamic var seteniautobiographicalNc: String = ""
    dynamic var cotendogNc: String = ""
}

@objcMembers
class PTHomeLargeEcardModel: PTHomeBaseModel {
    dynamic var ittenlianizeNc: String = ""
    dynamic var gutengoyleNc: [PTHomeLargeEcardItemModel] = []

    override var level: Int {
        get { 1 }
        set { super.level = newValue }
    }

    @objc class func modelContainerPropertyGenericClass() -> [String: AnyClass] {
        ["gutengoyleNc": PTHomeLargeEcardItemModel.self]
    }
}

@objcMembers
class PTHomeProductListModel: PTHomeBaseModel {
    dynamic var retengnNc: String = ""
    dynamic var motenosyllabismNc: String = ""
    dynamic var sitenhoutteNc: String = ""
    dynamic var eatenholeNc: String = ""
    dynamic var cotentenderNc: String = ""
    dynamic var sptenfflicateNc: String = ""
    dynamic var matenanNc: String = ""

    override var level: Int {
        get { 7 }
        set { super.level = newValue }
    }
}

@objcMembers
class PTHomeProductModel: PTHomeBaseModel {
    dynamic var ittenlianizeNc: String = ""
    dynamic var gutengoyleNc: [PTHomeProductListModel] = []

    override var level: Int {
        get { 7 }
        set { super.level = newValue }
    }

    @objc class func modelContainerPropertyGenericClass() -> [String: AnyClass] {
        ["gutengoyleNc": PTHomeProductListModel.self]
    }
}

@objcMembers
class PTHomeRepayRealModel: PTHomeBaseModel {
    dynamic var frtenwnNc: String = ""
    dynamic var retenloomNc: String = ""

    override var cellHigh: Int {
        get { 128 }
        set { super.cellHigh = newValue }
    }

    override var level: Int {
        get { 5 }
        set { super.level = newValue }
    }
}

@objcMembers
class PTHomeRepayModel: PTHomeBaseModel {
    dynamic var gutengoyleNc: [PTHomeRepayRealModel] = []

    override var cellHigh: Int {
        get { 128 }
        set { super.cellHigh = newValue }
    }

    override var level: Int {
        get { 5 }
        set { super.level = newValue }
    }

    @objc class func modelContainerPropertyGenericClass() -> [String: AnyClass] {
        ["gutengoyleNc": PTHomeRepayRealModel.self]
    }
}

@objcMembers
class PTHomeSmallCardItemModel: PTHomeBaseModel {
    dynamic var retengnNc: String = ""
    dynamic var motenosyllabismNc: String = ""
    dynamic var sitenhoutteNc: String = ""
    dynamic var matenanNc: String = ""
    dynamic var sptenfflicateNc: String = ""
    dynamic var eatenholeNc: String = ""
    dynamic var cotentenderNc: String = ""
    dynamic var urtenterNc: String = ""
    dynamic var patenadosNc: String = ""
    dynamic var fitenancialNc: String = ""
    dynamic var fatentishNc: String = ""
    dynamic var seteniautobiographicalNc: String = ""
    dynamic var cotendogNc: String = ""
    dynamic var detenensiveNc: String = ""
}

@objcMembers
class PTHomeSmallCardModel: PTHomeBaseModel {
    dynamic var ittenlianizeNc: String = ""
    dynamic var gutengoyleNc: [PTHomeSmallCardItemModel] = []

    override var level: Int {
        get { 4 }
        set { super.level = newValue }
    }

    @objc class func modelContainerPropertyGenericClass() -> [String: AnyClass] {
        ["gutengoyleNc": PTHomeSmallCardItemModel.self]
    }
}

@objcMembers
class PTRidingLanternItemModel: PTHomeBaseModel {
    dynamic var thtenckleafNc: String = ""
    dynamic var eptengynyNc: String = ""
}

@objcMembers
class PTRidingLanternModel: PTHomeBaseModel {
    dynamic var ittenlianizeNc: String = ""
    dynamic var gutengoyleNc: [PTRidingLanternItemModel] = []

    @objc class func modelContainerPropertyGenericClass() -> [String: AnyClass] {
        ["gutengoyleNc": PTRidingLanternItemModel.self]
    }
}
