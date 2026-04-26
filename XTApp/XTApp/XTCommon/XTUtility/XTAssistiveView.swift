//
//  XTAssistiveView.swift
//  XTApp
//
//  Created by Codex on 2026/4/26.
//

import SDWebImage
import UIKit

private let xtAssistiveViewW: CGFloat = 48
private let xtAssistiveViewH: CGFloat = 48
private let xtAssistiveSpace: CGFloat = 10

private var xtAssistiveMinY: CGFloat {
    UIApplication.shared.statusBarFrame.size.height
}

private var xtAssistiveBottomHeight: CGFloat {
    UIApplication.shared.windows.first { $0.isKeyWindow }?.safeAreaInsets.bottom ?? 0
}

@objcMembers
@objc(XTAssistiveView)
class XTAssistiveView: UIView {
    private static let shared = XTAssistiveView(frame: CGRect(
        x: UIScreen.main.bounds.width - xtAssistiveViewW - xtAssistiveSpace,
        y: xtAssistiveMinY,
        width: xtAssistiveViewW,
        height: xtAssistiveViewH
    ))

    private var touchY: CGFloat = 0
    private var touchX: CGFloat = 0
    private var url: String?

    private lazy var img: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()

    @objc class func xt_share() -> XTAssistiveView {
        shared
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        xt_setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        xt_setup()
    }

    private func xt_setup() {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(reloadLocation(_:)))
        addGestureRecognizer(pan)
        backgroundColor = .clear

        let btn = UIButton(type: .custom)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(openRoute), for: .touchUpInside)
        addSubview(btn)
        NSLayoutConstraint.activate([
            btn.leftAnchor.constraint(equalTo: leftAnchor),
            btn.rightAnchor.constraint(equalTo: rightAnchor),
            btn.topAnchor.constraint(equalTo: topAnchor),
            btn.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        img.translatesAutoresizingMaskIntoConstraints = false
        addSubview(img)
        NSLayoutConstraint.activate([
            img.leftAnchor.constraint(equalTo: leftAnchor),
            img.rightAnchor.constraint(equalTo: rightAnchor),
            img.topAnchor.constraint(equalTo: topAnchor),
            img.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    @objc(xt_showIcon:url:)
    func xt_showIcon(_ icon: String, url: String) {
        self.url = url
        img.sd_setImage(with: URL(string: icon), placeholderImage: UIImage(named: "xt_customer_logo"))
        isHidden = false
        UIApplication.shared.windows.first { $0.isKeyWindow }?.addSubview(self)
    }

    @objc func reloadLocation(_ pan: UIPanGestureRecognizer) {
        let keyWindow = UIApplication.shared.windows.first { $0.isKeyWindow }
        let panPoint = pan.location(in: keyWindow)

        if pan.state == .began {
            let selfPoint = pan.location(in: self)
            touchY = selfPoint.y
            touchX = selfPoint.x
        } else if pan.state == .changed {
            frame = CGRect(x: panPoint.x - touchX, y: panPoint.y - touchY, width: bounds.width, height: bounds.height)
        } else if pan.state == .ended {
            let maxX = UIScreen.main.bounds.width - xtAssistiveViewW
            let maxY = UIScreen.main.bounds.height - xtAssistiveViewH - xtAssistiveBottomHeight
            let x = min(max(frame.origin.x, 0), maxX)
            let y = min(max(frame.origin.y, xtAssistiveMinY), maxY)
            if x != frame.origin.x || y != frame.origin.y {
                UIView.animate(
                    withDuration: 0.3,
                    delay: 0,
                    usingSpringWithDamping: 0.5,
                    initialSpringVelocity: 10,
                    options: .curveLinear
                ) {
                    self.frame = CGRect(x: x, y: y, width: self.bounds.width, height: self.bounds.height)
                }
            }
        }
    }

    @objc private func openRoute() {
        XTRoute.xt_share().goHtml(url ?? "", success: nil)
    }
}
