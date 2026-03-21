//
//  PERABEEMianLargeCardCell.swift
//  PeraBee
//
//  Created by Cris on 2024/10/6.
//

import UIKit

class PERABEEMianLargeCardCell: UITableViewCell {
    var applyClickBlock: PERStringBlock?
    var jsonModel: JSON = JSON()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        setPERABEEMianLargeCardCellUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - setPERABEEMianLargeCardCellUI
    func setPERABEEMianLargeCardCellUI(){
        contentView.addSubview(backImageView)
        backImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalTo(325)
            make.height.equalTo(326)
        }
        
        backImageView.addSubview(rxpGefuffleJqjLabel)
        rxpGefuffleJqjLabel.snp.makeConstraints { make in
            make.top.equalTo(34)
            make.centerX.equalToSuperview()
            make.height.equalTo(18)
        }
        
        backImageView.addSubview(rxpReturnedJqjImgeView)
        rxpReturnedJqjImgeView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(rxpGefuffleJqjLabel.snp.bottom).offset(6)
            make.size.equalTo(CGSize(width: 38, height: 38))
        }
        
        backImageView.addSubview(rxpIntegrabelJqjLabel)
        rxpIntegrabelJqjLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(rxpReturnedJqjImgeView.snp.bottom).offset(18)
            make.height.equalTo(18)
        }
        
        backImageView.addSubview(rxpScotographJqjLabel)
        rxpScotographJqjLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(rxpIntegrabelJqjLabel.snp.bottom)
            make.height.equalTo(50)
        }
        
        let lineView = UIImageView(image: UIImage(named: "Mian_MianLargeCard_Line"))
        backImageView.addSubview(lineView)
        lineView.snp.makeConstraints { make in
            make.top.equalTo(rxpScotographJqjLabel.snp.bottom).offset(12)
            make.left.equalTo(32)
            make.right.equalTo(-32)
            make.height.equalTo(2)
        }
        
        backImageView.addSubview(rxpSybaseJqjLabel)
        rxpSybaseJqjLabel.snp.makeConstraints { make in
            make.left.equalTo(36)
            make.height.equalTo(16)
            make.top.equalTo(lineView.snp.bottom).offset(10)
        }
        
        backImageView.addSubview(rxpTotanyJqjLabel)
        rxpTotanyJqjLabel.snp.makeConstraints { make in
            make.centerX.equalTo(rxpSybaseJqjLabel.snp.centerX)
            make.top.equalTo(rxpSybaseJqjLabel.snp.bottom).offset(2)
            make.height.equalTo(17)
        }
        
        backImageView.addSubview(rxpInitioJqjLabel)
        rxpInitioJqjLabel.snp.makeConstraints { make in
            make.centerY.equalTo(rxpSybaseJqjLabel.snp.centerY)
            make.right.equalTo(-36)
            make.height.equalTo(16)
        }
        
        backImageView.addSubview(rxpPrickleJqjLabel)
        rxpPrickleJqjLabel.snp.makeConstraints { make in
            make.centerX.equalTo(rxpInitioJqjLabel.snp.centerX)
            make.top.equalTo(rxpInitioJqjLabel.snp.bottom).offset(2)
            make.height.equalTo(17)
        }
        
        contentView.addSubview(applyBtn)
        applyBtn.snp.makeConstraints { make in
            make.height.equalTo(52)
            make.top.equalTo(backImageView.snp.bottom).offset(-50)
            make.left.equalTo(44)
            make.right.equalTo(-44)
        }
        
        applyBtn.addSubview(applyLabel)
        applyLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(0)
            make.left.equalToSuperview().offset(1)
            make.right.equalToSuperview().offset(-1)
            make.height.equalTo(48)
        }
    }
    
    func updataPERABEEMianLargeCardCellUI(jsonModel:JSON){
        self.jsonModel = jsonModel
        rxpGefuffleJqjLabel.text = jsonModel["rxpGefuffleJqj"].stringValue
        rxpReturnedJqjImgeView.kf.setImage(with: URL(string: jsonModel["rxpReturnedJqj"].stringValue))
        rxpIntegrabelJqjLabel.text = jsonModel["rxpIntegrabelJqj"].stringValue
        rxpScotographJqjLabel.text = jsonModel["rxpScotographJqj"].stringValue
        rxpSybaseJqjLabel.text = jsonModel["rxpSybaseJqj"].stringValue
        rxpTotanyJqjLabel.text = jsonModel["rxpTotanyJqj"].stringValue
        rxpInitioJqjLabel.text = jsonModel["rxpInitioJqj"].stringValue
        rxpPrickleJqjLabel.text = jsonModel["rxpPrickleJqj"].stringValue
        applyLabel.backgroundColor = hex(jsonModel["rxpPyaJqj"].stringValue)
        applyLabel.text = jsonModel["rxpHippiedomJqj"].stringValue
    }
    
    @objc func applyBtnClick(){
        if let applyClickBlock = applyClickBlock{
            applyClickBlock(self.jsonModel["rxpGalvanoscopicJqj"].stringValue)
        }
    }
    
    //MARK: - lazy
    lazy var backImageView: UIImageView = {
        let backImageView = UIImageView(image: UIImage(named: "Mian_MianLargeCard_Top"))
        backImageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(applyBtnClick))
        backImageView.addGestureRecognizer(tapGesture)
        return backImageView
    }()
    
    lazy var rxpGefuffleJqjLabel: UILabel = {//产品名
        let rxpGefuffleJqjLabel = UILabel()
        rxpGefuffleJqjLabel.font = PBEERobotoBb(size: 16)
        rxpGefuffleJqjLabel.textColor = hex("#FFF38E")
        return rxpGefuffleJqjLabel
    }()
    
    lazy var  rxpReturnedJqjImgeView : UIImageView = {//产品logo
        let rxpReturnedJqjImgeView = UIImageView()
        rxpReturnedJqjImgeView.backgroundColor = hex("#FFF38E")
        rxpReturnedJqjImgeView.layer.cornerRadius = 8
        rxpReturnedJqjImgeView.clipsToBounds = true
        return rxpReturnedJqjImgeView
    }()
    
    
    lazy var rxpIntegrabelJqjLabel: UILabel = {//描述文案
        let rxpIntegrabelJqjLabel = UILabel()
        rxpIntegrabelJqjLabel.font = peErasITC(size: 16)
        rxpIntegrabelJqjLabel.textColor = hex("#333333")
        return rxpIntegrabelJqjLabel
    }()
    
    lazy var rxpScotographJqjLabel: UILabel = {//金额
        let rxpScotographJqjLabel = UILabel()
        rxpScotographJqjLabel.font = peErasITC(size: 48)
        rxpScotographJqjLabel.textColor = hex("#333333")
        return rxpScotographJqjLabel
    }()
    
    lazy var rxpSybaseJqjLabel: UILabel = {//产品期限标题
        let rxpSybaseJqjLabel = UILabel()
        rxpSybaseJqjLabel.font = PBEEMPLUS2r(size: 12)
        rxpSybaseJqjLabel.textColor = hex("#555555")
        return rxpSybaseJqjLabel
    }()
    
    lazy var rxpTotanyJqjLabel: UILabel = {//产品期限
        let rxpTotanyJqjLabel = UILabel()
        rxpTotanyJqjLabel.font = peErasITC(size: 14)
        rxpTotanyJqjLabel.textColor = hex("#333333")
        return rxpTotanyJqjLabel
    }()
    
    
    lazy var rxpInitioJqjLabel: UILabel = {//产品利率标题
        let rxpInitioJqjLabel = UILabel()
        rxpInitioJqjLabel.font = PBEEMPLUS2r(size: 12)
        rxpInitioJqjLabel.textColor = hex("#555555")
        return rxpInitioJqjLabel
    }()
    
    lazy var rxpPrickleJqjLabel: UILabel = {//产品利率
        let rxpPrickleJqjLabel = UILabel()
        rxpPrickleJqjLabel.font = peErasITC(size: 14)
        rxpPrickleJqjLabel.textColor = hex("#333333")
        return rxpPrickleJqjLabel
    }()
    
    lazy var applyBtn : UIButton = { //申请按钮
        let applyBtn = UIButton(type: .system)
        applyBtn.backgroundColor = hex("#FDFFD3")
        applyBtn.layer.cornerRadius = 26
        applyBtn.clipsToBounds = true
        applyBtn.addTarget(self, action: #selector(applyBtnClick), for: .touchUpInside)
        return applyBtn
    }()
    
    lazy var applyLabel: UILabel = {
        let applyLabel = UILabel()
        applyLabel.layer.cornerRadius = 24
        applyLabel.clipsToBounds = true
        applyLabel.font = peErasITC(size: 24)
        applyLabel.backgroundColor = hex("#FDFFD3")
        applyLabel.textColor = hex("#FF8C00")
        applyLabel.textAlignment = .center
        return applyLabel
    }()
    
}
