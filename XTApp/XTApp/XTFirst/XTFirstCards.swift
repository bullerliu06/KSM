//
//  XTFirstCards.swift
//  XTApp
//
//  Created by Codex on 2026/4/30.
//

import SDWebImage
import UIKit
import YYText

@objcMembers
@objc(XTBigCell)
class XTBigCell: XTCell {
    dynamic var nextBlock: XTBlock?
    private var model: CardModel?
    private let nameLab = UILabel()
    private let img = UIImageView()
    private let priceLab = UILabel()
    private let descLab = UILabel()
    private let item1TitLab = UILabel()
    private let item1Lab = UILabel()
    private let item2TitLab = UILabel()
    private let item2Lab = UILabel()
    private let submitBtn = UIButton.xt_btn("", font: XT_Font_M(20), textColor: .black, cornerRadius: 24, tag: 0)
    private let altLab = YYLabel()

    override var xt_data: Any? {
        didSet {
            guard let model = xt_data as? CardModel else { return }
            self.model = model
            nameLab.text = model.productName
            img.sd_setImage(with: URL(string: model.logo ?? ""), placeholderImage: XT_Img("xt_img_def"))
            priceLab.text = model.amountText
            descLab.text = model.descriptionText
            item1TitLab.text = model.primaryMetricTitle
            item1Lab.text = model.primaryMetricValue
            item2TitLab.text = model.secondaryMetricTitle
            item2Lab.text = model.secondaryMetricValue
            submitBtn.setTitle(model.buttonText, for: .normal)
            submitBtn.backgroundColor = xtFirstHexColor(model.actionColorHex)
        }
    }

    required init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        let wrapper = UIView()
        wrapper.clipsToBounds = true
        wrapper.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(wrapper)
        wrapper.layer.addSublayer(UIView.xt_layer(
            [XT_RGB(0x0BB559, 1.0).cgColor, UIColor.white.cgColor],
            locations: [0, 1.0],
            startPoint: CGPoint(x: 0.5, y: 0),
            endPoint: CGPoint(x: 0.5, y: 0.48),
            size: CGSize(width: XT_Screen_Width, height: 420)
        ))

        let topBg = UIImageView(image: XT_Img("xt_first_top_bg"))
        topBg.translatesAutoresizingMaskIntoConstraints = false
        wrapper.addSubview(topBg)

        let contentImg = UIImageView(image: XT_Img("xt_first_top_content_bg")?.stretchableImage(withLeftCapWidth: 30, topCapHeight: 0))
        contentImg.translatesAutoresizingMaskIntoConstraints = false
        wrapper.addSubview(contentImg)

