//
//  PERABEEMianrDjgmoxpJCell.swift
//  PeraBee
//
//  Created by Cris on 2024/10/6.
//

import UIKit

class PERABEEMianrDjgmoxpJCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        setPPERABEEMianrDjgmoxpJCellUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setPPERABEEMianrDjgmoxpJCellUI(){
        
        let backImageView = UIImageView(image: UIImage(named: "Mian_Mian_MianLargeCard_Back"))
        contentView.addSubview(backImageView)
        backImageView.snp.makeConstraints { make in
            make.left.equalTo(12)
            make.right.equalTo(-12)
            make.top.equalTo(0)
            make.height.equalTo(239)
        }
       
    }

}
