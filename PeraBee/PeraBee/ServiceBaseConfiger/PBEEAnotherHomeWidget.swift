//
//  PBEEAnotherHomeWidget.swift
//  CreditPro
//
//  Created by Sibs on 2024/10/2.
//

import UIKit

class PBEEAnotherHomeWidget: UIViewController {
    let userBgDefault = UIScrollView()
    var debtInfo = JSON()
    var itemList = [JSON]()
    override func viewDidLoad() {
        super.viewDidLoad()
        userBgDefault.frame = view.frame
        view.addSubview(userBgDefault)
        userBgDefault.contentInsetAdjustmentBehavior = .never
        userBgDefault.showsVerticalScrollIndicator = false
        setupGradientBackground(view)
        unearWidget()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        reqSettingData()
        navigationController?.navigationBar.isHidden = true
    }
    
    func unearWidget() {
        userBgDefault.removeAllSubviews()
        
        let circleImage = UIImageView(frame: CGRect(x:25.w, y: SafeBot + 10, width: Wids - 50, height: 198.w))
        circleImage.image = UIImage(named: "helf_circle")
        userBgDefault.addSubview(circleImage)
        
        let logo = UIImageView(frame: CGRect(x:0, y: 51, width: 60.w, height: 60.w))
        logo.centerX = circleImage.width/2
        logo.image = UIImage(named: "app_logo")
        logo.cornerRadius = 4
        circleImage.addSubview(logo)
        
        let title = UILabel(frame: CGRect(x: 0, y: 124.w, width: circleImage.width, height: 24))
        title.textColor = .white
        title.font = boldErasItc(20)
        title.textAlignment = .center
        title.text = "Esteemed Member"
        circleImage.addSubview(title)
        
        let value = UILabel(frame: CGRect(x: 0, y: title.bottom, width: circleImage.width, height: 24))
        value.textColor = .white
        value.font = boldErasItc(20)
        value.textAlignment = .center
        value.text = maskPhoneNumber(PBEEDefaultRunsClearVibs.name)
        circleImage.addSubview(value)
        
        let orderLightBg = UIView(frame: CGRect(x: 12.w, y: circleImage.bottom, width: Wids - 24.w, height: 128.w))
        orderLightBg.backgroundColor = rgba(0, 232, 174, 1)
        orderLightBg.cornerRadius = 20
        userBgDefault.addSubview(orderLightBg)
        
        let orderBg = UIView(frame: CGRect(x: 0, y: 0, width: Wids - 24, height: 122.w))
        orderBg.backgroundColor = rgba(0, 191, 131, 1)
        orderBg.cornerRadius = 20
        orderLightBg.addSubview(orderBg)
        
        let image_l = UIImageView(frame: CGRect(x:12.w, y: 16.w, width: 158.w, height: 93.w))
        image_l.image = UIImage(named: "order_l")
        image_l.balenceCust { [weak self] in
            self?.blandFlam2()
        }
        orderBg.addSubview(image_l)
        
        let image_r = UIImageView(frame: CGRect(x:image_l.right + 12.w, y: 16.w, width: 158.w, height: 93.w))
        image_r.image = UIImage(named: "order_r")
        image_r.balenceCust { [weak self] in
            self?.blandFlam1()
        }
        orderBg.addSubview(image_r)
        
        var offsetY = orderLightBg.bottom + 12
        if !debtInfo.isEmpty {
            let debtLightBg = UIView(frame: CGRect(x: 12.w, y: offsetY, width: Wids - 24.w, height: 157))
            debtLightBg.backgroundColor = rgba(252, 181, 1, 1)
            debtLightBg.cornerRadius = 12
            userBgDefault.addSubview(debtLightBg)
            
            let debtBg = UIView(frame: CGRect(x: 12, y: 0, width: debtLightBg.width - 24, height: debtLightBg.height))
            debtBg.backgroundColor = .white
            debtLightBg.addSubview(debtBg)
            let url = debtInfo["rxpOctonaryJqj"].stringValue
            debtBg.balenceCust {
                self.itemTap(url: url)
            }
            
            let icon = UIImageView(frame: CGRect(x:8, y: 10, width: 28, height: 28))
            icon.kf.setImage(with: URL(string: debtInfo["rxpBureaucratizeJqj"].stringValue))
            icon.cornerRadius = 4
            debtBg.addSubview(icon)
            
            let name = UILabel(frame: CGRect(x: icon.right + 4, y: icon.y, width: debtBg.width/2, height: icon.height))
            name.textColor = rgba(252, 181, 1, 1)
            name.font = boldErasItc(10)
            name.text = debtInfo["rxpNatoJqj"].stringValue
            debtBg.addSubview(name)
            
            let status = UILabel(frame: CGRect(x: 0, y: icon.y, width: debtBg.width - 12, height: icon.height))
            status.textColor = rgba(252, 181, 1, 1)
            status.font = .systemFont(ofSize: 14)
            status.text = debtInfo["rxpNatoJqj"].stringValue
            status.textAlignment = .right
            debtBg.addSubview(status)
            
            let line = DashedLineView(frame: CGRect(x: 12, y: 45, width: debtBg.width - 24, height: 1))
            debtBg.addSubview(line)
            
            let amount = UILabel(frame: CGRect(x: 0, y: 49, width: debtBg.width/2, height: 47))
            amount.textColor = rgba(252, 181, 1, 1)
            amount.font = boldErasItc(32)
            amount.text = "₱" + debtInfo["rxpSchistoidJqj"].stringValue
            amount.textAlignment = .center
            debtBg.addSubview(amount)
            
            let date = UILabel(frame: CGRect(x: debtBg.width/2, y: 49, width: debtBg.width/2, height: 47))
            date.textColor = rgba(252, 181, 1, 1)
            date.font = boldErasItc(20)
            date.text = debtInfo["rxpTransformerlessJqj"].stringValue
            date.textAlignment = .center
            debtBg.addSubview(date)
            
            let amountDesc = UILabel(frame: CGRect(x: 0, y: 90, width: debtBg.width/2, height: 15))
            amountDesc.textColor = rgba(102, 102, 102, 1)
            amountDesc.font = .systemFont(ofSize: 12)
            amountDesc.text = "Loan amount"
            amountDesc.textAlignment = .center
            debtBg.addSubview(amountDesc)
            
            let dateDesc = UILabel(frame: CGRect(x: debtBg.width/2, y: 90, width: debtBg.width/2, height: 15))
            dateDesc.textColor = rgba(102, 102, 102, 1)
            dateDesc.font = .systemFont(ofSize: 12)
            dateDesc.text = "Repayment date"
            dateDesc.textAlignment = .center
            debtBg.addSubview(dateDesc)
            
            let debtBtnBg = UIView(frame: CGRect(x: 12, y: 113, width: debtBg.width - 24, height: 34))
            debtBtnBg.backgroundColor = rgba(252, 181, 1, 1)
            debtBtnBg.cornerRadius = 17
            debtBg.addSubview(debtBtnBg)
            
            let debtBtn = UILabel(frame: CGRect(x: 0, y: 0, width: debtBtnBg.width, height: 32))
            debtBtn.textColor = rgba(252, 181, 1, 1)
            debtBtn.font = boldErasItc(12)
            debtBtn.text = "Refund"
            debtBtn.cornerRadius = 16
            debtBtn.textAlignment = .center
            debtBtn.backgroundColor = rgba(245, 255, 211, 1)
            debtBtnBg.addSubview(debtBtn)
            
            offsetY = debtLightBg.bottom + 12
        }
        
        let itemWidth = (Wids - 24.w)/3.0
        
        var whiteView = UIView(frame: CGRect(x: 12.w, y: offsetY, width: Wids - 24.w, height: 97))
        
        if !itemList.isEmpty {
            
            itemList.insert(JSON(), at: 2)
            for (i, item) in itemList.enumerated() {
                if ((i%3) == 0) {
                    whiteView = UIView(frame: CGRect(x: 12.w, y: offsetY, width: Wids - 24.w, height: 97))
                    whiteView.backgroundColor = .white
                    whiteView.cornerRadius = 12
                    userBgDefault.addSubview(whiteView)
                    offsetY = whiteView.bottom + 12
                }
                let x = 12.w + itemWidth*Double((i%3))
                let y = whiteView.y
                let itemBg = UIView(frame: CGRect(x: x, y: y, width: itemWidth, height: 97))
                let url = item["rxpOctonaryJqj"].stringValue
                itemBg.balenceCust {  [weak self] in
                    self?.itemTap(url: url, isSet: i == 2)
                }
                userBgDefault.addSubview(itemBg)
                
                let icon = UIImageView(frame: CGRect(x:0, y: 23, width: 36, height: 36))
                icon.centerX = itemWidth/2
                if i == 2 {
                    icon.image = UIImage(named: "setting_icon")
                }else {
                    icon.kf.setImage(with: URL(string:item["rxpBureaucratizeJqj"].stringValue))
                }
                itemBg.addSubview(icon)
                
                let titleLabel = UILabel(frame: CGRect(x: 0, y: icon.bottom, width:itemWidth, height: 27))
                titleLabel.textColor = rgba(51, 51, 51, 1)
                titleLabel.font = .systemFont(ofSize: 12)
                titleLabel.text = i == 2 ? "Set Up" : item["rxpUmbJqj"].stringValue
                titleLabel.textAlignment = .center
                titleLabel.adjustsFontSizeToFitWidth = true
                itemBg.addSubview(titleLabel)
            }
        }
        offsetY += tabBarHeight
        userBgDefault.contentSize = CGSize(width: Wids, height: offsetY)
    }
    
