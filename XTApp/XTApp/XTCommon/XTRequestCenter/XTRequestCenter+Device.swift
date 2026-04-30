//
//  XTRequestCenter+Device.swift
//  XTApp
//
//  Created by Codex on 2026/4/30.
//

import Foundation

extension XTRequestCenter {
    @objc func xt_device() {
        let api = XTDeviceApi()
        api.xt_startRequestSuccess { _, _ in
        } failure: { _, _ in
        } error: { _ in
        }
    }
}