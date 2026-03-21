//
//  PBECertBankWidget.swift
//  PeraBee
//
//  Created by Parme on 2024/10/6.
//

import UIKit

class PBECertBankWidget: PBECertBaseVC,UITableViewDelegate,UITableViewDataSource {

    var cardJson = JSON()
    var cuurentTips:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        certTab.delegate = self
        certTab.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        PBEEFireManWorkLates.kimos.mengingWidgetFocerts(xinbe: "/xjuKovshUzf", tracking: ["rxpTrombonistJqj":currentPid],ibloadfod: true) { suc in
            self.findTimeWidget(tt: suc.feedBaseCall["rxpDermopteranJqj"].stringValue)
            self.cardJson = suc.feedBaseCall
            let eV = suc.feedBaseCall["rxpSilversmithJqj"]["rxpIntimismJqj"]["rxpGanoinJqj"].stringValue
            if eV.count == 0 || eV == "0"{
                self.cardJson["rxpSilversmithJqj"]["rxpIntimismJqj"] = JSON(["rxpGanoinJqj":suc.feedBaseCall["rxpSilversmithJqj"]["rxpUnpresentedJqj"][0]["rxpGalvanoscopicJqj"].stringValue,"rxpLikingJqj":"0" + PBEEDefaultRunsClearVibs.name])
            }
            self.certTab.reloadData()
            
        } ffBoom: { errorStr in
            
        }
    }
    
    override func runGoForward(_ sender: Any) {
        var dic:[String:Any] = ["rxpTrombonistJqj":currentPid,"point":getNewPP()]
        dic["rxpDehydrogenationJqj"] = cuurentTips == 0 ? "2" : "1"
        let channeStr = cuurentTips == 0 ? self.cardJson["rxpSilversmithJqj"]["rxpIntimismJqj"]["rxpGanoinJqj"].stringValue : self.cardJson["rxpSchematiyeJqj"]["rxpIntimismJqj"]["rxpGanoinJqj"].stringValue
        if !remakeUi(withUnkownstr: channeStr),channeStr == "0"{
            toast("Please Select.")
            return
        }
        dic["rxpGanoinJqj"] = channeStr
        
        let accountStr = cuurentTips == 0 ? self.cardJson["rxpSilversmithJqj"]["rxpIntimismJqj"]["rxpLikingJqj"].stringValue : self.cardJson["rxpSchematiyeJqj"]["rxpIntimismJqj"]["rxpLikingJqj"].stringValue
        if accountStr.count < 5 {
            toast("Please enter the account number in the correct format.")
            return
        }
        dic["rxpLikingJqj"] = accountStr
        
        let ssnne = PBECertBaseWidgetBankConfirmViewController(nibName: "PBECertBaseWidgetBankConfirmViewController", bundle: nil)
        
        let jsonArr = cuurentTips == 0 ? cardJson["rxpSilversmithJqj"]["rxpUnpresentedJqj"].arrayValue : cardJson["rxpSchematiyeJqj"]["rxpUnpresentedJqj"].arrayValue
        for rxpUnpresentedJqj in jsonArr{
            if rxpUnpresentedJqj["rxpGalvanoscopicJqj"].stringValue == channeStr{
                ssnne.str1 = rxpUnpresentedJqj["rxpMensalJqj"].stringValue
                break
            }
            
        }
        ssnne.str2 = accountStr
        ssnne.view.backgroundColor = .black.withAlphaComponent(0.72)
        ssnne.view.frame = CGRect(x: 0, y: 0, width: Wids, height: Heis)
        view.addSubview(ssnne.view)
        ssnne.cliajhebe = { ibnse in
            ssnne.view.removeFromSuperview()
            if ibnse == 0{
                PBEEFireManWorkLates.kimos.mengingWidgetFocerts(xinbe: "/xjuJournoUzf", tracking: dic,ibloadfod: true) { suc in
                    self.localSucDeal(deals: suc.feedBaseCall)
                } ffBoom: { errorStr in
                    
                }
            }
            
        }
        
        
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if cuurentTips == 0{
            return 372
        }else if cuurentTips == 1{
            return 237
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if cuurentTips == 0{
            if let cell = Bundle.main.loadNibNamed("PBECertBaseWidgetBankECell", owner: self, options: nil)?.first as? PBECertBaseWidgetBankECell {
                cell.keysFBis(sdoN: cardJson["rxpSilversmithJqj"])
                cell.changeReturn = {
                    self.cuurentTips = 1
                    self.certTab.reloadData()
                }
                cell.selectReturn = { selectValue in
                    self.cardJson["rxpSilversmithJqj"]["rxpIntimismJqj"]["rxpGanoinJqj"].stringValue = selectValue
                    self.certTab.reloadData()
                }
                cell.fillReturn = { fillValue in
                    self.cardJson["rxpSilversmithJqj"]["rxpIntimismJqj"]["rxpLikingJqj"].stringValue = fillValue
                    self.certTab.reloadData()
                }
                return cell
            }
        }else if cuurentTips == 1{
            if let cell = Bundle.main.loadNibNamed("PBECertBaseWidgetBankBCell", owner: self, options: nil)?.first as? PBECertBaseWidgetBankBCell {
                cell.keysFBis(sdoN: cardJson["rxpSchematiyeJqj"])
                cell.changeReturn = {
                    self.cuurentTips = 0
                    self.certTab.reloadData()
                }
                cell.selectReturn = {
                    let _ = PBECertBaseWidgetPopSelectView(popJson:self.cardJson["rxpSchematiyeJqj"],isB: true) { selectedValue in
                        let rxpLikingJqj = self.cardJson["rxpSchematiyeJqj"]["rxpIntimismJqj"]["rxpLikingJqj"].stringValue
                        self.cardJson["rxpSchematiyeJqj"]["rxpIntimismJqj"] = JSON(["rxpGanoinJqj":selectedValue,"rxpLikingJqj":rxpLikingJqj])
                        self.certTab.reloadData()
                    }
                }
                cell.fillReturn = { fillValue in
                    self.cardJson["rxpSchematiyeJqj"]["rxpIntimismJqj"]["rxpLikingJqj"].stringValue = fillValue
                    self.certTab.reloadData()
                }
                return cell
            }
        }
        return UITableViewCell.init()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        0.01
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        0.01
    }
    
}
