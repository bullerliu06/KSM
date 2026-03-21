//
//  PBEESlowConfigWdiget.swift
//  PeraBee
//
//  Created by Sibs on 2024/10/9.
//

import UIKit

class PBEESlowConfigWdiget: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradientBackground(view)
        unearWidget()
        let backButton = UIButton(type: .custom)
        backButton.setImage(UIImage(named: "login_back"), for: .normal)
        backButton.frame = CGRect(x: 0, y: SafeBot, width: 44, height: 44)
        view.addSubview(backButton)
        backButton.balenceCust { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
    }
    
    func unearWidget() {
        let whiteBg = UIView(frame: CGRect(x:12, y: NavBarHeight, width: Wids - 24, height: view.height - 140 - SafeBot - NavBarHeight))
        whiteBg.backgroundColor = .white
        whiteBg.cornerRadius = 12
        view.addSubview(whiteBg)
        
        let logo = UIImageView(frame: CGRect(x:0, y: 45, width: 60.w, height: 60.w))
        logo.centerX = whiteBg.width/2
        logo.image = UIImage(named: "app_logo")
        logo.cornerRadius = 4
        whiteBg.addSubview(logo)
        
        let title = UILabel(frame: CGRect(x: 0, y: 115, width: whiteBg.width, height: 24))
        title.textColor = rgba(0, 191, 131, 1)
        title.font = boldErasItc(16)
        title.textAlignment = .center
        title.text = "Perabee"
        whiteBg.addSubview(title)
        
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] ?? "" 
        let list = [(title:"Website", value:"https://www.t-yae-lending.com"),(title:"Email", value:"service@t-yae-lending.com"),(title:"Edition", value:appVersion)]
        var offsetY = title.bottom + 35
        for (i, item) in list.enumerated() {
            let title = UILabel(frame: CGRect(x: 15, y: offsetY, width: whiteBg.width - 30, height: 20))
            title.textColor = rgba(102, 102, 102, 1)
            title.font = .systemFont(ofSize: 14)
            title.text = item.title
            whiteBg.addSubview(title)
            
            let value = UILabel(frame: CGRect(x: 15, y: offsetY + 26, width: whiteBg.width - 30, height: 22))
            value.textColor = rgba(51, 51, 51, 1)
            value.font = .systemFont(ofSize: 16)
            value.text = item.value as? String
            whiteBg.addSubview(value)

            offsetY = value.bottom + 10

            if i < 2 {
                let line = UIView(frame: CGRect(x: 15, y: offsetY, width: whiteBg.width - 30, height: 1))
                line.backgroundColor = rgba(243, 243, 243, 1)
                whiteBg.addSubview(line)
            }
            offsetY += 10
        }
        
        let quitLabel = UILabel(frame: CGRect(x: 24, y: whiteBg.bottom + 25, width: Wids - 48, height: 46))
        quitLabel.textColor = .white
        quitLabel.backgroundColor = rgba(255, 140, 0, 1)
        quitLabel.cornerRadius = 23
        quitLabel.font = boldErasItc(18)
        quitLabel.textAlignment = .center
        quitLabel.text = "Logout"
        view.addSubview(quitLabel)
        quitLabel.balenceCust { [weak self] in
            self?.quitTap(isQuit: true)
        }
        
        let leaveLabel = UILabel(frame: CGRect(x: 24, y: quitLabel.bottom + 12, width: Wids - 48, height: 46))
        leaveLabel.textColor = rgba(255, 140, 0, 1)
        leaveLabel.backgroundColor = rgba(255, 240, 192, 1)
        leaveLabel.cornerRadius = 23
        leaveLabel.font = boldErasItc(18)
        leaveLabel.textAlignment = .center
        leaveLabel.text = "Cancel Account"
        view.addSubview(leaveLabel)
        leaveLabel.balenceCust { [weak self] in
            self?.quitTap(isQuit: false)
        }
    }
    
    
    func quitTap(isQuit:Bool) {
        let alert = UIView(frame: CGRect(x: 15, y: 0, width: Wids - 30, height: 244))
        alert.centerY = Heis/2
        
        let header = UIImageView(frame: CGRect(x:0, y: 0, width: alert.width, height: 120))
        header.image = UIImage(named: "alert_header")
        
        let whiteBg = UIView(frame: CGRect(x: 0, y: header.bottom - 20, width: alert.width, height: alert.height - header.height + 20))
        whiteBg.backgroundColor = .white
        whiteBg.cornerRadius = 16
        alert.addSubview(whiteBg)
        
        alert.addSubview(header)
        
        let emoj = UIImageView(frame: CGRect(x:0, y: 8, width: 60, height: 60))
        emoj.image = UIImage(named: "emo_ub")
        emoj.centerX = alert.width/2
        alert.addSubview(emoj)
        
        let content = UILabel(frame: CGRect(x: 15, y: 72, width: alert.width - 30, height: 52))
        content.textColor = rgba(61, 61, 61, 1)
        content.font = boldErasItc(16)
        content.textAlignment = .center
        content.text = isQuit ? "Are you sure you " + "want to leave the software?" : "Are you sure you" + " want to cancel your account?"
        content.numberOfLines = 2
        alert.addSubview(content)
        
        let Cancel = UILabel(frame: CGRect(x: 20, y: 142, width: alert.width - 40, height: 36))
        Cancel.textColor = .white
        Cancel.backgroundColor = rgba(255, 140, 0, 1)
        Cancel.cornerRadius = 18
        Cancel.font = boldErasItc(18)
        Cancel.textAlignment = .center
        Cancel.text = "Cancel"
        alert.addSubview(Cancel)
        Cancel.balenceCust {
            PBAlert.hideAlert()
        }
        
        let confirm = UILabel(frame: CGRect(x: 20, y: Cancel.bottom + 10, width: alert.width - 40, height: 36))
        confirm.textColor = rgba(255, 140, 0, 1)
        confirm.backgroundColor = rgba(255, 240, 192, 1)
        confirm.cornerRadius = 18
        confirm.font = boldErasItc(18)
        confirm.textAlignment = .center
        confirm.text = "Confirm"
        alert.addSubview(confirm)
        confirm.balenceCust { [weak self] in
            PBAlert.hideAlert()
            self?.reqquetQuit()
        }
        
        PBAlert.showAlertView(alert)
    }
    
    func reqquetQuit() {
        PBEEFireManWorkLates.kimos.momentTgpGloable(miaorle: "/xjuEtchingUzf", load: true) { [weak self] suc in
            PBEEDefaultRunsClearVibs.clear()
            self?.navigationController?.popToRootViewController(animated: true)
            AppDelegate.tabVC.selectedIndex = 0
        } fai: { errorStr in

        }
    }
}


class PBAlert {
    static var alertBgGray = UIButton(type: .custom)
    static var alertShow = false
    
    static func showAlertView(_ alert:UIView) {
        if (alertShow) {
            return
        }
        if Thread.isMainThread {
            show(contentView: alert)
        }else{
            DispatchQueue.main.async {
                show(contentView: alert)
            }
        }
        func show(contentView:UIView) {
            alertShow = true
            let window = UIApplication.shared.windows.first!
            alertBgGray = UIButton(frame: window.bounds)
            alertBgGray.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
            alertBgGray.addTarget(self, action:  #selector(hideAlert), for: .touchUpInside)
            window.addSubview(alertBgGray)
            alertBgGray.addSubview(contentView)
        }
    }
    
    @objc static func hideAlert() {
        alertShow = false
        UIView.animate(withDuration: 0.2) {
            alertBgGray.alpha = 0
        } completion: { finished in
            alertBgGray.removeFromSuperview()
        }
    }
}
