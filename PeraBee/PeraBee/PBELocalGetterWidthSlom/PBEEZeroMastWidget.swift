//
//  PBEEZeroMastWidget.swift
//  PeraBee
//
//  Created by Sibs on 2024/10/6.
//

import UIKit

class PBEEZeroMastWidget: UIViewController, UITextFieldDelegate {

    let checkboxButton = UIButton(type: .custom)
    let content = UIScrollView()
    let phoneTextField = UITextField()
    override func viewDidLoad() {
        super.viewDidLoad()
        content.frame = view.frame
        view.addSubview(content)
        content.contentInsetAdjustmentBehavior = .never
        content.showsVerticalScrollIndicator = false
        setupGradientBackground(view)
        unearWidget()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if !sionView.isHidden{
            sionView.isHidden = true
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        phoneTextField.becomeFirstResponder()
    }
    
    func unearWidget() {
        
        let backItem = UIButton(type: .custom)
        backItem.frame = CGRect(x:0, y: SafeBot, width: 44, height: 44)
        backItem.setImage(UIImage(named: "login_back"), for: .normal)
        backItem.balenceCust {  [weak self] in
            self?.back()
        }
        content.addSubview(backItem)
        
        let circleImage = UIImageView(frame: CGRect(x:25, y: SafeBot + 10, width: Wids - 50, height: Wids - 50))
        circleImage.image = UIImage(named: "login_circle")
        content.addSubview(circleImage)
        
        let name = UILabel(frame: CGRect(x: 0, y: 43.w, width: circleImage.frame.width, height: 16))
        name.textColor = rgba(255, 243, 142, 1)
        name.font = UIFont.boldSystemFont(ofSize: 14)
        name.textAlignment = .center
        name.text = "Perabee"
        circleImage.addSubview(name)
        
        let logo = UIImageView(frame: CGRect(x:0, y: name.bottom + 6, width: 38.w, height: 38.w))
        logo.centerX = circleImage.width/2
        logo.image = UIImage(named: "app_logo")
        logo.cornerRadius = 4
        circleImage.addSubview(logo)
        
        let title = UILabel(frame: CGRect(x: 0, y: 114.w, width: circleImage.width, height: 30))
        title.textColor = rgba(51, 51, 51, 1)
        title.font = boldErasItc(15)
        title.textAlignment = .center
        title.text = "Maximum Loan Amount"
        circleImage.addSubview(title)
        
        let value = UILabel(frame: CGRect(x: 0, y: 134.w, width: circleImage.width, height: 60))
        value.textColor = rgba(51, 51, 51, 1)
        value.font = boldErasItc(52)
        value.textAlignment = .center
        value.text = "₱20,000"
        circleImage.addSubview(value)
        
        let itemBgBorder = UIView(frame: CGRect(x: 12, y: circleImage.y + 207, width: Wids - 24, height: 422  - 91))
        itemBgBorder.backgroundColor = rgba(0, 232, 174, 1)
        itemBgBorder.cornerRadius = 20
        view.addSubview(itemBgBorder)
        
        let itemBg = UIView(frame: CGRect(x: 0, y: 0, width: itemBgBorder.width, height: 412  - 91))
        itemBg.backgroundColor = rgba(0, 191, 131, 1)
        itemBg.cornerRadius = 20
        itemBgBorder.addSubview(itemBg)
        
        let topGuider = UIButton(type: .custom)
        topGuider.isUserInteractionEnabled = false
        topGuider.titleLabel?.font = boldErasItc(18)
        topGuider.frame = CGRect(x: 0, y: 0, width: itemBg.width, height: 64)
        topGuider.setImage(UIImage(named: "login_emo"), for: .normal)
        topGuider.setTitle(" Log in to" + " get more", for: .normal)
        topGuider.setTitleColor(.white, for: .normal)
        itemBg.addSubview(topGuider)

        let whiteBg = UIView(frame: CGRect(x: 12, y: 64, width: itemBg.width - 24, height: 304  - 91))
        whiteBg.backgroundColor = rgba(239, 254, 255, 1)
        whiteBg.cornerRadius = 10
        itemBgBorder.addSubview(whiteBg)
        
        let subtitleLabel = UILabel()
        subtitleLabel.frame = CGRect(x: 12, y: 35, width: whiteBg.width - 24, height: 40)
        subtitleLabel.text = "Log in to experience per" + "sonal loan services now"
        subtitleLabel.font = boldErasItc(12)
        subtitleLabel.textColor = rgba(51, 51, 51, 1)
        subtitleLabel.textAlignment = .center
        subtitleLabel.numberOfLines = 0
        whiteBg.addSubview(subtitleLabel)
        
        let phoneContainerView = UIView()
        phoneContainerView.frame = CGRect(x: 12, y: subtitleLabel.frame.maxY + 10, width: whiteBg.width - 24, height: 52)
        phoneContainerView.backgroundColor = rgba(253, 255, 208, 1)
        phoneContainerView.layer.cornerRadius = 16
        phoneContainerView.layer.borderWidth = 1
        phoneContainerView.layer.borderColor = rgba(251, 200, 38, 1).cgColor
        whiteBg.addSubview(phoneContainerView)
        
        let countryCodeLabel = UILabel()
        countryCodeLabel.text = "+63"
        countryCodeLabel.font = UIFont.systemFont(ofSize: 16)
        countryCodeLabel.textColor = rgba(51, 51, 51, 1)
        countryCodeLabel.frame = CGRect(x: 10, y: 0, width: 52, height: 52)
        phoneContainerView.addSubview(countryCodeLabel)
        
        let vline = UIView(frame: CGRect(x: 56, y: 14, width: 1, height: 22))
        vline.backgroundColor = rgba(251, 200, 38, 1)
        phoneContainerView.addSubview(vline)
        
        phoneTextField.frame = CGRect(x: countryCodeLabel.frame.maxX + 10, y: 0, width: phoneContainerView.frame.width - countryCodeLabel.frame.maxX - 20, height: 50)
        phoneTextField.delegate = self
        phoneTextField.keyboardType = .numberPad
        phoneTextField.placeholder = "Phone number"
        phoneTextField.font = UIFont.systemFont(ofSize: 16)
        phoneTextField.textColor = rgba(51, 51, 51, 1)
        phoneTextField.borderStyle = .none
        phoneTextField.delegate = self
        phoneContainerView.addSubview(phoneTextField)
        
        checkboxButton.setImage(UIImage(named: "login_unselect"), for: .normal)
        checkboxButton.setImage(UIImage(named: "login_select"), for: .selected)
        checkboxButton.tintColor = UIColor(red: 0.1, green: 0.7, blue: 0.4, alpha: 1.0)
        checkboxButton.frame = CGRect(x: 5, y: phoneContainerView.frame.maxY + 20, width: 30, height: 30)
        checkboxButton.balenceCust { [weak self] in
            self?.checkBoxTap()
        }
        whiteBg.addSubview(checkboxButton)
        
        let privacyLabel = UILabel()
        privacyLabel.text = "I have read an" + "d agree with the "
        privacyLabel.font = UIFont.systemFont(ofSize: 12)
        privacyLabel.textColor = .gray
        privacyLabel.frame = CGRect(x: checkboxButton.right, y: checkboxButton.y - 10, width: whiteBg.width - checkboxButton.right - 10, height: checkboxButton.height + 20)
        privacyLabel.numberOfLines = 0
        privacyLabel.sizeToFit()
        privacyLabel.height = checkboxButton.height + 20
        whiteBg.addSubview(privacyLabel)
        
        let privacyBtn = UILabel()
        privacyBtn.text = "Privacy Ag" + "reement"
        privacyBtn.font = UIFont.systemFont(ofSize: 12)
        privacyBtn.textColor = rgba(0, 188, 129, 1)
        privacyBtn.frame = CGRect(x: privacyLabel.right, y: checkboxButton.y - 10, width: 10, height: checkboxButton.height + 20)
        privacyBtn.sizeToFit()
        privacyBtn.height = checkboxButton.height + 20
        privacyBtn.balenceCust { [weak self] in
            self?.privacyTap()
        }
        whiteBg.addSubview(privacyBtn)
        
        let nextBtn = UIButton(type: .custom)
        nextBtn.backgroundColor = rgba(255, 140, 0, 1)
        nextBtn.frame = CGRect(x: 24, y: itemBgBorder.bottom + 40, width: Wids - 48, height: 58)
        nextBtn.cornerRadius = 29
        content.addSubview(nextBtn)
        
        let nextTop = UILabel()
        nextTop.backgroundColor = rgba(255, 199, 59, 1)
        nextTop.frame = CGRect(x: 24, y: itemBgBorder.bottom + 40, width: Wids - 48, height: 54)
        nextTop.cornerRadius = 27
        nextTop.textColor = .white
        nextTop.font = boldErasItc(27)
        nextTop.text = "Let's Go"
        nextTop.textAlignment = .center
        content.addSubview(nextTop)
        nextTop.balenceCust { [weak self] in
            self?.nextAction()
        }
        checkBoxTap()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 15
        let currText = (textField.text ?? "") as NSString
        let newText = currText.replacingCharacters(in: range, with: string)
        return newText.count <= maxLength
    }
    
    func nextAction() {
        if !checkboxButton.isSelected {
            toast("Please confir" + "m the agreement")
            return
        }
        let phone = phoneTextField.text ?? ""
        if phone.count < 8 {
            toast("Please enter yo" + "ur phone number in th" + "e correc" + "t for\("mat (length greater than or eq")ual to 8)")
            return
        }
        PBEEFireManWorkLates.kimos.mengingWidgetFocerts(xinbe: "/xjuLiasUzf", tracking: ["rxpIntensivelyJqj":phone, "rxpSprinklingJqj":"juyttrr"], ibloadfod: true) { suc in
            var time = suc.feedBaseCall["rxpCowbaneJqj"]["rxpDinantianJqj"].intValue
            if time == 0 {
                time = 60
            }
            self.nextPage(time: time, msg: suc.meanings)
        } ffBoom: { errorStr in

        }
    }
    
    func nextPage(time:Int, msg:String) {
        let page = PBEEMastNextWidgetShower()
        page.time = time
        page.msg = msg
        page.phone = phoneTextField.text ?? ""
        page.modalPresentationStyle = .fullScreen
        self.present(page, animated: true)
    }
    
    func checkBoxTap() {
        checkboxButton.isSelected = !checkboxButton.isSelected
    }
    
    func privacyTap() {
        let url = PBEERunFastByNetTools.shared.h5Url + "/#/privacyAgreement"
        let webViewVC = PERABEERunPlaSafireToler()
        webViewVC.uiGuester = url
        webViewVC.modalPresentationStyle = .fullScreen
        self.present(webViewVC, animated: true)
    }
    
    func back() {
        dismiss(animated: true)
    }
}



extension Double {
    var stringValue: String {
        return String(self)
    }
    var intValue:Int {
        return lround(self)
    }
    var w:Double {
        return self*(Wids/375.0)
    }
}
