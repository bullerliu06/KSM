//
//  PERABEEApplyHandleManager.swift
//  PeraBee
//
//  Created by Cris on 2024/10/7.
//

import UIKit

let applyHandle = PERABEEApplyHandleManager.shared

class PERABEEApplyHandleManager{
    
    var isContinuousClick = false
    
    func firstDaylbondIntrance(palcee:String){
        
        if remakeUi(withUnkownstr: palcee){
            guard let facer = UIApplication.shared.windows.first?.rootViewController as? UINavigationController else {
                return
            }
            
            let bockMan = PERABEERunPlaSafireToler()
            bockMan.uiGuester = palcee
            facer.pushViewController(bockMan, animated: true)
        }
        
    }
    
    static let shared = PERABEEApplyHandleManager()
    
    //MARK: - mainWidgetApply
    func mainWidgetApply(pid:String){
        if !remakeUi(withUnkownstr: pid){return}
        if isContinuousClick {return}
        self.isContinuousClick = true
        self.mianViewModel.getMainWidgetApplyData(pid: pid) { [weak self] result in
            guard let self = self else { return }
            
            if result["rxpSandlotJqj"].boolValue{
                if result["rxpInfinitudeJqj"].intValue == 2{
                    PERABEEDeviceTool.updataDeviceinfo()
                }
                if result["rxpOctonaryJqj"].stringValue.hasPrefix("http"){
                    self.firstDaylbondIntrance(palcee: result["rxpOctonaryJqj"].stringValue)
                }else{
                    self.applyDatalHandleData(pid: pid)
                }
                
            }else{
                ELoTudeforbemeetSeeder.beCationFloadOnlyBoolRequest { isce in
                    
                    if isce{
                        ELoTudeforbemeetSeeder.froanLidateAnyDIctRequest { locationInfo in
                            
                            PBEEFireManWorkLates.kimos.mengingWidgetFocerts(xinbe: self.mianViewModel.getHomepageUpdataLocationInfo, tracking: locationInfo,ibloadfod: true) { suc in
                                if result["rxpOctonaryJqj"].stringValue.hasPrefix("http"){
                                    self.firstDaylbondIntrance(palcee: result["rxpOctonaryJqj"].stringValue)
                                }else{
                                    self.applyDatalHandleData(pid: pid)
                                }
                                
                            } ffBoom: { errorStr in
                                
                            }
                            
                        }
                        
                        if result["rxpInfinitudeJqj"].intValue == 2{
                            PERABEEDeviceTool.updataDeviceinfo()
                        }
                        
                    }else{
                        self.bloackDestroryFalse()
                    }
                    
                }
                    
            }
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.isContinuousClick = false
        }
        
}
    
    //MARK: - applyDatalHandleData
    func applyDatalHandleData(pid:String){
        self.mianViewModel.getMainWidgetApplyDetail(pid: pid) { orderId, jumpPage in
            if remakeUi(withUnkownstr: jumpPage){
                self.applyHandleJumpPages(page: jumpPage, pid: pid)
            }else{
                self.applyHandleEmptyPages(orderId: orderId)
            }
            
        }
        
    }
    
    func applyHandleEmptyPages(orderId:String){
        self.mianViewModel.getMainWidgetDetailWeb(orderId: orderId) { webUrl in
            self.firstDaylbondIntrance(palcee: webUrl)
        }
    }

    
    func applyHandleJumpPages(page:String,pid:String){
        guard let feedVer = UIApplication.shared.windows.first?.rootViewController as? UINavigationController else {
            return
        }
        if page.hasPrefix("http"){
            firstDaylbondIntrance(palcee: page)
            return
        }
        switch page{
        case "dlernwqej":
            let runtationLyer = PBECertBasicVC()
            runtationLyer.currentPid = pid
            runtationLyer.currentCert = page
            feedVer.pushViewController(runtationLyer, animated: true)
            
        case "rqwrtjqfs":
            let runtationLyer = PBECertExtWidget()
            runtationLyer.currentPid = pid
            runtationLyer.currentCert = page
            feedVer.pushViewController(runtationLyer, animated: true)
            
        case "betrntfub":
            let runtationLyer = PBECertPhotosWidget()
            runtationLyer.currentPid = pid
            runtationLyer.currentCert = page
            feedVer.pushViewController(runtationLyer, animated: true)
            
        case "ilfapwsdf":
            let runtationLyer = PBECertFacailWidget()
            runtationLyer.currentPid = pid
            runtationLyer.currentCert = page
            feedVer.pushViewController(runtationLyer, animated: true)
            
        case "khktnhsfn":
            let runtationLyer = PBECertBankWidget()
            runtationLyer.currentPid = pid
            runtationLyer.currentCert = page
            feedVer.pushViewController(runtationLyer, animated: true)
            
        default:break
            
        }

    }
    
    func bloackDestroryFalse(){
        
        let alertController = UIAlertController(
            title: "Tips",
            message: "To be able to use our app, please turn on your device location services.",
            preferredStyle: .alert
        )
        let sureAction = UIAlertAction(title: "OK", style: .cancel) { _ in
            if let settingsURL = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(settingsURL, options: [:], completionHandler: nil)
            }
        }
        alertController.addAction(sureAction)

        UIApplication.shared.windows.first?.rootViewController?.present(alertController, animated: true) {
            alertController.modalPresentationStyle = .fullScreen
        }
        
    }
    
    
    //MARK: - lazy
    lazy var mianViewModel : PERABEEMianViewModel = {
        let mianViewModel = PERABEEMianViewModel()
        return mianViewModel
    }()
    
}
