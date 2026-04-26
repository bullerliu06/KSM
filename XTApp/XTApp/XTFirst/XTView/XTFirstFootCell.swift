//
//  XTFirstFootCell.swift
//  XTApp
//
//  Created by Codex on 2026/4/26.
//

import UIKit

@objcMembers
@objc(XTFirstFootCell)
class XTFirstFootCell: XTCell {
    required init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupImage()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupImage()
    }

    private func setupImage() {
        let img = UIImageView(image: UIImage(named: "xt_first_foot_bg"))
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(img)
        NSLayoutConstraint.activate([
            img.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            img.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            img.topAnchor.constraint(equalTo: contentView.topAnchor),
            img.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
