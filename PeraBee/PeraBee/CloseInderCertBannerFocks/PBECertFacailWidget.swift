//
//  PBECertFacailWidget.swift
//  PeraBee
//
//  Created by Parme on 2024/10/6.
//

import UIKit

class PBECertFacailWidget: PBECertBaseVC,UITableViewDelegate,UITableViewDataSource, UINavigationControllerDelegate {

    var isdefault = true
    var rxpRattlebrainJqj:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetUI()
        certTab.delegate = self
        certTab.dataSource = self
        
        AAILivenessSDK.initWith(.philippines)
        AAILivenessSDK.configResultPictureSize(800.0)
        AAILivenessSDK.additionalConfig().detectionLevel = .easy
        
        PBEEFireManWorkLates.kimos.mengingWidgetFocerts(xinbe: "/xjuNaskhiUzf", tracking: ["rxpTrombonistJqj":currentPid],ibloadfod: true) { suc in
            self.findTimeWidget(tt: suc.feedBaseCall["rxpDermopteranJqj"].stringValue)
            self.rxpRattlebrainJqj = suc.feedBaseCall["rxpBlatJqj"]["rxpRattlebrainJqj"].stringValue
            self.resetUI()
        } ffBoom: { errorStr in
            
        }
    }
    
    func resetUI(){
        if remakeUi(withUnkownstr: self.rxpRattlebrainJqj){
            doneButton.setImage(UIImage(named: "cert_next"), for: .normal)
        }else{
            if isdefault{
                doneButton.setImage(UIImage(named: "cert_facial_start"), for: .normal)
            }else{
                doneButton.setImage(UIImage(named: "cert_facial_try"), for: .normal)
            }
        }
        certTab.reloadData()
        
    }
    
    override func runGoForward(_ sender: Any) {
        if remakeUi(withUnkownstr: self.rxpRattlebrainJqj){
            saveFacail(kyes: self.rxpRattlebrainJqj)
        }else{
            goStartFacail()
        }
    }
    
    func goStartFacail(){
        PBEEFireManWorkLates.kimos.mengingWidgetFocerts(xinbe: "/xjuEpigenicUzf", tracking: ["rxpTrombonistJqj":currentPid],ibloadfod: true) { suc in
            
            PBEEFireManWorkLates.kimos.momentTgpGloable(miaorle: "/xjuHumectantUzf",load: true) { suc in
                let rxpOperantJqj = suc.feedBaseCall["rxpOperantJqj"].stringValue
                if remakeUi(withUnkownstr: rxpOperantJqj){
                    self.popFacail(rxpOperantJqj: rxpOperantJqj)
                }
                
            } fai: { errorStr in
                
            }
            
        } ffBoom: { errorStr in
            
        }
        
    }
    
    func popFacail(rxpOperantJqj:String){
        let checkResltStr = AAILivenessSDK.configLicenseAndCheck(rxpOperantJqj)
        if checkResltStr  ==  "SUCCESS"{
            let aaiFacialve = AAILivenessViewController()
            aaiFacialve.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
            aaiFacialve.detectionSuccessBlk = {(rawVC, result) in
                self.facailGetRelate(rxpHemichordateJqj: result.livenessId)
                rawVC.navigationController?.popViewController(animated: true)
            }
            
            aaiFacialve.detectionFailedBlk = { (rawVC, result) in
                let errstr = result["key"] as? String ?? "Face authentication failed, please try again later"
                self.showFacailError(error: errstr)
                rawVC.navigationController?.popViewController(animated: true)
            }
            
            self.navigationController?.delegate = self
            self.navigationController?.pushViewController(aaiFacialve, animated: true)
            
        }else {
            showFacailError(error: checkResltStr)
        }
        
    }
    
    func showFacailError(error:String?){
        isdefault = false
        resetUI()
        
        if let error = error{
            toast(error)
            PBEEFireManWorkLates.kimos.mengingWidgetFocerts(xinbe: "/xjuPeaceUzf", tracking: ["rxpRattlebrainJqj":error]) { suc in
            } ffBoom: { errorStr in
            }
        }
        
    }
    
    func facailGetRelate(rxpHemichordateJqj:String){
        
        PBEEFireManWorkLates.kimos.mengingWidgetFocerts(xinbe: "/xjuJvcUzf", tracking: ["rxpTrombonistJqj":currentPid,"rxpHemichordateJqj":rxpHemichordateJqj],ibloadfod: true) { suc in
            self.rxpRattlebrainJqj = suc.feedBaseCall["rxpWinceJqj"].stringValue
            if remakeUi(withUnkownstr: self.rxpRattlebrainJqj){
                self.saveFacail(kyes: self.rxpRattlebrainJqj)
            }
        } ffBoom: { errorStr in
            
        }
    }
    
    func saveFacail(kyes:String){
        PBEEFireManWorkLates.kimos.mengingWidgetFocerts(xinbe: "/xjuCrowUzf", tracking: ["rxpTrombonistJqj":currentPid,"rxpSectaJqj":kyes,"point":getNewPP()],ibloadfod: true) { suc in
            self.localSucDeal(deals: suc.feedBaseCall)
        } ffBoom: { errorStr in
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = Bundle.main.loadNibNamed("PBECertBaseWidgetFacialCell", owner: self, options: nil)?.first as? PBECertBaseWidgetFacialCell {
            cell.showDeafult(isdefault)
            return cell
        }
        return UITableViewCell.init()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        538
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        0.01
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        0.01
    }

}

