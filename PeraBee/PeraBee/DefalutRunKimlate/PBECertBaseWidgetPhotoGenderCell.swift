//
//  PBECertBaseWidgetPhotoGenderCell.swift
//  PeraBee
//
//  Created by Parme on 2024/10/8.
//

import UIKit

class PBECertBaseWidgetPhotoGenderCell: UITableViewCell {
    
    @IBOutlet weak var titleb: UILabel!
    @IBOutlet weak var genderImg1: UIImageView!
    @IBOutlet weak var genderLab1: UILabel!
    
    @IBOutlet weak var genderImg2: UIImageView!
    @IBOutlet weak var genderLab2: UILabel!
    
    var clickBLiieak:PERStringBlock?
    var slefIfer = JSON()
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    @IBAction func genderCLick(_ sender: UIButton) {
        
        let rxpRattlebrainJqj = slefIfer["rxpRattlebrainJqj"].stringValue
        let selectId = slefIfer["rxpConvivialityJqj"][sender.tag]["rxpOsculateJqj"].stringValue
        if rxpRattlebrainJqj != selectId{
            clickBLiieak?(selectId)
        }
        
    }
    
    func hdeeriLAber(ifer:JSON){
        self.slefIfer = ifer
        titleb.text = ifer["rxpUmbJqj"].stringValue
        
        let lab1 = ifer["rxpConvivialityJqj"][0]["rxpMensalJqj"].stringValue
        let lab2 = ifer["rxpConvivialityJqj"][1]["rxpMensalJqj"].stringValue
        genderLab1.text = lab1
        genderLab2.text = lab2
        
        var img1 = "cert_select0"
        var img2 = "cert_select0"
        
        let rxpRattlebrainJqj = ifer["rxpRattlebrainJqj"].stringValue
        for jsr in ifer["rxpConvivialityJqj"].arrayValue{
            if jsr["rxpOsculateJqj"].stringValue == rxpRattlebrainJqj{
                if lab1 == jsr["rxpMensalJqj"].stringValue{
                    img1 = "cert_select1"
                }else if lab2 == jsr["rxpMensalJqj"].stringValue{
                    img2 = "cert_select1"
                }
                break
            }
            
        }
        genderImg1.image = UIImage(named: img1)
        genderImg2.image = UIImage(named: img2)
        
    }
    
}
