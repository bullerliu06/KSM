//
//  PBECertBaseWidgetBankBCell.swift
//  PeraBee
//
//  Created by Parme on 2024/10/9.
//

import UIKit

class PBECertBaseWidgetBankBCell: UITableViewCell,UITextFieldDelegate {
    
    var changeReturn:PERDefaultBlock?
    var selectReturn:PERDefaultBlock?
    var fillReturn:PERStringBlock?

    @IBOutlet weak var bankNameLIa: UILabel!
    @IBOutlet weak var contTxt: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        contTxt.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 20
        let currText = (textField.text ?? "") as NSString
        let newText = currText.replacingCharacters(in: range, with: string)
        return newText.count <= maxLength
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let txt = textField.text
        if remakeUi(withUnkownstr: txt){
            fillReturn?(txt!)
        }
    }
    
    @IBAction func cliaebtions(_ sender: Any) {
        endEditing(true)
        changeReturn?()
    }
    
    @IBAction func clisheNBtjd(_ sender: Any) {
        selectReturn?()
    }
    
    func keysFBis(sdoN:JSON){
        let fillStr = sdoN["rxpIntimismJqj"]["rxpLikingJqj"].stringValue
        contTxt.text = fillStr
        bankNameLIa.text = "Please Select"
        bankNameLIa.textColor = UIColor(red: 187.0/255.0, green: 187.0/255.0, blue: 187.0/255.0, alpha: 1.0)
        
        let selectId = sdoN["rxpIntimismJqj"]["rxpGanoinJqj"].stringValue
        for rxpUnpresentedJqj in sdoN["rxpUnpresentedJqj"].arrayValue{
            if rxpUnpresentedJqj["rxpGalvanoscopicJqj"].stringValue == selectId{
                bankNameLIa.text = rxpUnpresentedJqj["rxpMensalJqj"].stringValue
                bankNameLIa.textColor = UIColor(red: 51.0/255.0, green: 51.0/255.0, blue: 51.0/255.0, alpha: 1.0)
                return
            }
            
        }
        
    }
    
}