    func maskPhoneNumber(_ phoneNumber: String) -> String {
        if phoneNumber.count < 8 {
            return phoneNumber
        }
        let startIndex = phoneNumber.index(phoneNumber.startIndex, offsetBy: 3)
        let endIndex = phoneNumber.index(phoneNumber.startIndex, offsetBy: 7)
        let maskedRange = startIndex..<endIndex
        return phoneNumber.replacingCharacters(in: maskedRange, with: "****")
    }
    
    func itemTap(url:String, isSet:Bool = false) {
        if !PBEEDefaultRunsClearVibs.isLogin {
            PBEEDefaultRunsClearVibs.toLogin()
            return
        }
        if isSet {
            let page = PBEESlowConfigWdiget()
            navigationController?.pushViewController(page, animated: true)
            return
        }
        let webViewVC = PERABEERunPlaSafireToler()
        webViewVC.uiGuester = url
        navigationController?.pushViewController(webViewVC, animated: true)
    }
    
    func blandFlam2() {
        if !PBEEDefaultRunsClearVibs.isLogin {
            PBEEDefaultRunsClearVibs.toLogin()
            return
        }
        AppDelegate.tabVC.selectedIndex = 1
        NotificationCenter.default.post(name: .cationNameIntONe, object: nil)
    }
    
