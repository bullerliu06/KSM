//
//  PBECertBaseWidgetBankECell.swift
//  PeraBee
//
//  Created by Parme on 2024/10/9.
//

import UIKit

class PBECertBaseWidgetBankECell: UITableViewCell ,UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource{
    
    var changeReturn:PERDefaultBlock?
    var selectReturn:PERStringBlock?
    var fillReturn:PERStringBlock?
    
    @IBOutlet weak var accountTxt: UITextField!
    @IBOutlet weak var tabViw: UITableView!
    
    var curentSeletd:Int = -1
    
    var currentEW = JSON()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        accountTxt.delegate = self
        tabViw.delegate = self
        tabViw.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let txt = textField.text
        if remakeUi(withUnkownstr: txt){
            fillReturn?(txt!)
        }
    }
    
    @IBAction func bankCicks(_ sender: Any) {
        endEditing(true)
        changeReturn?()
    }
    
    func keysFBis(sdoN:JSON){
        curentSeletd = -1
        currentEW = sdoN["rxpUnpresentedJqj"]
        let fillStr = sdoN["rxpIntimismJqj"]["rxpLikingJqj"].stringValue
        let selectId = sdoN["rxpIntimismJqj"]["rxpGanoinJqj"].stringValue
        if remakeUi(withUnkownstr: fillStr){
            accountTxt.text = fillStr
        }else{
            accountTxt.text = "0" + PBEEDefaultRunsClearVibs.name
        }
        
        guard selectId.count>0,selectId != "0" else { return }
        for i in 0..<sdoN["rxpUnpresentedJqj"].arrayValue.count{
            let rxpUnpresentedJqj = sdoN["rxpUnpresentedJqj"][i]
            if rxpUnpresentedJqj["rxpGalvanoscopicJqj"].stringValue == selectId{
                curentSeletd = i
                break
            }
            
        }
        tabViw.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentEW.arrayValue.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 58
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = Bundle.main.loadNibNamed("PBECertBaseWidgetBankEECell", owner: self, options: nil)?.first as? PBECertBaseWidgetBankEECell {
            
            cell.keysFBis(sdoN: currentEW.arrayValue[indexPath.row],issel: curentSeletd == indexPath.row)
            cell.changeReturn = {
                if self.curentSeletd != indexPath.row{
                    self.selectReturn?(self.currentEW.arrayValue[indexPath.row]["rxpGalvanoscopicJqj"].stringValue)
                }
            }
            return cell
        }
        return UITableViewCell.init()
    }
    
}
