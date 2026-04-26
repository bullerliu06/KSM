//
//  XTCodeAltView.swift
//  XTApp
//
//  Created by Codex on 2026/4/26.
//

import UIKit

@objcMembers
@objc(XTCodeAltView)
class XTCodeAltView: UIView {
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 290, height: 213))
        let img = UIImageView(image: UIImage(named: "xt_login_code_alt"))
        img.translatesAutoresizingMaskIntoConstraints = false
        addSubview(img)
        NSLayoutConstraint.activate([
            img.leftAnchor.constraint(equalTo: leftAnchor),
            img.rightAnchor.constraint(equalTo: rightAnchor),
            img.topAnchor.constraint(equalTo: topAnchor),
            img.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
