//
//  KDeviceInfo.swift
//  DeviceLib
//
//  Created by hao on 2024/12/28.
//

import UIKit

public class KDeviceInfo: NSObject {
    
    public static func deviceInfoString(idfv:String, networkTyps:String ,aesKey:String) -> String {
        let info = KDeviceManager.getInfoString(iv:idfv, wf: networkTyps,aesKey: aesKey)
        return info
    }
}
