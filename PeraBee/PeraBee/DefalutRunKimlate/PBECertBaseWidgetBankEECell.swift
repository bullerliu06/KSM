//
//  PBECertBaseWidgetBankEECell.swift
//  PeraBee
//
//  Created by Parme on 2024/10/9.
//

import UIKit

class PBECertBaseWidgetBankEECell: UITableViewCell {

    var changeReturn:PERDefaultBlock?
    
    @IBOutlet weak var eButton: UIButton!
    @IBOutlet weak var eTitle: UILabel!
    @IBOutlet weak var eImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func selectClick(_ sender: Any) {
        if !eButton.isSelected{
            changeReturn?()
        }
    }
    
    func keysFBis(sdoN:JSON,issel:Bool){
        eButton.isSelected = issel
        eTitle.text = sdoN["rxpMensalJqj"].stringValue
        eImg.kf.setImage(with: URL(string: sdoN["rxpBureaucratizeJqj"].stringValue))
    }
    
}
