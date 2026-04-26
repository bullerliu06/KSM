//
//  XTSetViews.swift
//  XTApp
//
//  Created by Codex on 2026/4/26.
//

import UIKit

private func xtSetColor(_ rgbValue: Int, alpha: CGFloat = 1.0) -> UIColor {
    UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: alpha
    )
}

private func xtSetLabel(text: String = "", font: UIFont, color: UIColor, alignment: NSTextAlignment = .left) -> UILabel {
    let label = UILabel(frame: .zero)
    label.text = text
    label.font = font
    label.textColor = color
    label.textAlignment = alignment
    return label
}

private func xtSetButton(
    title: String,
    font: UIFont,
    textColor: UIColor,
    cornerRadius: CGFloat,
    borderColor: UIColor?,
    borderWidth: CGFloat,
    backgroundColor: UIColor
) -> UIButton {
    let button = UIButton(type: .custom)
    button.setTitle(title, for: .normal)
    button.titleLabel?.font = font
    button.setTitleColor(textColor, for: .normal)
    button.backgroundColor = backgroundColor
    button.layer.cornerRadius = cornerRadius
    button.layer.borderColor = borderColor?.cgColor
    button.layer.borderWidth = borderWidth
    button.clipsToBounds = true
    return button
}

@objcMembers
@objc(XTSetCell)
class XTSetCell: XTCell {
    private let nameLab = xtSetLabel(font: .systemFont(ofSize: 15), color: xtSetColor(0x999999))
    private let contentLab = xtSetLabel(font: .systemFont(ofSize: 18, weight: .semibold), color: xtSetColor(0x333333))

    override var xt_data: Any? {
        didSet {
            guard let dic = xt_data as? [AnyHashable: Any] else { return }
            nameLab.text = dic["title"] as? String
            contentLab.text = dic["content"] as? String
        }
    }

    required init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    private func setupUI() {
        contentView.addSubview(nameLab)
        nameLab.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLab.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 40),
            nameLab.topAnchor.constraint(equalTo: contentView.topAnchor),
            nameLab.heightAnchor.constraint(equalToConstant: 21)
        ])

        contentView.addSubview(contentLab)
        contentLab.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentLab.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 40),
            contentLab.topAnchor.constraint(equalTo: nameLab.bottomAnchor, constant: 2),
            contentLab.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
}

@objcMembers
@objc(XTSetIconCell)
class XTSetIconCell: XTCell {
    required init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    private func setupUI() {
        let iconImg = UIImageView()
        iconImg.clipsToBounds = true
        iconImg.layer.cornerRadius = 10
        if let iconFiles = (((Bundle.main.infoDictionary?["CFBundleIcons"] as? [String: Any])?["CFBundlePrimaryIcon"] as? [String: Any])?["CFBundleIconFiles"] as? [String]),
           let lastIcon = iconFiles.last {
            iconImg.image = UIImage(named: lastIcon)
        }
        iconImg.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(iconImg)
        NSLayoutConstraint.activate([
            iconImg.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            iconImg.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 72),
            iconImg.widthAnchor.constraint(equalToConstant: 88),
            iconImg.heightAnchor.constraint(equalToConstant: 88)
        ])

        let appName = Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String ?? ""
        let nameLab = xtSetLabel(text: appName, font: .systemFont(ofSize: 20, weight: .semibold), color: .black, alignment: .center)
        nameLab.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameLab)
        NSLayoutConstraint.activate([
            nameLab.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            nameLab.topAnchor.constraint(equalTo: iconImg.bottomAnchor, constant: 16),
            nameLab.heightAnchor.constraint(equalToConstant: 28)
        ])
    }
}

@objcMembers
@objc(XTSetAltView)
class XTSetAltView: UIView {
    dynamic var sureBlock: XTBlock?
    dynamic var cancelBlock: XTBlock?

    @objc(initWithAlt:)
    init(alt: String) {
        super.init(frame: CGRect(x: 0, y: 0, width: 291, height: 253))
        setupUI(alt: alt)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI(alt: "")
    }

    private func setupUI(alt: String) {
        let bgImg = UIImageView(image: UIImage(named: "xt_my_set_alt_bg"))
        bgImg.translatesAutoresizingMaskIntoConstraints = false
        addSubview(bgImg)
        NSLayoutConstraint.activate([
            bgImg.leftAnchor.constraint(equalTo: leftAnchor),
            bgImg.rightAnchor.constraint(equalTo: rightAnchor),
            bgImg.topAnchor.constraint(equalTo: topAnchor),
            bgImg.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        let iconImg = UIImageView(image: UIImage(named: "xt_my_set_alt_icon"))
        iconImg.translatesAutoresizingMaskIntoConstraints = false
        addSubview(iconImg)
        NSLayoutConstraint.activate([
            iconImg.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconImg.topAnchor.constraint(equalTo: topAnchor, constant: 21)
        ])

        let altLab = xtSetLabel(text: alt, font: .systemFont(ofSize: 18), color: xtSetColor(0x3C3C3C), alignment: .center)
        altLab.numberOfLines = 2
        altLab.translatesAutoresizingMaskIntoConstraints = false
        addSubview(altLab)
        NSLayoutConstraint.activate([
            altLab.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            altLab.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
            altLab.topAnchor.constraint(equalTo: iconImg.bottomAnchor, constant: 13)
        ])

        let sureBtn = xtSetButton(
            title: "Confirm",
            font: .systemFont(ofSize: 18),
            textColor: xtSetColor(0x0BB559),
            cornerRadius: 20,
            borderColor: xtSetColor(0x0BB559),
            borderWidth: 1,
            backgroundColor: .white
        )
        sureBtn.translatesAutoresizingMaskIntoConstraints = false
        sureBtn.addTarget(self, action: #selector(tapSure), for: .touchUpInside)
        addSubview(sureBtn)
        NSLayoutConstraint.activate([
            sureBtn.leftAnchor.constraint(equalTo: leftAnchor, constant: 13),
            sureBtn.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),
            sureBtn.widthAnchor.constraint(equalToConstant: 124),
            sureBtn.heightAnchor.constraint(equalToConstant: 40)
        ])

        let cancelBtn = xtSetButton(
            title: "Cancel",
            font: .systemFont(ofSize: 18, weight: .semibold),
            textColor: .white,
            cornerRadius: 20,
            borderColor: nil,
            borderWidth: 0,
            backgroundColor: xtSetColor(0x0BB559)
        )
        cancelBtn.translatesAutoresizingMaskIntoConstraints = false
        cancelBtn.addTarget(self, action: #selector(tapCancel), for: .touchUpInside)
        addSubview(cancelBtn)
        NSLayoutConstraint.activate([
            cancelBtn.rightAnchor.constraint(equalTo: rightAnchor, constant: -13),
            cancelBtn.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),
            cancelBtn.widthAnchor.constraint(equalToConstant: 124),
            cancelBtn.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    @objc private func tapSure() {
        sureBlock?()
    }

    @objc private func tapCancel() {
        cancelBlock?()
    }
}
