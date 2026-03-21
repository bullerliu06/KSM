//
//  PBEEDefaultRunsClearVibs.swift
//  PeraBee
//
//  Created by Sibs on 2024/10/7.
//

class PBEEDefaultRunsClearVibs {
    static var appid:String {
        get{
            return UserDefaults.standard.string(forKey: "appid") ?? ""
        }
        set{
            UserDefaults.standard.set(newValue, forKey: "appid")
        }
        
    }
    
    static var name:String {
        get{
            return UserDefaults.standard.string(forKey: "name") ?? ""
        }
        set{
            UserDefaults.standard.set(newValue, forKey: "name")
        }
        
    }
    static var isStore:Bool {
        get{
            return UserDefaults.standard.bool(forKey: "isStore")
        }
        set{
            UserDefaults.standard.set(newValue, forKey: "isStore")
        }
    }
    
    static var isLogin:Bool {
        return !appid.isEmpty
    }
    
    static func toLogin() {
        clear()
        let nav = UIApplication.shared.windows.first?.rootViewController as! UINavigationController
        let topPage = nav.topViewController
        let page = PBEEZeroMastWidget()
        page.modalPresentationStyle = .fullScreen
        topPage?.present(page, animated: true)
    }
    
    static func clear() {
        appid = ""
        name = ""
        isStore = false
        
    }
    
}