        [nameLab, img, priceLab, descLab, item1TitLab, item1Lab, item2TitLab, item2Lab, submitBtn, altLab].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            wrapper.addSubview($0)
        }

        nameLab.font = XT_Font(13)
        nameLab.textColor = XT_RGB(0x797979, 1.0)
        img.clipsToBounds = true
        img.contentMode = .scaleAspectFill
        priceLab.font = XT_Font_B(40)
        priceLab.textColor = .black
        descLab.font = XT_Font_M(9)
        descLab.textColor = XT_RGB(0x3B3B3B, 1.0)
        [item1TitLab, item2TitLab].forEach {
            $0.font = XT_Font_M(9)
            $0.textColor = XT_RGB(0xAEAEAE, 1.0)
            $0.textAlignment = .center
        }
        [item1Lab, item2Lab].forEach {
            $0.font = XT_Font_SD(14)
            $0.textColor = XT_RGB(0x0BB559, 1.0)
            $0.textAlignment = .center
        }
        submitBtn.addTarget(self, action: #selector(submitTap), for: .touchUpInside)
        setupPrivacyText()

        let line = UIView()
        line.backgroundColor = XT_RGB(0x979797, 1.0)
        line.translatesAutoresizingMaskIntoConstraints = false
        wrapper.addSubview(line)

        xtFirstActivate([
            wrapper.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            wrapper.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            wrapper.topAnchor.constraint(equalTo: contentView.topAnchor),
            wrapper.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            topBg.centerXAnchor.constraint(equalTo: wrapper.centerXAnchor),
            topBg.topAnchor.constraint(equalTo: wrapper.topAnchor, constant: 15),

            contentImg.leftAnchor.constraint(equalTo: wrapper.leftAnchor, constant: 14),
            contentImg.rightAnchor.constraint(equalTo: wrapper.rightAnchor, constant: -14),
            contentImg.bottomAnchor.constraint(equalTo: wrapper.bottomAnchor),
            contentImg.heightAnchor.constraint(equalToConstant: 277),

            nameLab.leftAnchor.constraint(equalTo: contentImg.leftAnchor, constant: 20),
            nameLab.topAnchor.constraint(equalTo: contentImg.topAnchor, constant: 15),
            nameLab.heightAnchor.constraint(equalToConstant: 17),

            img.leftAnchor.constraint(equalTo: contentImg.leftAnchor, constant: 60),
            img.topAnchor.constraint(equalTo: contentImg.topAnchor, constant: 52),
            img.widthAnchor.constraint(equalToConstant: 56),
            img.heightAnchor.constraint(equalToConstant: 56),

            priceLab.leftAnchor.constraint(equalTo: img.rightAnchor, constant: 19),
            priceLab.rightAnchor.constraint(equalTo: contentImg.rightAnchor, constant: -10),
            priceLab.topAnchor.constraint(equalTo: contentImg.topAnchor, constant: 30),
            priceLab.heightAnchor.constraint(equalToConstant: 76),

            descLab.leftAnchor.constraint(equalTo: priceLab.leftAnchor),
            descLab.rightAnchor.constraint(equalTo: contentImg.rightAnchor, constant: -10),
            descLab.bottomAnchor.constraint(equalTo: priceLab.bottomAnchor),
            descLab.heightAnchor.constraint(equalToConstant: 10),

            line.centerXAnchor.constraint(equalTo: wrapper.centerXAnchor),
            line.topAnchor.constraint(equalTo: img.bottomAnchor, constant: 24),
            line.widthAnchor.constraint(equalToConstant: 1),
            line.heightAnchor.constraint(equalToConstant: 34),

            item1TitLab.leftAnchor.constraint(equalTo: wrapper.leftAnchor),
            item1TitLab.rightAnchor.constraint(equalTo: line.leftAnchor),
            item1TitLab.topAnchor.constraint(equalTo: img.bottomAnchor, constant: 24),
            item1TitLab.heightAnchor.constraint(equalToConstant: 13),
            item1Lab.leftAnchor.constraint(equalTo: wrapper.leftAnchor),
            item1Lab.rightAnchor.constraint(equalTo: line.leftAnchor),
            item1Lab.topAnchor.constraint(equalTo: item1TitLab.bottomAnchor, constant: 5),
            item1Lab.heightAnchor.constraint(equalToConstant: 20),

            item2TitLab.leftAnchor.constraint(equalTo: line.rightAnchor),
            item2TitLab.rightAnchor.constraint(equalTo: wrapper.rightAnchor),
            item2TitLab.topAnchor.constraint(equalTo: img.bottomAnchor, constant: 24),
            item2TitLab.heightAnchor.constraint(equalToConstant: 13),
            item2Lab.leftAnchor.constraint(equalTo: line.rightAnchor),
            item2Lab.rightAnchor.constraint(equalTo: wrapper.rightAnchor),
            item2Lab.topAnchor.constraint(equalTo: item2TitLab.bottomAnchor, constant: 5),
            item2Lab.heightAnchor.constraint(equalToConstant: 20),

            submitBtn.leftAnchor.constraint(equalTo: wrapper.leftAnchor, constant: 25),
            submitBtn.rightAnchor.constraint(equalTo: wrapper.rightAnchor, constant: -25),
            submitBtn.topAnchor.constraint(equalTo: line.bottomAnchor, constant: 17),
            submitBtn.heightAnchor.constraint(equalToConstant: 48),

            altLab.centerXAnchor.constraint(equalTo: wrapper.centerXAnchor),
            altLab.topAnchor.constraint(equalTo: submitBtn.bottomAnchor, constant: 12),
            altLab.heightAnchor.constraint(equalToConstant: 17)
        ])
    }

    private func setupPrivacyText() {
        let text = NSMutableAttributedString()
        text.append(NSAttributedString(string: "Click to view the", attributes: [.font: XT_Font_M(12), .foregroundColor: UIColor.black]))
        let privacy = "Privacy Agreement"
        text.append(NSAttributedString(string: privacy, attributes: [.font: XT_Font_M(12), .foregroundColor: XT_RGB(0x02CC56, 1.0), .underlineStyle: NSUnderlineStyle.single.rawValue]))
        text.yy_setTextHighlight(NSRange(location: text.length - privacy.count, length: privacy.count), color: XT_RGB(0x02CC56, 1.0), backgroundColor: .clear) { _, _, _, _ in
            XTRoute.xt_share().goHtml(XT_Privacy_Url, success: nil)
        }
        altLab.attributedText = text
    }

    @objc private func submitTap() {
        guard model?.isActionEnabled == true else { return }
        nextBlock?()
    }
}

@objcMembers
@objc(XTProductCell)
class XTProductCell: XTCell {
    dynamic var nextBlock: XTBlock?
    private var model: ProductModel?
    private let iconImg = UIImageView()
    private let priceLab = UILabel()
    private let nameLab = UILabel()
    private let descLab = UILabel()
    private let submitBtn = UIButton.xt_btn("", font: XT_Font_M(12), textColor: .black, cornerRadius: 14, tag: 0)

