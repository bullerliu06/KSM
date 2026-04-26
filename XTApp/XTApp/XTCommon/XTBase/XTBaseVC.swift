//
//  XTBaseVC.swift
//  XTApp
//
//  Created by Codex on 2026/4/26.
//

import UIKit

private let xtBaseNavBarHeight: CGFloat = UIDevice.current.userInterfaceIdiom == .phone ? 44.0 : 50.0

private var xtBaseStatusBarHeight: CGFloat {
    UIApplication.shared.statusBarFrame.size.height
}

private var xtBaseNavHeight: CGFloat {
    xtBaseStatusBarHeight + xtBaseNavBarHeight
}

private func xtBaseColor(_ rgbValue: Int, alpha: CGFloat) -> UIColor {
    UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: alpha
    )
}

@objcMembers
@objc(XTBaseVC)
class XTBaseVC: UIViewController {
    dynamic lazy var xt_navView: UIView = {
        let navView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: xtBaseNavHeight))
        navView.backgroundColor = xtBaseColor(0x0BB559, alpha: 1.0)
        return navView
    }()

    dynamic lazy var xt_bkBtn: UIButton = {
        let btn = UIButton(type: .custom)
        let img = UIImageView(image: UIImage(named: "xt_nav_back_w"))
        img.translatesAutoresizingMaskIntoConstraints = false
        btn.addSubview(img)
        xt_bk_img = img
        NSLayoutConstraint.activate([
            img.leftAnchor.constraint(equalTo: btn.leftAnchor, constant: 16),
            img.centerYAnchor.constraint(equalTo: btn.centerYAnchor)
        ])
        btn.addTarget(self, action: #selector(xt_back), for: .touchUpInside)
        return btn
    }()

    dynamic var xt_title: String? {
        didSet {
            xt_titLab.text = xt_title
        }
    }

    dynamic var xt_title_color: UIColor? {
        didSet {
            xt_titLab.textColor = xt_title_color
        }
    }

    dynamic var xt_backType: XT_BackType = XT_BackType_W {
        didSet {
            if xt_backType == XT_BackType_B {
                xt_bk_img?.image = UIImage(named: "xt_nav_back_b")
            }
        }
    }

    private lazy var xt_titLab: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = ""
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()

    private weak var xt_bk_img: UIImageView?

    deinit {
        NSLog("dealloc:%@", NSStringFromClass(type(of: self)))
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let hiddenClasses = ["XTHtmlVC", "XTLoginCodeVC", "XTLoginVC"]
        let shouldHide = hiddenClasses.contains { className in
            guard let targetClass = NSClassFromString(className) else { return false }
            return isKind(of: targetClass)
        }
        XTAssistiveView.xt_share().isHidden = shouldHide
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        view.addSubview(xt_navView)
        xt_navView.addSubview(xt_bkBtn)
        xt_bkBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            xt_bkBtn.leftAnchor.constraint(equalTo: xt_navView.leftAnchor),
            xt_bkBtn.bottomAnchor.constraint(equalTo: xt_navView.bottomAnchor),
            xt_bkBtn.widthAnchor.constraint(equalToConstant: 60),
            xt_bkBtn.heightAnchor.constraint(equalToConstant: xtBaseNavBarHeight)
        ])

        xt_navView.addSubview(xt_titLab)
        xt_titLab.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            xt_titLab.centerYAnchor.constraint(equalTo: xt_bkBtn.centerYAnchor),
            xt_titLab.centerXAnchor.constraint(equalTo: xt_navView.centerXAnchor)
        ])
    }

    @objc func xt_back() {
        if navigationController?.popViewController(animated: true) == nil {
            navigationController?.dismiss(animated: true)
        }
    }
}
