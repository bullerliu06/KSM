//
//  PERABEEDeviceTool.swift
//  PeraBee
//
//  Created by Cris on 2024/10/7.
//

import UIKit
import DeviceLib
import Alamofire
import KeychainAccess

let PENaredkTasek = "0YtcJ5lE9z8S3Ya5"

let CoreadNEsteesklior = "CoreadNEsteesklior"

class PERABEEDeviceTool {
    
    static func getIDFV() -> String{
        let keychain = Keychain(service: Bundle.main.bundleIdentifier ?? "")
        var idfvStr = try? keychain.get("UUID")
        if idfvStr == nil || idfvStr == ""{
            idfvStr =  UIDevice.current.identifierForVendor?.uuidString ?? ""
            do { try keychain.set(idfvStr ?? "", key: "UUID") } catch {}
        }
        return idfvStr ?? ""
    }
    
    static func updataDeviceinfo(){
        let infostr = KDeviceInfo.deviceInfoString(idfv: getIDFV(), networkTyps:PBEEFireManWorkLates.kimos.bufocar, aesKey: PENaredkTasek)
        //        let aesStr  = decryptAES(base64Text: infostr, with: deviceinAesKey)
        //        print("lw=====>",aesStr ?? "")
        if remakeUi(withUnkownstr: infostr){
            PBEEFireManWorkLates.kimos.mengingWidgetFocerts(xinbe: eQuesyUpdelatex, tracking: ["rxpPolyarticularJqj":infostr, "encrypt_type": 1]) { suc in
                
            } ffBoom: { errorStr in
                
            }
            
        }
    }
    
    static func updatxjuCharilyUzfMark(){
        
        PBEEFireManWorkLates.kimos.mengingWidgetFocerts(xinbe: PromtaeFaceIdfFeed, tracking: ["rxpDollfaceJqj":getIDFV(), "rxpMonarchicalJqj": ""]) { suc in
            
        } ffBoom: { errorStr in
            
        }
    }
    
}

extension String{
    func getappVersion() ->String {
        
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0.0"
    }
    
    func getAppiphoneVersion() ->String {
        
        return UIDevice.current.systemVersion
    }
    
