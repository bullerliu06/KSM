//
//  PBEEFireManWorkLates.swift
//  CreditPro
//
//  Created by Sibs on 2024/10/3.
//


import Alamofire

class PBEEFireManWorkLates {
    static let kimos = PBEEFireManWorkLates()
    var bufocar = ""
    private init() {}
    private let ablity = NetworkReachabilityManager()
    
    func startNetworkMonitor() {
        ablity?.startListening(onUpdatePerforming: { status in
                switch status {
                case .notReachable,.unknown:
                    self.bufocar = ""
                case .reachable(.cellular):
                    self.bufocar = "4G"
                    PERABEEDeviceTool.updatxjuCharilyUzfMark()
                    NotificationCenter.default.post(name: Notification.Name(CoreadNEsteesklior), object: nil, userInfo: nil)
                case .reachable(.ethernetOrWiFi):
                    self.bufocar = "WIFI"
                    NotificationCenter.default.post(name: Notification.Name(CoreadNEsteesklior), object: nil, userInfo: nil)
                    PERABEEDeviceTool.updatxjuCharilyUzfMark()
                }
            })
        }
    
    func momentTgpGloable(miaorle: String,
                    ppleoabr: [String: Any]? = nil,
                    hearbssd: HTTPHeaders? = nil,
                    load:Bool = false,
                    suc: @escaping (_ suc: PBEERuuner) -> Void,
                    fai: @escaping (_ errorStr: String?) -> Void) {
        if load {
            PBEEKBlowHoldNee.show()
        }
        let urls = miaorle.addHeader
        AF.request(urls, method: .get, parameters: ppleoabr, encoding: URLEncoding.default, headers: hearbssd)
            .validate()
            .responseData { response in
                if load {
                    PBEEKBlowHoldNee.hide()
                }
                switch response.result {
                case .success(let data):
                    
                    let jsonData = JSON(data)
                    let res = PBEERuuner()
                    res.meanings = jsonData["rxpSmokechaserJqj"].stringValue
                    res.kelomiyas = jsonData["rxpBenthamismJqj"].intValue
                    res.feedBaseCall = jsonData["rxpPolyarticularJqj"]
                    
                    if res.kelomiyas == 0 {
                        suc(res)
                    }else if res.kelomiyas == -2 {
                        PBEEDefaultRunsClearVibs.toLogin()
                    }else {
                        fai(res.meanings)
                    }
                    
                    if load && (res.kelomiyas != 0){
                        toast(res.meanings)
                    }
                case .failure(let error):
                    fai(error.errorDescription)
                }
            }
    }
    
    func mengingWidgetFocerts(xinbe: String, 
                     tracking: [String: Any], 
                     hodleafpr: HTTPHeaders? = nil, 
                     ibloadfod:Bool = false,
                     ssBomm: @escaping (_ suc: PBEERuuner) -> Void,
                     ffBoom: @escaping (_ errorStr: String?) -> Void) {
        
        if ibloadfod {
            PBEEKBlowHoldNee.show()
        }
        let urls = xinbe.addHeader
        AF.request(urls, method: .post, parameters: tracking, encoding: JSONEncoding.default, headers: hodleafpr)
            .validate()
            .responseData { response in
                if ibloadfod {
                    PBEEKBlowHoldNee.hide()
                }
                switch response.result {
                case .success(let data):
                    
                    let jsonData = JSON(data)
                    let res = PBEERuuner()
                    res.kelomiyas = jsonData["rxpBenthamismJqj"].intValue
                    res.meanings = jsonData["rxpSmokechaserJqj"].stringValue
                    res.feedBaseCall = jsonData["rxpPolyarticularJqj"]
                    
                    if res.kelomiyas == 0 {
                        ssBomm(res)
                    }else if res.kelomiyas == -2 {
                        PBEEDefaultRunsClearVibs.toLogin()
                    }else {
                        ffBoom(res.meanings)
                    }
                    
                    if ibloadfod && (res.kelomiyas != 0){
                        toast(res.meanings)
                    }
                case .failure(let error):
                    ffBoom(error.errorDescription)
                }
            }
    }
    
    func ppRemovedImageVerd(Faloed: String,
                     idnfo: [String: Any]? = nil,
                     spitndeer: Data,
                     ccuud: @escaping (_ suc: PBEERuuner) -> Void,
                     ffasl: @escaping (_ errorStr: String?) -> Void) {
        
        PBEEKBlowHoldNee.show()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMddHHmmss"
        let dateString = formatter.string(from: Date())
        let picName = "am\(dateString).jpg"
        let urls = Faloed.addHeader
        
        AF.upload(multipartFormData: { formData in
            formData.append(spitndeer, withName: "am", fileName: picName, mimeType: "image/png")
            if let params = idnfo {
                for (key, value) in params {
                    if let stringValue = value as? String, let data = stringValue.data(using: .utf8) {
                        formData.append(data, withName: key)
                    } else if let intValue = value as? Int, let data = "\(intValue)".data(using: .utf8) {
                        formData.append(data, withName: key)
                    }
                }
            }
        }, to: urls, headers: ["Content-Type": "multipart/form-data"])
        .uploadProgress { progress in
            print(progress)
        }
        .response { response in
            PBEEKBlowHoldNee.hide()
            switch response.result {
            case .success(let data):
                
                let jsonData = JSON(data)
                let res = PBEERuuner()
                res.kelomiyas = jsonData["rxpBenthamismJqj"].intValue
                res.meanings = jsonData["rxpSmokechaserJqj"].stringValue
                res.feedBaseCall = jsonData["rxpPolyarticularJqj"]
                
                if res.kelomiyas == 0 {
                    ccuud(res)
                }else if res.kelomiyas == -2 {
                    toast(res.meanings)
                    PBEEDefaultRunsClearVibs.toLogin()
                }else {
                    toast(res.meanings)
                    ffasl(res.meanings)
                }

            case .failure(let error):
                toast(error.errorDescription ?? "")
                ffasl(error.errorDescription)
            }
        }
    }

}
