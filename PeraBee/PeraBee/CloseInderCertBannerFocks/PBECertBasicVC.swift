//
//  PBECertBasicVC.swift
//  PeraBee
//
//  Created by Parme on 2024/10/6.
//

import UIKit

class PBECertBasicVC: PBECertBaseVC {
    
    var basicJson = JSON()
    var basicArry:[JSON] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        certTab.delegate = self
        certTab.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        PBEEFireManWorkLates.kimos.mengingWidgetFocerts(xinbe: "/xjuCeciliaUzf", tracking: ["rxpTrombonistJqj":currentPid],ibloadfod: true) { suc in
            self.basicJson = suc.feedBaseCall
            self.cleatBasic()
        } ffBoom: { errorStr in
           
        }

    }
    
    func cleatBasic(){
        findTimeWidget(tt: basicJson["rxpDermopteranJqj"].stringValue)
        basicArry = basicJson["rxpPolyphageJqj"].arrayValue
        certTab.reloadData()
    }
    
    override func runGoForward(_ sender: Any) {
        var dic:[String:Any] = ["rxpTrombonistJqj":currentPid,"point":getNewPP()]
        for basicJs in basicArry{
            for josn in basicJs["rxpErpJqj"].arrayValue{
                let keuys = josn["rxpBenthamismJqj"].stringValue
                let vauelas = josn["rxpRattlebrainJqj"].stringValue
                
                if vauelas.count>0{
                    dic[keuys] = vauelas
                    continue
                }else{
                    if josn["rxpHeitikiJqj"].intValue == 0{
                        toast(josn["rxpOverrigidJqj"].stringValue)
                        return
                    }
                    continue
                }
                
            }
            
        }
        
        PBEEFireManWorkLates.kimos.mengingWidgetFocerts(xinbe: "/xjuHistogramUzf", tracking: dic,ibloadfod: true) { suc in
            self.localSucDeal(deals: suc.feedBaseCall)
            
        } ffBoom: { errorStr in
            
        }
        
    }
    
}

extension PBECertBasicVC:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return basicArry.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return basicArry[section]["more"].boolValue == true && basicArry[section]["showing"].boolValue == false ? 0 : basicArry[section]["rxpErpJqj"].arrayValue.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 46
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.basicArry[section]["more"].boolValue == false ? 46 : 92
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let rowData = basicArry[section]
        if rowData["more"].boolValue{
            let headaa = PBECertBaseWidgetMoreHeadView(headData: rowData)
            headaa.clickBalcik = {
                self.view.endEditing(true)
                self.basicArry[section]["showing"].boolValue = !rowData["showing"].boolValue
                tableView.reloadData()
            }
            return headaa
        }else{
            let titleLab = UILabel(frame: CGRect(x: 0, y: 0, width: Wids, height: 46))
            titleLab.backgroundColor = .clear
            titleLab.font = PBEEMPLUS2m(14)
            titleLab.textColor = hex("#00BF83")
            titleLab.text = rowData["rxpUmbJqj"].stringValue
            titleLab.textAlignment = .center
            return titleLab
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = .clear
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let jsons = basicArry[indexPath.section]["rxpErpJqj"][indexPath.row]
        let urlas = jsons["rxpHeadfirstJqj"].stringValue
        
        if (urlas == "klnesopqz" || urlas == "nxrvwfzwr"),let cell = Bundle.main.loadNibNamed("PBECertBaseWidgetTableViewCell", owner: self, options: nil)?.first as? PBECertBaseWidgetTableViewCell {
            
            cell.bettrayJsons(datst: jsons)
            cell.clickBalcik = {
                self.showCLosheHsopop(indexPath: indexPath)
            }
            return cell
        }else if urlas == "ocdmohmwn",let cell = Bundle.main.loadNibNamed("PBECertBaseWidgetTxtTableViewCell", owner: self, options: nil)?.first as? PBECertBaseWidgetTxtTableViewCell {
            
            cell.bettrayJsons(datst: jsons, tabse: self.certTab)
            cell.clickBalcik = { txt in
                self.basicArry[indexPath.section]["rxpErpJqj"][indexPath.row]["rxpRattlebrainJqj"].stringValue = txt
                self.certTab.reloadData()
            }
            return cell
        }
        
        return UITableViewCell()
    }
    
    func showCLosheHsopop(indexPath:IndexPath){
        self.view.endEditing(true)
        let jsons = basicArry[indexPath.section]["rxpErpJqj"][indexPath.row]
        let urlas = jsons["rxpHeadfirstJqj"].stringValue
        if urlas == "klnesopqz"{
            let _ = PBECertBaseWidgetPopSelectView(popJson:jsons) { selectedValue in
                self.reloadTbas(vaule: selectedValue, indexPath: indexPath)
            }
        }else if urlas == "nxrvwfzwr"{
            
            let basicTimeSing = PBECertBaseWidgetPopSelectTimeView(dateStr: jsons["rxpRattlebrainJqj"].string, title: jsons["rxpUmbJqj"].stringValue)
            basicTimeSing.show()
            basicTimeSing.selectBlock = { dataStr  in
                self.reloadTbas(vaule: dataStr, indexPath: indexPath)
            }
        }
        
    }
    
    func reloadTbas(vaule:String,indexPath:IndexPath){
        basicArry[indexPath.section]["rxpErpJqj"][indexPath.row]["rxpRattlebrainJqj"].stringValue = vaule
        certTab.reloadRows(at: [indexPath], with: .none)
        showohNJOpennNEts(indexPath: indexPath)
    }
    
    func showohNJOpennNEts(indexPath:IndexPath){
        let jsonList = basicArry[indexPath.section]["rxpErpJqj"].arrayValue
        guard jsonList.count > indexPath.row + 1 else { return }
        let jsons = jsonList[indexPath.row+1]
        let isEnaictxt = jsons["rxpRattlebrainJqj"].stringValue
        if isEnaictxt.count == 0{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.24) {
                if let cell = self.certTab.cellForRow(at: IndexPath(row: indexPath.row+1, section: indexPath.section)) as? PBECertBaseWidgetTableViewCell{
                    cell.clickBalcik?()
                    
                    if cell.isDescendant(of: self.certTab) {
                        let newOffset = self.certTab.contentOffset.y + cell.frame.size.height
                        self.certTab.setContentOffset(CGPoint(x: self.certTab.contentOffset.x, y: newOffset), animated: true)
                    }
                }
                
                
                
            }
        }
        
    }
    
}
