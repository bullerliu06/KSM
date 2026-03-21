//
//  PBECertBaseWidgetTableViewCell.swift
//  PeraBee
//
//  Created by Parme on 2024/10/6.
//

import UIKit

class PBECertBaseWidgetTableViewCell: UITableViewCell {

    @IBOutlet weak var topLab: UILabel!
    
    @IBOutlet weak var arrowimg: UIImageView!
    
    @IBOutlet weak var contentLab: UILabel!
    
    var clickBalcik:PERDefaultBlock?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func cleeCliark(_ sender: Any) {
        clickBalcik?()
    }
    
    public func bettrayJsons(datst:JSON){
        topLab.text = datst["rxpUmbJqj"].stringValue
        contentLab.text = datst["rxpOverrigidJqj"].stringValue
        contentLab.textColor = UIColor(red: 204/255.0, green: 204/255.0, blue: 204/255.0, alpha: 1.0)
        let rxpRattlebrainJqj = datst["rxpRattlebrainJqj"].stringValue
        guard rxpRattlebrainJqj.count>0 else{ return }
        let urlas = datst["rxpHeadfirstJqj"].stringValue
        if urlas == "klnesopqz"{
            if rxpRattlebrainJqj.count>0{
                for value in datst["rxpConvivialityJqj"].arrayValue{
                    let rxpOsculateJqj = value["rxpOsculateJqj"].stringValue
                    if rxpOsculateJqj == rxpRattlebrainJqj{
                        contentLab.text = value["rxpMensalJqj"].stringValue
                        contentLab.textColor = UIColor(red: 51.0/255.0, green: 51.0/255.0, blue: 51.0/255.0, alpha: 1.0)
                        return
                    }
                }
                
            }
        }else if urlas == "nxrvwfzwr"{
            contentLab.text = rxpRattlebrainJqj
            contentLab.textColor = UIColor(red: 51.0/255.0, green: 51.0/255.0, blue: 51.0/255.0, alpha: 1.0)
        }
        
        
    }
    
    
}
