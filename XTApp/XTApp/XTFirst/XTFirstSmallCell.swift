//
//  XTFirstSmallCell.swift
//  XTApp
//
//  Created by Codex on 2026/4/30.
//

import SDWebImage
import TYCyclePagerView
import UIKit

@objcMembers
@objc(XTSmallCell)
class XTSmallCell: XTCell, XTMarqueeViewDelegate, TYCyclePagerViewDataSource, TYCyclePagerViewDelegate {
    dynamic var nextBlock: XTBlock?
    private var small: CardModel?
    private let contentImg = UIImageView()
    private let nameLab = UILabel()
    private let img = UIImageView()
    private let priceLab = UILabel()
    private let descLab = UILabel()
    private let rightImg = UIImageView()
    private let submitBtn = UIButton.xt_btn("", font: XT_Font_M(20), textColor: .black, cornerRadius: 24, tag: 0)
    private let lanternView = UIView()
    private let marqueeView = XTMarqueeView(frame: CGRect(x: 40, y: 0, width: xtFirstLanternW, height: xtFirstLanternH))
    private var lanternArray: [LanternModel] = []
    private let bannerView = UIView()
    private let banner = TYCyclePagerView(frame: CGRect(x: 15, y: 0, width: XT_Screen_Width - 30, height: 115))
    private var bannerList: [BannerModel] = []

    override var xt_data: Any? {
        didSet {
            guard let model = xt_data as? IndexModel, let small = model.small else { return }
            self.small = small
            nameLab.text = small.productName
            img.sd_setImage(with: URL(string: small.logo ?? ""), placeholderImage: XT_Img("xt_img_def"))
            priceLab.text = small.amountText
            descLab.text = small.descriptionText
            rightImg.sd_setImage(with: URL(string: small.badgeImageURL ?? ""))
            submitBtn.setTitle(small.buttonText, for: .normal)
            submitBtn.backgroundColor = xtFirstHexColor(small.actionColorHex)

            lanternArray = model.lanternArr ?? []
            lanternView.isHidden = lanternArray.isEmpty
            marqueeView.reloadData()
            if !lanternArray.isEmpty {
                marqueeView.start()
            }

            bannerList = model.bannerArr ?? []
            bannerView.isHidden = bannerList.isEmpty
            banner.autoScrollInterval = bannerList.count > 1 ? 3 : 0
            banner.reloadData()
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
        let bg = UIImageView(image: XT_Img("xt_first_small_bg"))
        bg.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(bg)
        let top = UIImageView(image: XT_Img("xt_first_top_bg"))
        top.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(top)
        contentImg.image = XT_Img("xt_first_top_content_small_bg")?.stretchableImage(withLeftCapWidth: 30, topCapHeight: 0)
        contentImg.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(contentImg)
        let tag = UIImageView(image: XT_Img("xt_first_tag"))
        tag.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(tag)

        [nameLab, img, priceLab, descLab, rightImg, submitBtn, lanternView, bannerView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        nameLab.font = XT_Font(13)
        nameLab.textColor = XT_RGB(0x797979, 1.0)
        img.clipsToBounds = true
        img.contentMode = .scaleAspectFill
        priceLab.font = XT_Font_B(40)
        descLab.font = XT_Font_M(9)
        descLab.textColor = XT_RGB(0x3B3B3B, 1.0)
        submitBtn.addTarget(self, action: #selector(submitTap), for: .touchUpInside)

        lanternView.backgroundColor = XT_RGB(0x0BB559, 1.0)
        lanternView.layer.cornerRadius = 14
        let lanternIcon = UIImageView(image: XT_Img("xt_first_lantern_icon"))
        lanternIcon.translatesAutoresizingMaskIntoConstraints = false
        lanternView.addSubview(lanternIcon)
        marqueeView.backgroundColor = .clear
        marqueeView.delegate = self
        marqueeView.timeIntervalPerScroll = 2
        marqueeView.timeDurationPerScroll = 1
        lanternView.addSubview(marqueeView)

        banner.isInfiniteLoop = false
        banner.dataSource = self
        banner.delegate = self
        banner.register(XTBannerChildCell.self, forCellWithReuseIdentifier: "XTBannerChildCell")
        bannerView.addSubview(banner)

        xtFirstActivate([
            bg.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            bg.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            bg.topAnchor.constraint(equalTo: contentView.topAnchor),
            bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            top.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            top.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentImg.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 14),
            contentImg.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -14),
            contentImg.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 128),
            contentImg.heightAnchor.constraint(equalToConstant: 182),
            tag.rightAnchor.constraint(equalTo: contentImg.rightAnchor, constant: -16),
            tag.topAnchor.constraint(equalTo: contentImg.topAnchor, constant: 10),

            nameLab.leftAnchor.constraint(equalTo: contentImg.leftAnchor, constant: 16),
            nameLab.topAnchor.constraint(equalTo: contentImg.topAnchor, constant: 12),
            nameLab.heightAnchor.constraint(equalToConstant: 17),
            img.leftAnchor.constraint(equalTo: contentImg.leftAnchor, constant: 66),
            img.topAnchor.constraint(equalTo: contentImg.topAnchor, constant: 48),
            img.widthAnchor.constraint(equalToConstant: 56),
            img.heightAnchor.constraint(equalToConstant: 56),
            priceLab.leftAnchor.constraint(equalTo: img.rightAnchor, constant: 19),
            priceLab.rightAnchor.constraint(equalTo: contentImg.rightAnchor, constant: -10),
            priceLab.topAnchor.constraint(equalTo: contentImg.topAnchor, constant: 26),
            priceLab.heightAnchor.constraint(equalToConstant: 76),
            descLab.leftAnchor.constraint(equalTo: priceLab.leftAnchor),
            descLab.rightAnchor.constraint(equalTo: contentImg.rightAnchor, constant: -10),
            descLab.bottomAnchor.constraint(equalTo: priceLab.bottomAnchor),
            descLab.heightAnchor.constraint(equalToConstant: 10),
            rightImg.rightAnchor.constraint(equalTo: contentImg.rightAnchor, constant: -15),
            rightImg.topAnchor.constraint(equalTo: contentImg.topAnchor, constant: 10),
            rightImg.heightAnchor.constraint(equalToConstant: 21),
            submitBtn.leftAnchor.constraint(equalTo: contentImg.leftAnchor, constant: 25),
            submitBtn.rightAnchor.constraint(equalTo: contentImg.rightAnchor, constant: -25),
            submitBtn.topAnchor.constraint(equalTo: contentImg.topAnchor, constant: 117),
            submitBtn.heightAnchor.constraint(equalToConstant: 48),

            lanternView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            lanternView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
            lanternView.topAnchor.constraint(equalTo: contentImg.bottomAnchor, constant: 12),
            lanternView.heightAnchor.constraint(equalToConstant: 28),
            lanternIcon.leftAnchor.constraint(equalTo: lanternView.leftAnchor, constant: 13),
            lanternIcon.centerYAnchor.constraint(equalTo: lanternView.centerYAnchor),

            bannerView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            bannerView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            bannerView.topAnchor.constraint(equalTo: lanternView.bottomAnchor, constant: 12),
            bannerView.heightAnchor.constraint(equalToConstant: 115)
        ])
    }

