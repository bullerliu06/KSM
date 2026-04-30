//
//  XTRequestCenter.swift
//  XTApp
//
//  Created by Codex on 2026/4/26.
//

import Foundation

@objcMembers
@objc(XTRequestCenter)
class XTRequestCenter: NSObject {
    private static let shared = XTRequestCenter()

    @objc class func xt_share() -> XTRequestCenter {
        shared
    }
}
