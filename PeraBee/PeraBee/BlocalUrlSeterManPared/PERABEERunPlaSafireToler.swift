//
//  PERABEERunPlaSafireToler.swift
//  PeraBee
//
//  Created by Cris on 2024/10/8.
//

import UIKit
import WebKit
import StoreKit

class PERABEERunPlaSafireToler: UIViewController,WKUIDelegate,WKNavigationDelegate,WKScriptMessageHandler, UIGestureRecognizerDelegate{
   
    var peraeeWebView: WKWebView!
    var uiGuester:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        setPERABEEWebViewVCUI()
        loadPERABEEWebViewVCWebUrl()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        if !sionView.isHidden{
            sionView.isHidden = true
        }
    }
    
    func setPERABEEWebViewVCUI(){
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        observeFoolker()
        view.addSubview(webViewVCNarBar)
       
        let creatGG = WKWebViewConfiguration()
        creatGG.preferences.javaScriptEnabled = true
        creatGG.preferences.javaScriptCanOpenWindowsAutomatically = false
        
        let combbom = WKUserContentController()
        ["ddvdfhvbsc1", "ddvdfhvbsc2", "ddvdfhvbsc3", "ddvdfhvbsc4", "ddvdfhvbsc5", "ddvdfhvbsc6", "ddvdfhvbsc7"].forEach {
            combbom.add(self, name: $0)
        }
        
        creatGG.userContentController = combbom
        peraeeWebView = WKWebView(frame: CGRect(x: 0, y: NavBarHeight, width: Wids, height: Heis - NavBarHeight), configuration: creatGG)
        peraeeWebView.uiDelegate = self
        peraeeWebView.navigationDelegate = self
        view.addSubview(peraeeWebView)
        view.addSubview(progress)
        peraeeWebView.addObserver(self, forKeyPath: "title", options: .new, context: nil)
        peraeeWebView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
    }
    
    func loadPERABEEWebViewVCWebUrl(){
        print("lw=====>baseUrl:",uiGuester)
        uiGuester = runRiderfolmn()
        print("lw=====>loadUrl:",uiGuester)
        if let loadUrl = URL(string: uiGuester) {
            peraeeWebView.load(URLRequest(url: loadUrl, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 60))
        }
        
    }
    
    func runRiderfolmn() -> String{
        let ssee = uiGuester.headerString
        var buReturnStr = "\(uiGuester)\(uiGuester.contains("?") ? "&" : "?")\(ssee)"
        buReturnStr = buReturnStr.replacingOccurrences(of: " ", with: "")
        
        return buReturnStr
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        if self.navigationController?.interactivePopGestureRecognizer?.delegate === self {
            self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
        }
    }
    
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        
        let ma = message.name
        if ma.contains("ddvdfhvbsc1") {
            let webKitVCinfo:[String : Any] = [
                "rxpMimickerJqj": ELoTudeforbemeetSeeder.litteDOe,
                "rxpErythromycinJqj": PERABEEDeviceTool.getIDFV(),
                "rxpInningJqj": ELoTudeforbemeetSeeder.gitteDOe,
                "rxpMicrometeoroidJqj":""
            ]
            let data = try? JSONSerialization.data(withJSONObject: webKitVCinfo, options: .prettyPrinted)
            let str = String(data: data!, encoding: String.Encoding.utf8) ?? ""
            
            peraeeWebView.evaluateJavaScript("ddvdfhvbsc2(\(str))") { _, error in
               
            }
        }else if ma.contains("ddvdfhvbsc3") {
            if let phone = URL(string: "tel:\(message.body)") {
                UIApplication.shared.open(phone)
            }
        }else if ma.contains("ddvdfhvbsc4") {
            DispatchQueue.main.async {
                self.navigationController?.popToRootViewController(animated: true)
                AppDelegate.tabVC.selectedIndex = 0 
            }
        }else if ma.contains("ddvdfhvbsc5") {
            if #available(iOS 14.0, *) {
                if  let sceneWindow = self.view.window?.windowScene {
                    SKStoreReviewController.requestReview(in: sceneWindow)
                }
            } else {
                SKStoreReviewController.requestReview()
            }
        }else if ma.contains("ddvdfhvbsc6") {
            if let url = URL(string: "\(message.body)") {
                UIApplication.shared.open(url)
            }
        }
    }
    
    func webViewVCgoBack(){
        if peraeeWebView.canGoBack{
            peraeeWebView.goBack()
        }else{
            if let _ = self.presentingViewController{
                dismiss(animated: true)
            }else{
                navigationController?.popViewController(animated: true)
            }
            
        }
    }
    
    //MARK: - setupGradientBackground
    func observeFoolker() {
            let foundtaionYer = CAGradientLayer()
             foundtaionYer.frame = CGRect(x: 0, y: 0, width: Wids, height: Heis)
             foundtaionYer.colors = [
                hex("#81EEFA").cgColor,
                hex("#A1FDEA").cgColor,
                hex("#A2FDE9").cgColor,
                hex("#F9F9F9").cgColor,
            ]
            foundtaionYer.startPoint = CGPoint(x: 0.5, y: 0.0)
            foundtaionYer.endPoint = CGPoint(x: 0.5, y: 1.0)
            view.layer.insertSublayer(foundtaionYer, at: 0)
        }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey: Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "title" {
            webViewVCNarBar.letLabTips.text = peraeeWebView.title
        } else if keyPath == "estimatedProgress" {
            if let newProgress = change?[.newKey] as? Double {
                DispatchQueue.main.async {
                    self.progress.setProgress(Float(newProgress), animated: true)

                    if newProgress >= 1.0 {
                        UIView.animate(withDuration: 0.3, delay: 0.3, options: .curveEaseInOut) {
                            self.progress.alpha = 0.0
                        } completion: { _ in
                            self.progress.isHidden = true
                            self.progress.setProgress(0.0, animated: false)
                        }
                    } else {
                        self.progress.alpha = 1.0
                        self.progress.isHidden = false
                    }
                }
            }
        } else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        webViewVCgoBack()
        return false
    }
    
    //MARK: - lazy
    lazy var webViewVCNarBar: PERABEEWebViewVCNarBar = {
        let webViewVCNarBar = PERABEEWebViewVCNarBar(frame: CGRect(x: 0, y: 0, width: Wids, height: NavBarHeight))
        webViewVCNarBar.backgroundColor = .white
        webViewVCNarBar.bbGoReturns = {  [weak self] in
            self?.webViewVCgoBack()
        }
        return webViewVCNarBar
    }()
    
    lazy var progress: UIProgressView = {
        let progress = UIProgressView(frame: CGRectMake(0, NavBarHeight, Wids, 2))
         progress.tintColor = hex("#A2FDE9")
         progress.trackTintColor = .white
         progress.transform = CGAffineTransformMakeScale(1, 0.7)
        return progress
    }()

}
