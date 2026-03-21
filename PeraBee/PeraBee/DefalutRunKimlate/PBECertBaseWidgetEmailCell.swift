//
//  PBECertBaseWidgetEmailCell.swift
//  PeraBee
//
//  Created by Parme on 2024/10/7.
//

import UIKit

class PBECertBaseWidgetEmailCell: UITableViewCell {

    @IBOutlet weak var shpwLabse: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func neopajhfLbde(tiaoe:String,isserhfgyiahf:Bool){
        shpwLabse.text = tiaoe
        shpwLabse.backgroundColor = isserhfgyiahf ? UIColor(red: 255.0/255.0, green: 231/255.0, blue: 201/255.0, alpha: 1.0) : .white
    }
    
}
