//
//  PERABEEMianViewModel.swift
//  PeraBee
//
//  Created by Cris on 2024/10/6.
//

import UIKit

class PERABEEMianViewModel{
    var mainDataArray:[JSON] = []
    var sionViewData: JSON = JSON()
    let getHomepageData = "/xjuPigeontailUzf"
    let getHomepagePopData = "/xjuRelegationUzf"
    let getHomepageApplyData = "/xjuOverwashUzf"
    let getHomepageUpdataLocationInfo = "/xjuNoyauUzf"
    let getHomepageApplyDetail = "/xjuWeaklinessUzf"
    let getHomePageOrderIDJumpWeb = "/xjuResedaceousUzf"
    func getMainWidgetData(result: @escaping (Bool) -> Void) {
        PBEEFireManWorkLates.kimos.momentTgpGloable(miaorle: getHomepageData,ppleoabr: nil,load:true) { suc in
            self.homeHandleDataDic(dataDic: suc.feedBaseCall, success: result)
        } fai: { errorStr in
            
        }
    }
    
    func homeHandleDataDic(dataDic: JSON, success: @escaping (Bool) -> Void){
       
        let homeDataArr = dataDic["rxpErpJqj"].arrayValue
        if homeDataArr.count == 0 {
            success(false)
            return
        }
        
        self.mainDataArray.removeAll()
        var isShowSmallCard = false
        homeDataArr.forEach { obj in
            let rxpOsculateJqj = obj["rxpOsculateJqj"].stringValue
            switch rxpOsculateJqj {
            case "rdjgmoxpv":
                var jsonModel : JSON = obj["rxpCowbaneJqj"].arrayValue.first!
                jsonModel["cityLand"].stringValue = rxpOsculateJqj
                jsonModel["height"].intValue = 340
                jsonModel["floor"].intValue = 1
                self.mainDataArray.append(jsonModel)
            case "maeipcdwu":
                isShowSmallCard = true
                var jsonModel : JSON = obj["rxpCowbaneJqj"].arrayValue.first!
                jsonModel["cityLand"].stringValue = rxpOsculateJqj
                jsonModel["height"].intValue = 214
                jsonModel["floor"].intValue = 2
                self.mainDataArray.append(jsonModel)
                
            case "irgepczto":
                var jsonModel : JSON = obj["rxpCowbaneJqj"].arrayValue.first!
                jsonModel["cityLand"].stringValue = rxpOsculateJqj
                jsonModel["height"].intValue = 64
                jsonModel["floor"].intValue = 3
                self.mainDataArray.append(jsonModel)
                
            case "efsidydua"://banner
                var jsonModel : JSON = obj
                jsonModel["cityLand"].stringValue = rxpOsculateJqj
                jsonModel["height"].intValue = 128
                jsonModel["floor"].intValue = 4
                self.mainDataArray.append(jsonModel)
            case "wxcsznmaz":
                let jsonArray = obj["rxpCowbaneJqj"].arrayValue
                jsonArray.forEach { itemjson in
                    var itemjson = itemjson
                    itemjson["cityLand"].stringValue = rxpOsculateJqj
                    itemjson["height"].intValue = 134
                    itemjson["floor"].intValue = 5
                    self.mainDataArray.append(itemjson)
                }
            
            default:
               break
                
            }
        }
        
        self.mainDataArray.sort { $0["floor"].intValue < $1["floor"].intValue }
        
        if !isShowSmallCard { // 宣传图
            var jsonModel = JSON()
            jsonModel["cityLand"] = "rdjgmoxpJ"
            jsonModel["height"].intValue = 252
            self.mainDataArray.append(jsonModel)
        }
        
        var jsonModel = JSON()//底部SEC
        jsonModel["cityLand"] = "rdjgmoxpSec"
        jsonModel["height"].intValue = 68
        self.mainDataArray.append(jsonModel)
        self.sionViewData = dataDic["rxpBureaucratizeJqj"]
        success(true)
    }
    
    
    func getMainWidgetPOPViewData(result: @escaping (JSON) -> Void) {
        PBEEFireManWorkLates.kimos.momentTgpGloable(miaorle: getHomepagePopData,ppleoabr: nil,load:false) { suc in
            if  suc.kelomiyas == 0{
                result(suc.feedBaseCall)
            }
        } fai: { errorStr in
            
        }
    }
    
    func getMainWidgetApplyData(pid:String, result: @escaping (JSON) -> Void){
        PBEEFireManWorkLates.kimos.mengingWidgetFocerts(xinbe: getHomepageApplyData, tracking: ["rxpTrombonistJqj":pid,"rxpGizmoJqj":bounldeCHJeide(beikkoenCeiaol: 8)],ibloadfod: true) { suc in
            if suc.kelomiyas == 0 {
                result(suc.feedBaseCall)
            }
        } ffBoom: { errorStr in
        
        }

    }

    
    func getMainWidgetApplyDetail(pid:String, result: @escaping (_ orderId:String, _ jumpPage: String) -> Void){
        PBEEFireManWorkLates.kimos.mengingWidgetFocerts(xinbe: getHomepageApplyDetail, tracking:["rxpTrombonistJqj": pid],ibloadfod: true) { suc in
            if suc.kelomiyas == 0 {
                result(suc.feedBaseCall["rxpStepperJqj"]["rxpUndulateJqj"].stringValue, suc.feedBaseCall["rxpBackstrokeJqj"]["excuse"].stringValue)
            }
            
        } ffBoom: { errorStr in
            
        }
        
    }
    
    func getMainWidgetDetailWeb(orderId: String,result: @escaping (_ webUrl:String) -> Void){
        
        PBEEFireManWorkLates.kimos.mengingWidgetFocerts(xinbe: getHomePageOrderIDJumpWeb, tracking:["rxpPreoralJqj": orderId,"rxpHeliotherapyJqj":7, "rxpOchlocracyJqj":"dddd","rxpAntitypeJqj":bounldeCHJeide(beikkoenCeiaol: 10)],ibloadfod: true) { suc in
            if suc.kelomiyas == 0 {
                result(suc.feedBaseCall["rxpOctonaryJqj"].stringValue)
            }
            
        } ffBoom: { errorStr in
            
        }
    }
    
    
}
