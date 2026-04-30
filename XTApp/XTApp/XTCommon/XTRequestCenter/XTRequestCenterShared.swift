//
//  XTRequestCenterShared.swift
//  XTApp
//
//  Created by Codex on 2026/4/30.
//

import Foundation

func xtRequestString(_ value: Any?) -> String {
    guard let value, !(value is NSNull) else { return "" }
    if let string = value as? String {
        return string
    }
    return "\(value)"
}

func xtLocationPayload(from infoDic: [AnyHashable: Any]?) -> NSDictionary {
    let locationDic: [String: String] = [
        "meonsixymNc": xtRequestString(infoDic?["XTProvince"]),
        "prgesixnitureNc": xtRequestString(infoDic?["XTCountryCode"]),
        "emlusixmentNc": xtRequestString(infoDic?["XTCountry"]),
        "meadsixaltonNc": xtRequestString(infoDic?["XTStreet"]),
        "boomsixofoNc": xtRequestString(infoDic?["XTLatitude"]),
        "unevsixoutNc": xtRequestString(infoDic?["XTLongitude"]),
        "googsixenesisNc": xtRequestString(infoDic?["XTCity"]),
        "amitsixiouslyNc": xtRequestString(infoDic?["XTRegion"])
    ]
    return NSDictionary(dictionary: locationDic)
}