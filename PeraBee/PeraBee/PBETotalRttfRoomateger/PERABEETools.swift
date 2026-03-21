//
//  PERABEETools.swift
//  PeraBee
//
//  Created by Cris on 2024/10/3.
//

import UIKit
import CryptoKit

@_exported import SwiftyJSON
@_exported import Kingfisher
@_exported import SnapKit
@_exported import IQKeyboardManagerSwift


typealias PERStringBlock = (_ result: String) -> Void
typealias PERIntBlock = (_ result: Int) -> Void
typealias PERDefaultBlock = () -> Void
var sionView = PERABEEMainWidgetSionView.shared

func hex(_ hexString: String,alpha:CGFloat = 1.0) -> UIColor {
    var cleanString = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    if cleanString.hasPrefix("#") {
        cleanString.removeFirst()
    }
    guard cleanString.count == 6 else {
        print("Invalid hex string length: \(cleanString)")
        return .clear
    }
    var rgbValue: UInt64 = 0
    guard Scanner(string: cleanString).scanHexInt64(&rgbValue) else {
        print("Failed to scan hex string: \(cleanString)")
        return .clear
    }
    let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
    let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
    let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
    
    return UIColor(red: red, green: green, blue: blue, alpha: alpha)
}

func timePeraBeeStart() ->String{
    String(format: "%.0f", Date().timeIntervalSince1970 * 1000)
}

func PBEERobotoBb(size:CGFloat) ->UIFont{
    let franklin = UIFont(name: "Roboto", size: size)
    return franklin ?? UIFont.systemFont(ofSize: size, weight: .bold)
}

func peErasITC(size:CGFloat) ->UIFont{
    let franklin = UIFont(name: "MPLUS2-ExtraBold", size: size)
    return franklin ?? UIFont.systemFont(ofSize: size, weight: .bold)
}

func PBEEMPLUS2m(_ size:CGFloat) ->UIFont{
    return UIFont(name: "MPLUS2-Medium", size: size) ?? UIFont.systemFont(ofSize: size, weight: .medium)
}

func remakeUi(withUnkownstr builds:String?=nil) ->Bool{
    if builds == nil{
        return false
    }
    if builds!.isEmpty{
        return false
    }
    if  builds == "" {
        return false
    }
    return true
}

 func destorySVeirlae(foremer: String, killesae keyString: String) -> String? {
    let keyData = keyString.data(using: .utf8)!
    
    let paddedKeyData = keyData.count >= 32 ? keyData.prefix(32) : keyData + Data(repeating: 0, count: 32 - keyData.count)
    
    let key = SymmetricKey(data: paddedKeyData)
    
    guard let encryptedData = Data(base64Encoded: foremer) else { return "" }
    
    do {
        let sealedBox = try AES.GCM.SealedBox(combined: encryptedData)
        let decryptedData = try AES.GCM.open(sealedBox, using: key)
        return String(data: decryptedData, encoding: .utf8)
    } catch {
        return ""
    }
}

func bounldeCHJeide(beikkoenCeiaol length: Int) -> String {
    let uuidString = UUID().uuidString.replacingOccurrences(of: "-", with: "")
    return String(uuidString.prefix(length))

}
    
func PBEE_PR(_ size:CGFloat) ->UIFont{
    return UIFont(name: "PingFang SC-Regular", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
}


func beyoundFeidom(bbeset object: Any) -> String? {
    guard let jsonData = try? JSONSerialization.data(withJSONObject: object, options: []) else {
        return nil
    }
    return String(data: jsonData, encoding: .utf8)
}