    @objc private func submitTap() {
        guard small?.isActionEnabled == true else { return }
        nextBlock?()
    }

    func numberOfVisibleItems(for marqueeView: XTMarqueeView) -> UInt {
        1
    }

    func numberOfData(for marqueeView: XTMarqueeView) -> UInt {
        UInt(lanternArray.count)
    }

    func createItemView(_ itemView: UIView, for marqueeView: XTMarqueeView) {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: xtFirstLanternW, height: xtFirstLanternH))
        label.font = XT_Font_M(13)
        label.numberOfLines = 2
        label.textAlignment = .left
        label.tag = xtFirstLanternLabelTag
        itemView.addSubview(label)
    }

    func updateItemView(_ itemView: UIView, at index: UInt, for marqueeView: XTMarqueeView) {
        guard Int(index) < lanternArray.count,
              let label = itemView.viewWithTag(xtFirstLanternLabelTag) as? UILabel else { return }
        let model = lanternArray[Int(index)]
        label.textColor = xtFirstHexColor(model.textColorHex, fallback: .white)
        label.text = model.text
    }

    func itemViewHeight(at index: UInt, for marqueeView: XTMarqueeView) -> CGFloat {
        xtFirstLanternH
    }

    func itemViewWidth(at index: UInt, for marqueeView: XTMarqueeView) -> CGFloat {
        xtFirstLanternW
    }

    func layout(for pageView: TYCyclePagerView) -> TYCyclePagerViewLayout {
        let layout = TYCyclePagerViewLayout()
        layout.itemSize = CGSize(width: banner.width, height: banner.height)
        layout.itemSpacing = 10
        layout.itemHorizontalCenter = true
        return layout
    }

    func numberOfItems(in pageView: TYCyclePagerView) -> Int {
        bannerList.count
    }

    func pagerView(_ pagerView: TYCyclePagerView, cellForItemAt index: Int) -> UICollectionViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "XTBannerChildCell", for: index) as? XTBannerChildCell
            ?? XTBannerChildCell()
        cell.model = bannerList[index]
        return cell
    }

    func pagerView(_ pageView: TYCyclePagerView, didSelectedItemCell cell: UICollectionViewCell, at index: Int) {
        XTRoute.xt_share().goHtml(bannerList[index].routeURL ?? "", success: nil)
    }
}