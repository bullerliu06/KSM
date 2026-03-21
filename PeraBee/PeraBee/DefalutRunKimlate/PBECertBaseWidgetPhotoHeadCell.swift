//
//  PBECertBaseWidgetPhotoHeadCell.swift
//  PeraBee
//
//  Created by Parme on 2024/10/8.
//

import UIKit

class PBECertBaseWidgetPhotoHeadCell: UITableViewCell {

    @IBOutlet weak var idTypeImg: UIImageView!
    
    @IBOutlet weak var idContent: UITextField!
    
    var clickBLiieak:PERIntBlock?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    @IBAction func idClick(_ sender: Any) {
        clickBLiieak?(0)
    }
    
    @IBAction func pickerClick(_ sender: Any) {
        clickBLiieak?(1)
    }
    
    func hgaorrL0adCell(cellData:JSON,img:UIImage?=nil){
        let rxpInseverableJqj = cellData["rxpInseverableJqj"].string
        if remakeUi(withUnkownstr: rxpInseverableJqj){
            for joar in cellData["rxpConvivialityJqj"].arrayValue{
                if joar["rxpDehydrogenationJqj"].stringValue == rxpInseverableJqj{
                    idTypeImg.kf.setImage(with: URL(string: joar["rxpQuickyJqj"].stringValue),placeholder: UIImage(named: "cert_photo_default0"))
                    idContent.text = joar["rxpEpeiricJqj"].stringValue
                    break
                }
                
            }
            
        }
        
        if let img = img{
            idTypeImg.image = img
        }else if let str = cellData["rxpOctonaryJqj"].string,remakeUi(withUnkownstr: str),img==nil{
            idTypeImg.kf.setImage(with: URL(string: str),placeholder: UIImage(named: "cert_photo_default0"))
        }

    }
    
}
