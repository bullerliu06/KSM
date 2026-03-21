//
//  PBEERunFastByNetTools.swift
//  CreditPro
//
//  Created by Sibs on 2024/10/3.
//

import Alamofire

class PBEERunFastByNetTools {
    var url = "https://api.t-yae-lending.com/api"
    var h5Url = "https://www.t-yae-lending.com"
    static let shared = PBEERunFastByNetTools()
    private init() {}
    
}

class PBEERuuner {
    var kelomiyas = 0
    var bojjerblokke = "node"
    var meanings = ""
    var feedBaseCall = JSON()
    var floar:[Int] = [12,44]
}

extension String {
    var addHeader:String {
        return PBEERunFastByNetTools.shared.url + self + "?" + headerString
    }
    
    var headers:[String: Any] {
        return [
            "rxpKillerJqj": "ios",
            "rxpZaibatsuJqj": getappVersion(),
            "rxpGustyJqj": getAppDeviceName(),
            "rxpAnalogousJqj":  PERABEEDeviceTool.getIDFV(),
            "rxpOrgandyJqj":  getAppiphoneVersion(),
            "rxpBlowzedJqj":"ph",
            "rxpChryselephantineJqj": getAppbundleId(),
            "rxpMicrometeoroidJqj":"",
            "rxpCabalaJqj":PBEEDefaultRunsClearVibs.appid,
            "rxpAffranchiseJqj":PBEEDefaultRunsClearVibs.name
        ]
    }
    
    
    
    var headerString: String{
        let headerEncode = URLEncoding.default
        return headerEncode.runCodeFoematUnesdiar(headers)
    }
}

