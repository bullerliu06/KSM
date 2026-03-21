//
//  PERABEEMianProductItemCell.swift
//  PeraBee
//
//  Created by Cris on 2024/10/6.
//

import UIKit

class PERABEEMianProductItemCell: UITableViewCell {

    var applyClickBlock: PERStringBlock?
    var jsonModel: JSON = JSON()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        setPERABEEMianProductItemCellUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setPERABEEMianProductItemCellUI(){
        contentView.addSubview(backView)
        backView.snp.makeConstraints { make in
            make.top.equalTo(0)
            make.left.equalTo(12)
            make.right.equalTo(-12)
            make.height.equalTo(124)
        }
        
        backView.addSubview(middeView)
        middeView.snp.makeConstraints { make in
            make.top.equalTo(6)
            make.bottom.equalTo(-6)
            make.left.equalTo(8)
            make.right.equalTo(-8)
        }
        
        middeView.addSubview(rxpReturnedJqjImgeView)
        rxpReturnedJqjImgeView.snp.makeConstraints { make in
            make.left.equalTo(12)
            make.top.equalTo(8)
            make.width.height.equalTo(28)
        }
        
        middeView.addSubview(rxpGefuffleJqjLabel)
        rxpGefuffleJqjLabel.snp.makeConstraints { make in
            make.centerY.equalTo(rxpReturnedJqjImgeView.snp.centerY)
            make.left.equalTo(rxpReturnedJqjImgeView.snp.right).offset(4)
            make.height.equalTo(14)
        }
        
        middeView.addSubview(applyBtn)
        applyBtn.snp.makeConstraints { make in
            make.right.equalTo(-10)
            make.centerY.equalTo(rxpReturnedJqjImgeView.snp.centerY)
            make.size.equalTo(CGSize(width: 87, height: 30))
        }
        
        let lineimageView = UIImageView(image: UIImage(named: "Mian_ProductItem_linegreen"))
        middeView.addSubview(lineimageView)
        lineimageView.snp.makeConstraints { make in
            make.top.equalTo(rxpReturnedJqjImgeView.snp.bottom).offset(6)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(1)
        }
        
        middeView.addSubview(rxpScotographJqjLabel)
        rxpScotographJqjLabel.snp.makeConstraints { make in
            make.left.equalTo(12)
            make.top.equalTo(rxpReturnedJqjImgeView.snp.bottom).offset(10)
            make.height.equalTo(34)
        }
        
        middeView.addSubview(rxpIntegrabelJqjLabel)
        rxpIntegrabelJqjLabel.snp.makeConstraints { make in
            make.top.equalTo(rxpScotographJqjLabel.snp.bottom).offset(6)
            make.leading.equalTo(rxpScotographJqjLabel.snp.leading)
            make.height.equalTo(14)
        }
        
       
       
        
        let tipLabel = UILabel()
        tipLabel.text = "The more the amount used"
        tipLabel.font = UIFont.boldSystemFont(ofSize: 12)
        tipLabel.textColor = hex("#666666")
        tipLabel.textAlignment = .right
        middeView.addSubview(tipLabel)
        tipLabel.snp.makeConstraints { make in
            make.top.equalTo(applyBtn.snp.bottom).offset(24)
            make.right.equalTo(-20)
            make.height.equalTo(14)
        }
        
        
        let tipLabelTwo = UILabel()
        tipLabelTwo.text = "The higher the interest rate"
        tipLabelTwo.font = UIFont.boldSystemFont(ofSize: 12)
        tipLabelTwo.textColor = hex("#666666")
        tipLabelTwo.textAlignment = .right
        middeView.addSubview(tipLabelTwo)
        tipLabelTwo.snp.makeConstraints { make in
            make.leading.equalTo(tipLabel.snp.leading)
            make.top.equalTo(tipLabel.snp.bottom).offset(2)
            make.right.equalTo(-18)
            make.height.equalTo(14)
        }
    }
    
    func updataPERABEEMianProductItemCellUI(jsonModel:JSON){
        self.jsonModel = jsonModel
        rxpReturnedJqjImgeView.kf.setImage(with: URL(string: jsonModel["rxpReturnedJqj"].stringValue))
        rxpGefuffleJqjLabel.text = jsonModel["rxpGefuffleJqj"].stringValue
        applyBtn.backgroundColor = hex(jsonModel["rxpPyaJqj"].stringValue)
        applyBtn.setTitle(jsonModel["rxpHippiedomJqj"].stringValue, for: .normal)
        
        rxpScotographJqjLabel.text = jsonModel["rxpScotographJqj"].stringValue
        rxpIntegrabelJqjLabel.text = jsonModel["rxpIntegrabelJqj"].stringValue
    }
    
    
    @objc func applyBtnClick(){
        
        if let applyClickBlock = applyClickBlock{
            applyClickBlock(self.jsonModel["rxpGalvanoscopicJqj"].stringValue)
        }
    }
    
    //MARK: - lazy
    lazy var backView: UIView = {
        let backView = UIView()
        backView.backgroundColor = hex("#00BD82")
        backView.layer.cornerRadius = 16
        backView.clipsToBounds = true
        backView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(applyBtnClick))
        backView.addGestureRecognizer(tapGesture)
        return backView
    }()
    
    lazy var middeView: UIView = {
        let middeView = UIView()
        middeView.backgroundColor = hex("#EFFEFF")
        middeView.layer.cornerRadius = 12
        middeView.clipsToBounds = true
        middeView.isUserInteractionEnabled = true
        return middeView
    }()
    
    lazy var  rxpReturnedJqjImgeView : UIImageView = {//产品logo
        let rxpReturnedJqjImgeView = UIImageView()
        rxpReturnedJqjImgeView.backgroundColor = hex("#FFF38E")
        rxpReturnedJqjImgeView.layer.cornerRadius = 8
        rxpReturnedJqjImgeView.clipsToBounds = true
        return rxpReturnedJqjImgeView
    }()
    
    
    
    lazy var rxpGefuffleJqjLabel: UILabel = {//产品名
        let rxpGefuffleJqjLabel = UILabel()
        rxpGefuffleJqjLabel.font = UIFont.boldSystemFont(ofSize: 12)
        rxpGefuffleJqjLabel.textColor = hex("#00BD82")
        return rxpGefuffleJqjLabel
    }()
    
    
    lazy var rxpIntegrabelJqjLabel: UILabel = {//描述文案
        let rxpIntegrabelJqjLabel = UILabel()
        rxpIntegrabelJqjLabel.font = UIFont.systemFont(ofSize: 12)
        rxpIntegrabelJqjLabel.textColor = hex("#666666")
        return rxpIntegrabelJqjLabel
    }()
    
    lazy var rxpScotographJqjLabel: UILabel = {//金额
        let rxpScotographJqjLabel = UILabel()
        rxpScotographJqjLabel.font = peErasITC(size: 32)
        rxpScotographJqjLabel.textColor = hex("#00BD82")
        return rxpScotographJqjLabel
    }()
    
    
    lazy var applyBtn : UIButton = { //申请按钮
        let applyBtn = UIButton(type: .system)
        applyBtn.backgroundColor = hex("#F5FFD3")
        applyBtn.layer.cornerRadius = 15
        applyBtn.clipsToBounds = true
        applyBtn.setTitleColor(hex("#FF8C00"), for: .normal)
        applyBtn.setTitle("Apply", for: .normal)
        applyBtn.titleLabel?.font = peErasITC(size: 12)
        applyBtn.addTarget(self, action: #selector(applyBtnClick), for: .touchUpInside)
        return applyBtn
    }()
}
