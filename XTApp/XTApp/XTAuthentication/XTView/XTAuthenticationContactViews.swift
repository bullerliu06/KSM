//
//  XTAuthenticationContactViews.swift
//  XTApp
//
//  Created by Codex on 2026/4/30.
//

import SDWebImage
import UIKit

@objcMembers
@objc(XTVerifyContactCell)
class XTVerifyContactCell: XTCell {
    weak dynamic var model: XTContactItemModel? {
        didSet { reloadModel() }
    }
    dynamic var block: XTSelectBlock?
    dynamic var contactBlock: XTSelectBlock?

    private let titleLab = UILabel()
    private let nameField = UITextField()
    private let mobileField = UITextField()
    private let relationField = UITextField()

    required init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        titleLab.font = XT_Font_SD(17)
        titleLab.textColor = .black
        titleLab.frame = CGRect(x: 14, y: 0, width: XT_Screen_Width - 28, height: 24)
        contentView.addSubview(titleLab)

        configure(field: nameField, y: 36, placeholder: "Name")
        configure(field: mobileField, y: 96, placeholder: "Mobile")
        configure(field: relationField, y: 156, placeholder: "Relationship")
        relationField.isUserInteractionEnabled = false

        let relationButton = UIButton(type: .custom)
        relationButton.frame = relationField.frame
        relationButton.addTarget(self, action: #selector(selectRelation), for: .touchUpInside)
        contentView.addSubview(relationButton)

        let contactButton = UIButton(type: .contactAdd)
        contactButton.frame = CGRect(x: XT_Screen_Width - 60, y: 36, width: 44, height: 48)
        contactButton.addTarget(self, action: #selector(selectContact), for: .touchUpInside)
        contentView.addSubview(contactButton)

        [nameField, mobileField].forEach { $0.addTarget(self, action: #selector(textChanged), for: .editingChanged) }
    }

    private func configure(field: UITextField, y: CGFloat, placeholder: String) {
        field.frame = CGRect(x: 14, y: y, width: XT_Screen_Width - 28, height: 48)
        field.placeholder = placeholder
        field.font = XT_Font(15)
        field.backgroundColor = .white
        field.layer.cornerRadius = 10
        field.layer.borderColor = XT_RGB(0xDDDDDD, 1.0).cgColor
        field.layer.borderWidth = 1
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 48))
        contentView.addSubview(field)
    }

    private func reloadModel() {
        titleLab.text = model?.xt_title
        nameField.text = model?.firstValue
        mobileField.text = model?.secondValue
        relationField.text = model?.threeName
    }

    @objc private func textChanged() {
        model?.firstValue = nameField.text
        model?.secondValue = mobileField.text
    }

    @objc private func selectRelation() {
        block? { [weak self] dic in
            self?.model?.threeName = XT_Object_To_Stirng(dic?["name"])
            self?.model?.threeValue = XT_Object_To_Stirng(dic?["value"])
            self?.relationField.text = self?.model?.threeName
        }
    }

    @objc private func selectContact() {
        contactBlock? { [weak self] dic in
            self?.model?.firstValue = XT_Object_To_Stirng(dic?["name"])
            self?.model?.secondValue = XT_Object_To_Stirng(dic?["mobile"] ?? dic?["value"])
            self?.reloadModel()
        }
    }
}

@objcMembers
@objc(XTPhotoCell)
class XTPhotoCell: XTCell {
    weak dynamic var model: XTPhotoModel? {
        didSet { reloadModel() }
    }
    dynamic var block: XTSelectBlock?
    dynamic var photoBlock: XTBlock?

    private let titleLab = UILabel()
    private let nameField = UITextField()
    private let cardImage = UIImageView()

    required init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        titleLab.font = XT_Font_SD(17)
        titleLab.textColor = .black
        titleLab.frame = CGRect(x: 14, y: 0, width: XT_Screen_Width - 28, height: 24)
        contentView.addSubview(titleLab)

        nameField.frame = CGRect(x: 14, y: 36, width: XT_Screen_Width - 28, height: 48)
        nameField.placeholder = "Please select"
        nameField.font = XT_Font(15)
        nameField.backgroundColor = .white
        nameField.layer.cornerRadius = 10
        nameField.layer.borderColor = XT_RGB(0xDDDDDD, 1.0).cgColor
        nameField.layer.borderWidth = 1
        nameField.leftViewMode = .always
        nameField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 48))
        nameField.isUserInteractionEnabled = false
        contentView.addSubview(nameField)

        let selectButton = UIButton(type: .custom)
        selectButton.frame = nameField.frame
        selectButton.addTarget(self, action: #selector(selectType), for: .touchUpInside)
        contentView.addSubview(selectButton)

        cardImage.frame = CGRect(x: 14, y: 96, width: XT_Screen_Width - 28, height: 160)
        cardImage.contentMode = .scaleAspectFit
        cardImage.clipsToBounds = true
        cardImage.layer.cornerRadius = 12
        cardImage.backgroundColor = XT_RGB(0xF8F8F8, 1.0)
        contentView.addSubview(cardImage)

        let photoButton = UIButton(type: .custom)
        photoButton.frame = cardImage.frame
        photoButton.addTarget(self, action: #selector(selectPhoto), for: .touchUpInside)
        contentView.addSubview(photoButton)
    }

    private func reloadModel() {
        titleLab.text = model?.xt_name ?? "ID Photo"
        nameField.text = model?.xt_name
        if let path = model?.path, !path.isEmpty {
            cardImage.image = UIImage(contentsOfFile: path)
        } else if let img = model?.xt_img, !img.isEmpty {
            cardImage.sd_setImage(with: URL(string: img), placeholderImage: UIImage(named: "xt_img_def"))
        } else {
            cardImage.image = UIImage(named: "xt_img_def")
        }
    }

    @objc private func selectType() {
        block? { [weak self] dic in
            self?.model?.xt_name = XT_Object_To_Stirng(dic?["name"])
            self?.model?.xt_type = XT_Object_To_Stirng(dic?["value"])
            self?.model?.xt_img = XT_Object_To_Stirng(dic?["url"])
            self?.reloadModel()
        }
    }

    @objc private func selectPhoto() {
        photoBlock?()
    }
}