//
//  XTRequestCenter+Market.swift
//  XTApp
//
//  Created by Codex on 2026/4/30.
//

import Foundation

extension XTRequestCenter {
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
}