//
//  PERABEEWebViewVCNarBar.swift
//  PeraBee
//
//  Created by Cris on 2024/10/8.
//

import UIKit

class PERABEEWebViewVCNarBar: UIView {

    
    override init(frame: CGRect) {
        super.init(frame:frame)
        setPERABEEWebViewVCNarBarUI()
    }
    lazy var comellBut = lazyLeftBtn()
    lazy var letLabTips = lazyTitleLabel()
    var bbGoReturns :PERDefaultBlock?
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setPERABEEWebViewVCNarBarUI(){
        addSubview(self.comellBut)
        addSubview(self.letLabTips)
        letLabTips.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(SafeTop)
            make.height.equalTo(44)
        }
    }
    
    @objc func leftBtnAction() {
        if (bbGoReturns != nil) {
            bbGoReturns!()
        }
    }
    
    func lazyLeftBtn() -> UIButton {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "cert_back"), for: .normal)
        btn.frame = CGRect(x: 0, y: SafeTop, width: 44, height: 44)
        btn.addTarget(self, action: #selector(leftBtnAction), for: .touchUpInside)
        addSubview(btn)
        return btn
    }
    
    func lazyTitleLabel() -> UILabel {
        let title = UILabel()
        title.textAlignment = .left
        title.textColor = .black
        title.font = PBEEMPLUS2m(16)
        addSubview(title)
        return title
    }
}
