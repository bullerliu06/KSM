//
//  PBECertBaseWidgetContactCell.swift
//  PeraBee
//
//  Created by Parme on 2024/10/7.
//

import UIKit

class PBECertBaseWidgetContactCell: UITableViewCell {

    @IBOutlet weak var topTitle: UILabel!
    @IBOutlet weak var relateLbes: UITextField!
    @IBOutlet weak var cantctuView: UIView!
    @IBOutlet weak var contatIcon: UIImageView!
    @IBOutlet weak var addIcon2: UIImageView!
    @IBOutlet weak var addIcon1: UIImageView!
    @IBOutlet weak var phhonealanb: UILabel!
    @IBOutlet weak var nameLabe: UILabel!
    
    var clickBLiieak:PERIntBlock?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func showContact(_ sender: Any) {
        clickBLiieak?(1)
    }
    
    @IBAction func relateClick(_ sender: Any) {
        clickBLiieak?(0)
    }
    
    func reductJSpnens(jsoner:JSON){
        topTitle.text = jsoner["rxpUmbJqj"].stringValue
        
        let nameStr = jsoner["rxpIntimismJqj"]["rxpMensalJqj"].stringValue
        let phoneStr = jsoner["rxpIntimismJqj"]["rxpGlaciationJqj"].stringValue
        let relateKey = jsoner["rxpIntimismJqj"]["rxpAliyahJqj"].stringValue
        nameLabe.text = remakeUi(withUnkownstr: nameStr) ? nameStr : "Name:"
        phhonealanb.text = remakeUi(withUnkownstr: phoneStr) ? phoneStr : "Phone Number:"
        
        let isDwon = remakeUi(withUnkownstr: jsoner["rxpIntimismJqj"]["rxpMensalJqj"].string)
        addIcon1.image = isDwon ? UIImage(named: "cert_contact_add1") : UIImage(named: "cert_contact_add2")
        addIcon2.image = isDwon ? UIImage(named: "cert_contact_add1") : UIImage(named: "cert_contact_add2")
        cantctuView.backgroundColor = isDwon ? UIColor(red: 255.0/255.0, green: 244/255.0, blue: 226/255.0, alpha: 1.0) : UIColor(red: 239/255.0, green: 254/255.0, blue: 255.0/255.0, alpha: 1.0)
        contatIcon.image  = isDwon ? UIImage(named: "cert_contact_icon2") : UIImage(named: "cert_contact_icon1")
        
        for jhson in jsoner["rxpAliyahJqj"].arrayValue{
            if jhson["rxpNeoromanticismJqj"].stringValue == relateKey{
                relateLbes.text = jhson["rxpMensalJqj"].stringValue
                return
            }
        }
        
    }
    
    
}
