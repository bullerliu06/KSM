//
//  PERABEMainEirgepcztoCell.swift
//  PeraBee
//
//  Created by Cris on 2024/10/9.
//

import UIKit

class PERABEMainEirgepcztoCell: UITableViewCell {

    
    var applyClickBlock: PERStringBlock?
    var jsonModel: JSON = JSON()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        setPERABEMainEirgepcztoCellUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setPERABEMainEirgepcztoCellUI(){
        contentView.addSubview(repayBackImageView)
        repayBackImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(0)
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(-12)
            make.height.equalTo(49)
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(repayBackImageViewClick))
        repayBackImageView.addGestureRecognizer(tapGesture)
    }
    
    func updatasetPERABEMainEirgepcztoCellUI(jsonModel:JSON){
        self.jsonModel = jsonModel
        self.repayBackImageView.kf.setImage(with: URL(string: jsonModel["rxpSmokechaserJqj"].stringValue))
       
    }
    
    @objc func repayBackImageViewClick(){
        if let applyClickBlock = applyClickBlock{
            applyClickBlock(self.jsonModel["rxpOctonaryJqj"].stringValue)
        }
    }
    
    //MARK: - lazy
    lazy var repayBackImageView : UIImageView = {
        let repayBackImageView = UIImageView()
        repayBackImageView.isUserInteractionEnabled = true
        return repayBackImageView
    }()

}