    func getAppbundleId() ->String {
        
        return  Bundle.main.bundleIdentifier ?? ""
    }
    
    
    func getAppDeviceName() -> String{
        
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { asaee, element in
            guard let value = element.value as? Int8 , value != 0 else { return asaee }
            return asaee + String(UnicodeScalar(UInt8(value)))
        }
        
        switch identifier {
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":   return "iPad 2"
        case "iPad2,5", "iPad2,6", "iPad2,7":  return "iPad Mini"
        case  "iPhone5,2":  return "iPhone 5 (GSM+CDMA)"
        
        case "iPod3,1":  return "iPod Touch 3"
        case "AppleTV2,1":  return "Apple TV 2"
            
        case "iPod4,1":  return "iPod Touch 4"
        case "iPod5,1":  return "iPod Touch 5"
        case "iPhone5,3":  return "iPhone 5c (GSM)"
        case "iPhone5,4":  return "iPhone 5c (GSM+CDMA)"
        case "iPod1,1":  return "iPod Touch 1"
        case "iPod2,1":  return "iPod Touch 2"
        case "iPod7,1":   return "iPod Touch 6"
        case "iPod9,1":   return "iPod Touch 7"
            
        
        case "AppleTV3,1","AppleTV3,2":  return "Apple TV 3"
        case "AppleTV5,3":   return "Apple TV 4"
            
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":  return "iPhone 4"
        case "iPhone4,1":  return "iPhone 4s"
        case "iPhone5,1":   return "iPhone 5"
        
        case "iPhone9,2":  return "iPhone 7 Plus"
            
        case "iPad6,7", "iPad6,8":  return "iPad Pro 12.9"
        
        case "iPhone6,1":  return "iPhone 5s (GSM)"
        case "iPhone6,2":  return "iPhone 5s (GSM+CDMA)"
        case "iPhone7,2":  return "iPhone 6"
        case "iPhone7,1":  return "iPhone 6 Plus"
        case "iPhone8,1":  return "iPhone 6s"
        case "iPhone8,2":  return "iPhone 6s Plus"
        case "iPhone8,4":  return "iPhone SE"
        case "iPhone9,1":   return "iPhone 7"
        case "iPad3,1", "iPad3,2", "iPad3,3":  return "iPad 3"
        case "iPad6,11", "iPad6,12":  return "iPad 5"
        case "iPad11,1", "iPad11,2":  return "iPad Mini 5"
            
        case "iPhone9,3":  return "iPhone 7"
        case "iPhone9,4":  return "iPhone 7 Plus"
        case "iPhone10,1","iPhone10,4":   return "iPhone 8"
        
        case "iPhone12,8":  return "iPhone SE2"
        case "iPhone13,1":  return "iPhone 12 mini"
        
        case "iPad1,1":   return "iPad"
        case "iPad1,2":   return "iPad 3G"
        case "iPhone14,5":  return "iPhone 13"
        case "iPhone14,2":  return "iPhone 13 Pro"
        case "iPhone14,3":  return "iPhone 13 Pro Max"
        case "iPhone15,5":  return "iPhone 15 Plus"
        case "iPad3,4", "iPad3,5", "iPad3,6":   return "iPad 4"
        case "iPhone10,2","iPhone10,5":   return "iPhone 8 Plus"
        case "iPhone10,3","iPhone10,6":   return "iPhone X"
        case "iPhone11,8":  return "iPhone XR"
        case "iPhone11,2":  return "iPhone XS"
        case "iPhone11,6", "iPhone11,4":    return "iPhone XS Max"
        case "iPhone12,1":  return "iPhone 11"
        case "iPhone12,3":  return "iPhone 11 Pro"
        case "iPhone12,5":  return "iPhone 11 Pro Max"
        case "iPad4,1", "iPad4,2", "iPad4,3":   return "iPad Air"
        
        case "iPad5,3", "iPad5,4":   return "iPad Air 2"
        case "iPad6,3", "iPad6,4":  return "iPad Pro 9.7"
        
        case "iPad11,3", "iPad11,4":  return "iPad Air 3"
        case "iPad11,6", "iPad11,7":  return "iPad 8"
        case "iPad4,4", "iPad4,5", "iPad4,6":  return "iPad Mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9":  return "iPad Mini 3"
        case "iPad5,1", "iPad5,2":  return "iPad Mini 4"
        case "iPad12,1", "iPad12,2":  return "iPad 9"
            
        case "iPhone13,2":  return "iPhone 12"
        case "iPhone15,3":  return "iPhone 14 Pro Max"
        case "iPhone15,4":  return "iPhone 15"
        case "iPhone13,4":  return "iPhone 12 Pro Max"
        case "iPhone14,4":  return "iPhone 13 mini"
        
        case "iPhone16,1":  return "iPhone 15 Pro"
        case "iPhone16,2":  return "iPhone 15 Pro Max"
        case "iPhone17,1":  return "iPhone 16"
        case "iPhone13,3":  return "iPhone 12 Pro"
        
        case "iPhone14,7":  return "iPhone 14"
        case "iPhone14,8":  return "iPhone 14 Plus"
        case "iPhone15,2":  return "iPhone 14 Pro"
        case "iPad8,1 ~ 8,4":  return "iPad Pro 11-inch"
        case "iPad8,5 ~ 8,8":  return "iPad Pro 12.9-inch 3rd gen"
        case "iPad8,9 ~ 8,10":  return "iPad Pro 11-inch 2nd gen"
        case "iPad8,11 ~ 8,12":  return "iPad Pro 12.9-inch 4th gen"
        case "iPhone17,2":  return "iPhone 16 Plus"
        case "iPhone17,3":  return "iPhone 16 Pro"
        case "iPhone17,4":  return "iPhone 16 Pro Max"
            
        case "i386","x86_64":   return "Simulator"
            
        case "iPad13,1", "iPad13,2":  return "iPad Air 4"
        
        case "iPad13,16","iPad13,17":return "iPad Air 5"
        case "iPad7,1", "iPad7,2":  return "iPad Pro 12.9 inch 2nd gen"
        case "iPad7,3", "iPad7,4":  return "iPad Pro 10.5 inch"
        case "iPad7,5", "iPad7,6":  return "iPad 6"
        
        case "iPad14,3 ~ 14,4":return "iPad Pro 11-inch 4th gen"
        case "iPad7,11", "iPad7,12":  return "iPad 7"
        
        case "iPad13,18","iPad13,19":return "iPad 10"
        case "iPad14,1", "iPad14,2":  return "iPad Mini 6"
        case "iPad13,4 ~ 13,7":return "iPad Pro 11-inch 3nd gen"
        case "iPad13,8 ~ 13,11":return "iPad Pro 12.9-inch 5th gen"
        case "iPad14,5 ~ 14,6":return "iPad Pro 12.9-inch 6th gen"
            
        default:  return identifier
        }
    }
}