    override var xt_data: Any? {
        didSet {
            guard let model = xt_data as? ProductModel else { return }
            self.model = model
            iconImg.sd_setImage(with: URL(string: model.logo ?? ""))
            nameLab.text = model.productName
            priceLab.text = model.amountText
            descLab.text = model.descriptionText
            submitBtn.setTitle(model.buttonText, for: .normal)
            submitBtn.backgroundColor = xtFirstHexColor(model.actionColorHex)
        }
    }

    required init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        let container = UIView()
        container.backgroundColor = .white
        container.layer.cornerRadius = 16
        container.layer.shadowColor = UIColor(red: 193 / 255.0, green: 193 / 255.0, blue: 193 / 255.0, alpha: 0.46).cgColor
        container.layer.shadowOffset = CGSize(width: 0, height: 2)
        container.layer.shadowOpacity = 1
        container.layer.shadowRadius = 8
        container.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(container)

        [iconImg, priceLab, nameLab, descLab, submitBtn].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            container.addSubview($0)
        }
        iconImg.clipsToBounds = true
        iconImg.contentMode = .scaleAspectFill
        nameLab.font = XT_Font_SD(16)
        nameLab.textColor = XT_RGB(0x333333, 1.0)
        priceLab.font = XT_Font_B(16)
        priceLab.textAlignment = .right
        descLab.font = XT_Font_SD(11)
        descLab.textColor = XT_RGB(0x9C9C9C, 1.0)
        submitBtn.addTarget(self, action: #selector(submitTap), for: .touchUpInside)

        let line = UIImageView(image: XT_Img("xt_img_line"))
        line.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(line)
        let itemBg = UIImageView(image: XT_Img("xt_first_item_bg"))
        itemBg.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(itemBg)
        addSmallInfo(to: itemBg, icon: "xt_first_item_icon_1", text: "Recommended products with low interest rates", color: XT_RGB(0x0FB158, 1.0), top: 2)
        addSmallInfo(to: itemBg, icon: "xt_first_item_icon_2", text: "Products recommended by many people", color: XT_RGB(0xFFA93B, 1.0), top: 20)

        xtFirstActivate([
            container.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            container.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
            container.topAnchor.constraint(equalTo: contentView.topAnchor),
            container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            iconImg.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 10),
            iconImg.topAnchor.constraint(equalTo: container.topAnchor, constant: 14),
            iconImg.widthAnchor.constraint(equalToConstant: 36),
            iconImg.heightAnchor.constraint(equalToConstant: 36),
            priceLab.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -17),
            priceLab.topAnchor.constraint(equalTo: container.topAnchor, constant: 18),
            priceLab.heightAnchor.constraint(equalToConstant: 28),
            nameLab.leftAnchor.constraint(equalTo: iconImg.rightAnchor, constant: 7),
            nameLab.rightAnchor.constraint(equalTo: priceLab.leftAnchor, constant: -5),
            nameLab.topAnchor.constraint(equalTo: container.topAnchor, constant: 11),
            nameLab.heightAnchor.constraint(equalToConstant: 22),
            descLab.leftAnchor.constraint(equalTo: iconImg.rightAnchor, constant: 7),
            descLab.rightAnchor.constraint(equalTo: priceLab.leftAnchor, constant: -5),
            descLab.topAnchor.constraint(equalTo: nameLab.bottomAnchor, constant: 2),
            descLab.heightAnchor.constraint(equalToConstant: 16),
            line.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 10),
            line.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -10),
            line.topAnchor.constraint(equalTo: iconImg.bottomAnchor, constant: 7),
            line.heightAnchor.constraint(equalToConstant: 1),
            itemBg.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 10),
            itemBg.topAnchor.constraint(equalTo: line.bottomAnchor, constant: 10),
            itemBg.widthAnchor.constraint(equalToConstant: 210),
            itemBg.heightAnchor.constraint(equalToConstant: 39),
            submitBtn.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -15),
            submitBtn.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -15),
            submitBtn.widthAnchor.constraint(equalToConstant: 88),
            submitBtn.heightAnchor.constraint(equalToConstant: 28)
        ])
    }

    private func addSmallInfo(to parent: UIView, icon: String, text: String, color: UIColor, top: CGFloat) {
        let image = UIImageView(image: XT_Img(icon))
        image.translatesAutoresizingMaskIntoConstraints = false
        parent.addSubview(image)
        let label = UILabel()
        label.text = text
        label.font = XT_Font(8)
        label.textColor = color
        label.translatesAutoresizingMaskIntoConstraints = false
        parent.addSubview(label)
        xtFirstActivate([
            image.leftAnchor.constraint(equalTo: parent.leftAnchor, constant: 7),
            image.topAnchor.constraint(equalTo: parent.topAnchor, constant: top),
            label.leftAnchor.constraint(equalTo: image.rightAnchor, constant: 6),
            label.centerYAnchor.constraint(equalTo: image.centerYAnchor)
        ])
    }

    @objc private func submitTap() {
        guard model?.isActionEnabled == true else { return }
        nextBlock?()
    }
}