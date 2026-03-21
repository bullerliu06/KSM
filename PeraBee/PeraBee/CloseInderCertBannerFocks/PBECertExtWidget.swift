//
//  PBECertExtWidget.swift
//  PeraBee
//
//  Created by Parme on 2024/10/6.
//

import UIKit

class PBECertExtWidget: PBECertBaseVC {
    
    var extArry:[JSON] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        certTab.delegate = self
        certTab.dataSource = self
        
        PBEEFireManWorkLates.kimos.mengingWidgetFocerts(xinbe: "/xjuSandsailerUzf", tracking: ["rxpTrombonistJqj":currentPid],ibloadfod: true) { suc in
            self.findTimeWidget(tt: suc.feedBaseCall["rxpDermopteranJqj"].stringValue)
            self.extArry = suc.feedBaseCall["rxpPolyphageJqj"].arrayValue
            self.certTab.reloadData()
        } ffBoom: { errorStr in
            
        }
    }
    
    func showNeoaohByType(indexPath:IndexPath,types:Int){
        if types == 0{
            let _ = PBECertBaseWidgetPopSelectOneView(popJson:extArry[indexPath.row]) { selectedValue in
                self.extArry[indexPath.row]["rxpIntimismJqj"]["rxpAliyahJqj"].stringValue = selectedValue
                self.certTab.reloadRows(at: [indexPath], with: .none)
            }
        }else if types == 1{
            PRABEEContactsManager.ctsManAbc.slingDerCalloetr(bueiat: self) { name, phone in
                guard let name = name,let phone = phone else { return }
                self.extArry[indexPath.row]["rxpIntimismJqj"]["rxpMensalJqj"].stringValue = name
                self.extArry[indexPath.row]["rxpIntimismJqj"]["rxpGlaciationJqj"].stringValue = phone
                self.certTab.reloadRows(at: [indexPath], with: .none)
            }
            
        }
        
    }
    
    override func runGoForward(_ sender: Any) {
        var dic:[String:Any] = ["rxpTrombonistJqj":currentPid,"point":getNewPP()]
        for basicJs in extArry{
            let key1 = basicJs["rxpCockilyJqj"].arrayValue[0]["rxpMensalJqj"].stringValue
            let key2 = basicJs["rxpCockilyJqj"].arrayValue[1]["rxpMensalJqj"].stringValue
            let key3 = basicJs["rxpCockilyJqj"].arrayValue[2]["rxpMensalJqj"].stringValue
            
            let value1 = basicJs["rxpIntimismJqj"]["rxpMensalJqj"].stringValue
            let value2 = basicJs["rxpIntimismJqj"]["rxpGlaciationJqj"].stringValue
            let value3 = basicJs["rxpIntimismJqj"]["rxpAliyahJqj"].stringValue
            
            if value1.count > 0,value2.count > 0,value3 != "0",value3.count > 0{
                dic[key1] = value1
                dic[key2] = value2
                dic[key3] = value3
            }else{
                toast("Please select \(basicJs["rxpUmbJqj"].stringValue)")
                return
            }
            
        }
        
        PBEEFireManWorkLates.kimos.mengingWidgetFocerts(xinbe: "/xjuBailsmanUzf", tracking: dic,ibloadfod: true) { suc in
            self.localSucDeal(deals: suc.feedBaseCall)
            
        } ffBoom: { errorStr in
            
        }
        
    }
    
}

extension PBECertExtWidget:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return extArry.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 167
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        0.01
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = .clear
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = Bundle.main.loadNibNamed("PBECertBaseWidgetContactCell", owner: self, options: nil)?.first as? PBECertBaseWidgetContactCell {
            cell.reductJSpnens(jsoner: extArry[indexPath.row])
            cell.clickBLiieak = { inst in
                self.showNeoaohByType(indexPath: indexPath, types: inst)
            }
            return cell
        }
        
        return UITableViewCell()
    }
   
    
}
