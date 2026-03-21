//
//  PBECertBaseWidgetMoreHeadView.swift
//  PeraBee
//
//  Created by Parme on 2024/10/7.
//

import UIKit

class PBECertBaseWidgetMoreHeadView: UIView {
    
    var clickBalcik:PERDefaultBlock?

    var headData:JSON = JSON()
    
    required init(headData: JSON) {
        self.headData = headData
        super.init(frame: CGRect(x: 0, y: 0, width: Wids, height: 92))
        aseWidgetMor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func aseWidgetMor(){
        self.backgroundColor = .clear
        
        let tiaasb = UILabel()
        tiaasb.text = headData["rxpUmbJqj"].stringValue
        tiaasb.font = PBEEMPLUS2m(14)
        tiaasb.textAlignment = .center
        tiaasb.textColor = UIColor(red: 0, green: 191/255.0, blue: 131/255.0, alpha: 1.0)
        addSubview(tiaasb)
        tiaasb.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(12)
            make.height.equalTo(20)
        }
        
        let optionalB = UIButton(type: .custom)
        optionalB.addTarget(self, action: #selector(optionalCLick), for: .touchUpInside)
        optionalB.setImage(UIImage(named: "cert_more"), for: .normal)
        addSubview(optionalB)
        optionalB.snp.makeConstraints { make in
            make.right.equalTo(-12)
            make.top.equalTo(tiaasb.snp.bottom).offset(10)
            make.size.equalTo(CGSize(width: 58, height: 32))
        }
        
        let fialleb = UILabel()
        fialleb.text = headData["sub_title"].stringValue
        fialleb.font = PBEE_PR(12)
        fialleb.textColor = UIColor(red: 51.0/255.0, green: 51.0/255.0, blue: 51.0/255.0, alpha: 1.0)
        addSubview(fialleb)
        fialleb.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.centerY.equalTo(optionalB)
            make.right.equalTo(optionalB.snp.left).offset(-4)
            make.height.equalTo(20)
        }
        
        let liadav = UIView()
        liadav.backgroundColor = UIColor(red: 187/255.0, green: 187/255.0, blue: 187/255.0, alpha: 1.0)
        addSubview(liadav)
        liadav.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(12)
            make.top.equalTo(optionalB.snp.bottom).offset(8)
            make.height.equalTo(1)
        }
        
    }
    
    @objc func optionalCLick(){
        clickBalcik?()
    }

}
