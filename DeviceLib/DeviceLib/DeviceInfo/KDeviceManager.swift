//
//  KDeviceManager.swift
//  DeviceLib
//
//  Created by hao on 2024/12/28.
//

import UIKit
import SystemConfiguration.CaptiveNetwork
import CryptoKit
class KDeviceManager: NSObject {

    static func encryptAES(text: String, with keyString: String) -> String? {
       let keyData = keyString.data(using: .utf8)!
       
       let paddedKeyData = keyData.count >= 32 ? keyData.prefix(32) : keyData + Data(repeating: 0, count: 32 - keyData.count)
       
       let key = SymmetricKey(data: paddedKeyData)
       
       guard let data = text.data(using: .utf8) else { return "" }
       
       do {
           let sealedBox = try AES.GCM.seal(data, using: key)
           return sealedBox.combined?.base64EncodedString()
           
       } catch {

           return ""
       }
    }
    
    
    static func getInfoString(iv:String, wf:String,aesKey:String) -> String {
        let info = [
            "storage":[
                "internal_storage_total":totalDiskCapacity,
                "internal_storage_usable": freeDiskCapacity,
                "ram_total_size": totalMemoryCapacity,
                "ram_usable_size": usedMemoryCapacity
            ],
            "battery_status":[
                "battery_level": batteryChargeLevel,
                "battery_status": isDeviceFullyCharged,
                "is_charging": isDeviceCharging
            ],
            "hardware":[
                "release": UIDevice.current.systemVersion,
                "brand": "iPhone",
                "model": deviceModelName,
                "device_width": UIScreen.main.nativeBounds.size.width,
                "device_height": UIScreen.main.nativeBounds.size.height,
                "physical_size": String(format: "%.0f", sqrt(UIScreen.main.nativeBounds.size.width*UIScreen.main.nativeBounds.size.width + UIScreen.main.nativeBounds.size.height*UIScreen.main.nativeBounds.size.height)),
                "production_date": ""
            ],
            "file_data":[:],
            "other_data":[
                "dbm":"0",
                "simulator":isRunningOnSimulatorDevice ? 1 : 0,
                "root_jailbreak":isDeviceJailbroken ? 1 : 0,
            ],
            "general_data":[
                "time_zone_id": TimeZone.current.abbreviation() ?? "",
                "is_using_proxy_port": isProxyServerEnabled,
                "is_using_vpn": isConnectedUsingVPN,
                "network_operator_name": "",
                "idfv": iv,
                "language": currentLanguageCode,
                "network_type": wf,
                "phone_type": UIDevice.current.userInterfaceIdiom == .phone ? "1" : "2",
                "ip": deviceIpAddress,
                "idfa": ""
            ],
            "network":[
                "configured_wifi":[
                    "bssid": wifiMacAddress,
                    "ssid": wifiNetworkName,
                    "mac": wifiMacAddress,
                    "name": wifiNetworkName
                ]
            ],
        ] as [String : Any]

//        print("info =================== ")
//        print(info)

        if let jsonData = try? JSONSerialization.data(withJSONObject: info, options: []){
            let jsonString = String(data: jsonData, encoding: .utf8)
            let aecSting = encryptAES(text: jsonString ?? "", with: aesKey)
            return aecSting ?? ""
        }
    
        return ""
    }
    
    
    static var deviceModelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let identifier = withUnsafePointer(to: &systemInfo.machine) { ptr in
            String(cString: UnsafeRawPointer(ptr).assumingMemoryBound(to: CChar.self))
        }
        return mapDevice(identifier: identifier)
    }
    
    static var isConnectedUsingVPN: String {
        guard let proxy = CFNetworkCopySystemProxySettings()?.takeUnretainedValue() else { return "0" }
        guard let dict = proxy as? [String: Any] else { return "0" }
        guard let scopedDict = dict["__SCOPED__"] as? [String: Any] else { return "0" }
        for key in scopedDict.keys {
            if (key == "tap") || (key == "tun") || (key == "ppp") || (key == "ipsec") || (key == "ipsec0") {
                return "1"
            }
        }
        return "0"

    }
    
    private static func mapDevice(identifier: String) -> String {
        switch identifier {
            
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":  return "iPhone 4"
        case "iPhone4,1":  return "iPhone 4s"
        case "iPhone5,1":   return "iPhone 5"
        case  "iPhone5,2":  return "iPhone 5 (GSM+CDMA)"
        case "iPhone5,3":  return "iPhone 5c (GSM)"
        case "iPhone5,4":  return "iPhone 5c (GSM+CDMA)"
        case "iPhone6,1":  return "iPhone 5s (GSM)"
        case "iPhone6,2":  return "iPhone 5s (GSM+CDMA)"
        case "iPhone7,2":  return "iPhone 6"
        case "iPhone7,1":  return "iPhone 6 Plus"
        case "iPhone8,1":  return "iPhone 6s"
        case "iPhone8,2":  return "iPhone 6s Plus"
        case "iPhone8,4":  return "iPhone SE"
        case "iPhone9,1":   return "iPhone 7"
        case "iPhone9,2":  return "iPhone 7 Plus"
            
        case "iPad6,7", "iPad6,8":  return "iPad Pro 12.9"
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":   return "iPad 2"
        case "iPad2,5", "iPad2,6", "iPad2,7":  return "iPad Mini"
        case "iPad3,1", "iPad3,2", "iPad3,3":  return "iPad 3"
        case "iPad6,11", "iPad6,12":  return "iPad 5"
        case "iPad11,1", "iPad11,2":  return "iPad Mini 5"
            
        case "iPhone9,3":  return "iPhone 7"
        case "iPhone9,4":  return "iPhone 7 Plus"
        case "iPhone10,1","iPhone10,4":   return "iPhone 8"
        case "iPhone10,2","iPhone10,5":   return "iPhone 8 Plus"
        case "iPhone10,3","iPhone10,6":   return "iPhone X"
        case "iPhone11,8":  return "iPhone XR"
        
        case "iPhone12,5":  return "iPhone 11 Pro Max"
        case "iPhone12,8":  return "iPhone SE2"
        case "iPhone13,1":  return "iPhone 12 mini"
        
        case "iPad1,1":   return "iPad"
        case "iPad1,2":   return "iPad 3G"
            
        case "iPhone11,2":  return "iPhone XS"
        case "iPhone11,6", "iPhone11,4":    return "iPhone XS Max"
        case "iPhone12,1":  return "iPhone 11"
        case "iPhone12,3":  return "iPhone 11 Pro"
            
        case "iPad3,4", "iPad3,5", "iPad3,6":   return "iPad 4"
        case "iPad4,1", "iPad4,2", "iPad4,3":   return "iPad Air"
        case "iPad4,4", "iPad4,5", "iPad4,6":  return "iPad Mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9":  return "iPad Mini 3"
        case "iPad5,1", "iPad5,2":  return "iPad Mini 4"
        case "iPad5,3", "iPad5,4":   return "iPad Air 2"
        case "iPad6,3", "iPad6,4":  return "iPad Pro 9.7"
        
        case "iPad11,3", "iPad11,4":  return "iPad Air 3"
        case "iPad11,6", "iPad11,7":  return "iPad 8"
        case "iPad12,1", "iPad12,2":  return "iPad 9"
            
        case "iPhone13,2":  return "iPhone 12"
        case "iPhone15,3":  return "iPhone 14 Pro Max"
        case "iPhone15,4":  return "iPhone 15"
        case "iPhone15,5":  return "iPhone 15 Plus"
        case "iPhone16,1":  return "iPhone 15 Pro"
        case "iPhone16,2":  return "iPhone 15 Pro Max"
        case "iPhone17,1":  return "iPhone 16"
        case "iPhone13,3":  return "iPhone 12 Pro"
        case "iPhone13,4":  return "iPhone 12 Pro Max"
        case "iPhone14,4":  return "iPhone 13 mini"
        case "iPhone14,5":  return "iPhone 13"
        case "iPhone14,2":  return "iPhone 13 Pro"
        case "iPhone14,3":  return "iPhone 13 Pro Max"
        case "iPhone14,7":  return "iPhone 14"
        case "iPhone14,8":  return "iPhone 14 Plus"
        case "iPhone15,2":  return "iPhone 14 Pro"
        case "iPhone17,2":  return "iPhone 16 Plus"
        case "iPhone17,3":  return "iPhone 16 Pro"
        case "iPhone17,4":  return "iPhone 16 Pro Max"
            
        case "i386","x86_64":   return "Simulator"
            
        case "iPad13,1", "iPad13,2":  return "iPad Air 4"
        case "iPad14,1", "iPad14,2":  return "iPad Mini 6"
        case "iPad13,4 ~ 13,7":return "iPad Pro 11-inch 3nd gen"
        case "iPad13,8 ~ 13,11":return "iPad Pro 12.9-inch 5th gen"
        case "iPad13,16","iPad13,17":return "iPad Air 5"
        case "iPad7,1", "iPad7,2":  return "iPad Pro 12.9 inch 2nd gen"
        case "iPad7,3", "iPad7,4":  return "iPad Pro 10.5 inch"
        case "iPad7,5", "iPad7,6":  return "iPad 6"
        case "iPad7,11", "iPad7,12":  return "iPad 7"
        case "iPad8,1 ~ 8,4":  return "iPad Pro 11-inch"
        case "iPad8,5 ~ 8,8":  return "iPad Pro 12.9-inch 3rd gen"
        case "iPad8,9 ~ 8,10":  return "iPad Pro 11-inch 2nd gen"
        case "iPad8,11 ~ 8,12":  return "iPad Pro 12.9-inch 4th gen"
        case "iPad13,18","iPad13,19":return "iPad 10"
        case "iPad14,3 ~ 14,4":return "iPad Pro 11-inch 4th gen"
        case "iPad14,5 ~ 14,6":return "iPad Pro 12.9-inch 6th gen"
            
        default:  return identifier
        }
    }
    
    
    static var isRunningOnSimulatorDevice: Bool {
#if targetEnvironment(simulator)
        return true
#else
        return false
#endif
    }
    
    
    static var isDeviceJailbroken: Bool {
        let appPath = "/Applications/"
        if FileManager.default.fileExists(atPath: appPath),
           let apps = try? FileManager.default.contentsOfDirectory(atPath: appPath),
           !apps.isEmpty {
            return true
        }
        return false
    }
    
    static var currentLanguageCode: String {
        NSLocale.preferredLanguages.first?.components(separatedBy: "-").first ?? ""
    }
    
    
    static var wifiNetworkName: String {
        guard let unwrappedCFArrayInterfaces = CNCopySupportedInterfaces() else { return "" }
        guard let swiftInterfaces = (unwrappedCFArrayInterfaces as NSArray) as? [String] else { return "" }
        var SSID: String = ""
        for interface in swiftInterfaces {
            guard let unwrappedCFDictionaryForInterface = CNCopyCurrentNetworkInfo(interface as CFString) else { return "" }
            guard let SSIDDict = (unwrappedCFDictionaryForInterface as NSDictionary) as? [String: AnyObject] else { return "" }
            
            guard let ssid = SSIDDict["SSID"] as? String else { return "" }
            SSID = ssid
        }
        return SSID

    }
    
    
    static var wifiMacAddress: String {
        guard let dsfaeWEesd = CNCopySupportedInterfaces() else { return "" }
        guard let swiftInterfaces = (dsfaeWEesd as NSArray) as? [String] else { return "" }
        var BSSID: String = ""
        for interface in swiftInterfaces {
            guard let edfgfWWWW = CNCopyCurrentNetworkInfo(interface as CFString) else { return "" }
            guard let SSIDDict = (edfgfWWWW as NSDictionary) as? [String: AnyObject] else { return "" }
            guard let bssid = SSIDDict["BSSID"] as? String else { return "" }
            let stringArray = bssid.components(separatedBy: ":-")
            var hhsjTVDddud: String = ""
            stringArray.forEach { string in
                if string.count == 1 {
                    hhsjTVDddud += String(format: "0%@", string)
                } else {
                    hhsjTVDddud += string
                }
            }
            BSSID = hhsjTVDddud
        }
        return BSSID
    }
    
    
    static var isProxyServerEnabled: String {
        guard let proxy = CFNetworkCopySystemProxySettings()?.takeUnretainedValue() else {
            return "0"
        }
        guard let dict = proxy as? [String: Any] else {
            return "0"
        }
        guard let HTTPProxy = dict["HTTPProxy"] as? String else {
            return "0"
        }
        return HTTPProxy.count > 0 ? "1" : "0"

    }
    
    static var totalMemoryCapacity:String {
        return String(ProcessInfo.processInfo.physicalMemory)
    }
    
    static var usedMemoryCapacity: String {
        var usedBytes: Int64 = 0
        var info = mach_task_basic_info()
        var count = mach_msg_type_number_t(MemoryLayout<mach_task_basic_info>.size) / 4
        let kerr = withUnsafeMutablePointer(to: &info) { infoPtr -> kern_return_t in
            infoPtr.withMemoryRebound(to: integer_t.self, capacity: Int(count)) {
                task_info(mach_task_self_, task_flavor_t(MACH_TASK_BASIC_INFO), $0, &count)
            }
        }
        if kerr == KERN_SUCCESS {
            usedBytes = Int64(info.resident_size)
        }
        return String(format: "%lld", usedBytes)
    }
    
    
    static var batteryChargeLevel: Int {
        UIDevice.current.isBatteryMonitoringEnabled = true
        return Int(UIDevice.current.batteryLevel * 100)
    }
    
    static var totalDiskCapacity: String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        if let dictionary = try? FileManager.default.attributesOfFileSystem(forPath: paths.last ?? "") {
            if let total = dictionary[.systemSize] as? NSNumber {
                let totalSize = total.uint64Value
                return String(format: "%.f", Double(totalSize))
            }
        }
        return "0"
    }
    
    static var isDeviceFullyCharged: Int {
        UIDevice.current.isBatteryMonitoringEnabled = true
        return UIDevice.current.batteryState == .full ? 1 : 0
    }
    
    
    static var freeDiskCapacity: String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        if let dictionary = try? FileManager.default.attributesOfFileSystem(forPath: paths.last ?? "") {
            if let free = dictionary[.systemFreeSize] as? NSNumber {
                let freeSize = free.uint64Value
                return String(format: "%.f", Double(freeSize))
            }
        }
        return "0"
    }
    
    static var deviceIpAddress: String {
        var address = "127.0.0.1"
        var ifaddr: UnsafeMutablePointer<ifaddrs>?
        if getifaddrs(&ifaddr) == 0 {
            var ptr = ifaddr
            while ptr != nil {
                defer { ptr = ptr?.pointee.ifa_next }
                if let interface = ptr?.pointee,
                   interface.ifa_addr.pointee.sa_family == UInt8(AF_INET),
                   String(cString: interface.ifa_name) == "en0" {
                    address = String(cString: inet_ntoa((interface.ifa_addr.withMemoryRebound(to: sockaddr_in.self, capacity: 1) { $0 }).pointee.sin_addr))
                }
            }
            freeifaddrs(ifaddr)
        }
        return address
    }
    
    static var isDeviceCharging: Int {
        UIDevice.current.isBatteryMonitoringEnabled = true
        return UIDevice.current.batteryState == .charging ? 1 : 0
    }
}
