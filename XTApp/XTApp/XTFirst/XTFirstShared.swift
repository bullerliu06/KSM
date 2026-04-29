//
//  XTFirstShared.swift
//  XTApp
//
//  Created by Codex on 2026/4/30.
//

import UIKit

let xtFirstLanternLabelTag = 10001
let xtFirstLanternH: CGFloat = 28
var xtFirstLanternW: CGFloat { XT_Screen_Width - 55 - 33 }

func xtFirstActivate(_ constraints: [NSLayoutConstraint]) {
    NSLayoutConstraint.activate(constraints)
}

func xtFirstHexColor(_ text: String?, fallback: UIColor = XT_RGB(0x02CC56, 1.0)) -> UIColor {
    guard let text, let color = (text as NSString).xt_hexColor() else { return fallback }
    return color
}