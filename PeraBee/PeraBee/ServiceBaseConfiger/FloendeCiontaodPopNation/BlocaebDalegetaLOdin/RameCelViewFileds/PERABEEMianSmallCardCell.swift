//
//  PERABEEMianSmallCardCell.swift
//  PeraBee
//
//  Created by Cris on 2024/10/6.
//

import UIKit

class PERABEEMianSmallCardCell: UITableViewCell {
    
    var applyClickBlock: PERStringBlock?
    var jsonModel: JSON = JSON()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        setPERABEEMianSmallCardCellUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - setPERABEEMianLargeCardCellUI
    func setPERABEEMianSmallCardCellUI(){
        contentView.addSubview(backImageView)
        backImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(25)
            make.right.equalToSuperview().offset(-25)
            make.height.equalTo(145)
        }
        
        
        backImageView.addSubview(rxpReturnedJqjImgeView)
        rxpReturnedJqjImgeView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(120)
            make.top.equalToSuperview().offset(6)
            make.size.equalTo(CGSize(width: 28, height: 28))
        }
        
        
        backImageView.addSubview(rxpGefuffleJqjLabel)
        rxpGefuffleJqjLabel.snp.makeConstraints { make in
            make.centerY.equalTo(rxpReturnedJqjImgeView.snp.centerY)
            make.left.equalTo(rxpReturnedJqjImgeView.snp.right).offset(2)
            make.height.equalTo(18)
        }
        
        
        
        backImageView.addSubview(rxpIntegrabelJqjLabel)
        rxpIntegrabelJqjLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(rxpReturnedJqjImgeView.snp.bottom).offset(10)
            make.height.equalTo(18)
        }
        
        backImageView.addSubview(rxpScotographJqjLabel)
        rxpScotographJqjLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(rxpIntegrabelJqjLabel.snp.bottom)
            make.height.equalTo(50)
        }
        
        contentView.addSubview(applyBtn)
        applyBtn.snp.makeConstraints { make in
            make.height.equalTo(52)
            make.top.equalTo(backImageView.snp.bottom)
            make.left.equalTo(44)
            make.right.equalTo(-44)
        }
        
        applyBtn.addSubview(applyLabel)
        applyLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(0)
            make.left.right.equalToSuperview().offset(0)
            make.height.equalTo(48)
        }
    }
    
    func updataPERABEEMianSmallCardCellUIUI(jsonModel:JSON){
        self.jsonModel = jsonModel
        rxpGefuffleJqjLabel.text = jsonModel["rxpGefuffleJqj"].stringValue
        rxpReturnedJqjImgeView.kf.setImage(with: URL(string: jsonModel["rxpReturnedJqj"].stringValue))
        rxpIntegrabelJqjLabel.text = jsonModel["rxpIntegrabelJqj"].stringValue
        rxpScotographJqjLabel.text = jsonModel["rxpScotographJqj"].stringValue
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
        let backImageView = UIImageView(image: UIImage(named: "Mian_MianSmallCard_Top"))
        backImageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(applyBtnClick))
        backImageView.addGestureRecognizer(tapGesture)
        return backImageView
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
        rxpGefuffleJqjLabel.font = PBEERobotoBb(size: 16)
        rxpGefuffleJqjLabel.textColor = hex("#FFF38E")
        return rxpGefuffleJqjLabel
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
    
    
    lazy var applyBtn : UIButton = { //申请按钮
        let applyBtn = UIButton(type: .system)
        applyBtn.backgroundColor = hex("#FF8C00")
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
