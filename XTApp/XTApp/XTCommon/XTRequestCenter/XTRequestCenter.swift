//
//  XTRequestCenter.swift
//  XTApp
//
//  Created by Codex on 2026/4/26.
//

import Foundation

private func xtRequestString(_ value: Any?) -> String {
    guard let value, !(value is NSNull) else { return "" }
    if let string = value as? String {
        return string
    }
    return "\(value)"
}

@objcMembers
@objc(XTRequestCenter)
class XTRequestCenter: NSObject {
    private static let shared = XTRequestCenter()

    @objc class func xt_share() -> XTRequestCenter {
        shared
    }

    @objc(xt_market:)
    func xt_market(_ idfa: String) {
        let api = XTMarketApi(idfa: idfa)
        api.xt_startRequestSuccess { dic, _ in
            if let dic {
                let marketFlag = xtRequestString(dic["knxisixuixbNc"])
                if marketFlag == "1" {
                }
            }
        } failure: { _, _ in
        } error: { _ in
        }
    }

    @objc(xt_location:)
    func xt_location(_ block: XTBoolBlock?) {
        let locationManager = XTLocationManger.xt_share()
        guard locationManager.xt_startLocation() else {
            block?(false)
            return
        }

        locationManager.lbsInfoBlock = { infoDic, isSuccess in
            guard isSuccess else {
                block?(false)
                return
            }

            let locationDic: [String: String] = [
                "meonsixymNc": xtRequestString(infoDic["XTProvince"]),
                "prgesixnitureNc": xtRequestString(infoDic["XTCountryCode"]),
                "emlusixmentNc": xtRequestString(infoDic["XTCountry"]),
                "meadsixaltonNc": xtRequestString(infoDic["XTStreet"]),
                "boomsixofoNc": xtRequestString(infoDic["XTLatitude"]),
                "unevsixoutNc": xtRequestString(infoDic["XTLongitude"]),
                "googsixenesisNc": xtRequestString(infoDic["XTCity"]),
                "amitsixiouslyNc": xtRequestString(infoDic["XTRegion"])
            ]

            let api = XTLocationApi(dic: NSDictionary(dictionary: locationDic))
            api.xt_startRequestSuccess { _, _ in
                block?(true)
            } failure: { _, _ in
                block?(false)
            } error: { _ in
                block?(false)
            }
        }
    }

    @objc func xt_device() {
        let api = XTDeviceApi()
        api.xt_startRequestSuccess { _, _ in
        } failure: { _, _ in
        } error: { _ in
        }
    }
}
