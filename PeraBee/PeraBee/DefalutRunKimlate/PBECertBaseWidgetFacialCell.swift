//
//  PBECertBaseWidgetFacialCell.swift
//  PeraBee
//
//  Created by Parme on 2024/10/8.
//

import UIKit

class PBECertBaseWidgetFacialCell: UITableViewCell {

    @IBOutlet weak var showImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func showDeafult(_ defalut:Bool){
        let names = "cert_facial_\(defalut ? "0" : "1")"
        showImg.image = UIImage(named: names)
    }
    
}