    func blandFlam1() {
        if !PBEEDefaultRunsClearVibs.isLogin {
            PBEEDefaultRunsClearVibs.toLogin()
            return
        }
        AppDelegate.tabVC.selectedIndex = 1
        NotificationCenter.default.post(name: .cationNameIntTWo, object: nil)
    }
    
    func reqSettingData() {
        if !PBEEDefaultRunsClearVibs.isLogin {
            return
        }
        PBEEFireManWorkLates.kimos.momentTgpGloable(miaorle: "/xjuKuschUzf", load: true) { [weak self] suc in
            self?.debtInfo = suc.feedBaseCall["rxpLumpenJqj"]
            self?.itemList = suc.feedBaseCall["rxpUnmerchantableJqj"].arrayValue
            self?.unearWidget()
        } fai: { errorStr in

        }
    }
}


class DashedLineView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupDashedLine()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupDashedLine()
    }
    
    private func setupDashedLine() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = rgba(252, 181, 1, 1).cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.lineDashPattern = [3, 3]
        let path = CGMutablePath()
        path.addLines(between: [CGPoint(x: 0, y: self.bounds.midY),
                                CGPoint(x: self.bounds.width, y: self.bounds.midY)])
        shapeLayer.path = path
        
        self.layer.addSublayer(shapeLayer)
    }
}
