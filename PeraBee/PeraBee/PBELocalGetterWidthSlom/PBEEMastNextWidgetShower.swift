//
//  PBEEMastNextWidgetShower.swift
//  PeraBee
//
//  Created by Sibs on 2024/10/6.
//

import UIKit

class PBEEMastNextWidgetShower: UIViewController, UITextFieldDelegate {
    var ltimer: Timer?
    var time = 0
    var phone = ""
    var msg = ""
    let content = UIScrollView()
    let sendBtn = UIButton(type: .custom)
    let codeLength = 6
    var enterTimeSet = ""
    private var codeTextFields: [UITextField] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        ELoTudeforbemeetSeeder.beCationFloadOnlyBoolRequest { completion in
            
        }
        content.frame = view.frame
        view.addSubview(content)
        content.contentInsetAdjustmentBehavior = .never
        content.showsVerticalScrollIndicator = false
        setupGradientBackground(view)
        unearWidget()
        enterTimeSet = timePeraBeeStart()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        IQKeyboardManager.shared.enable = false
        if !sionView.isHidden{
            sionView.isHidden = true
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        IQKeyboardManager.shared.enable = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if time > 0{
            ltimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countdownAction), userInfo: nil, repeats: true)
        }
        if !msg.isEmpty {
            toast(msg)
        }
    }
    
    @objc private func countdownAction() {
        if time == 0 {
            sendBtn.setTitle("Resend", for: .normal)
            ltimer?.invalidate()
            ltimer = nil
            return
        }
        time -= 1
        sendBtn.setTitle(time.stringValue + "S", for: .normal)
        
    }
    
    func sendBtnTap() {
        if time > 0 {
            return
        }else {
            PBEEFireManWorkLates.kimos.mengingWidgetFocerts(xinbe: "/xjuLiasUzf", tracking: ["rxpIntensivelyJqj":phone, "rxpSprinklingJqj":"juyttrr"], ibloadfod: true) { suc in
                var time = suc.feedBaseCall["rxpCowbaneJqj"]["rxpDinantianJqj"].intValue
                if time == 0 {
                    time = 60
                }
                toast(suc.meanings)
                self.updateTime(value: time)
            } ffBoom: { errorStr in

            }
        }
    }
    
    func updateTime(value:Int) {
        if value > 0{
            time = value
            ltimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countdownAction), userInfo: nil, repeats: true)
        }
    }
    
    deinit {
        ltimer?.invalidate()
        ltimer = nil
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
        subtitleLabel.frame = CGRect(x: 12, y: 0, width: whiteBg.width - 24, height: 40)
        subtitleLabel.text = "Please enter ve" + "rification code"
        subtitleLabel.font = boldErasItc(12)
        subtitleLabel.textColor = rgba(51, 51, 51, 1)
        subtitleLabel.numberOfLines = 0
        whiteBg.addSubview(subtitleLabel)
        
        let subDescLabel = UILabel()
        subDescLabel.frame = CGRect(x: 12, y: subtitleLabel.bottom, width: whiteBg.width - 24, height: 17)
        subDescLabel.text = "SMS verification c" + "ode has been sent to"
        subDescLabel.font = peFloadt(12)
        subDescLabel.textColor = rgba(51, 51, 51, 1)
        subDescLabel.numberOfLines = 0
        whiteBg.addSubview(subDescLabel)
        
        let phoneLabel = UILabel()
        phoneLabel.frame = CGRect(x: 12, y: subDescLabel.bottom + 10, width: whiteBg.width - 24, height: 25)
        phoneLabel.text = phone
        phoneLabel.font = UIFont.boldSystemFont(ofSize: 18)
        phoneLabel.textColor = rgba(51, 51, 51, 1)
        phoneLabel.numberOfLines = 0
        whiteBg.addSubview(phoneLabel)
        
        sendBtn.frame = CGRect(x: whiteBg.width - 90, y: phoneLabel.y, width: 78, height: 26)
        sendBtn.titleLabel?.font = boldErasItc(12)
        sendBtn.setTitle(time.stringValue + "S", for: .normal)
        sendBtn.setBackgroundImage(UIImage(named: "login_bgnbg"), for: .normal)
        sendBtn.setTitleColor(rgba(0, 189, 130, 1), for: .normal)
        sendBtn.balenceCust { [weak self] in
            self?.sendBtnTap()
        }
        whiteBg.addSubview(sendBtn)
        
        let spacing: CGFloat = 8
        let textFieldWidth = (whiteBg.width - CGFloat((codeLength - 1))*spacing - 2*12)/6

        for i in 0..<codeLength {
            let textField = CodeTextField()
            textField.backgroundColor = rgba(253, 255, 208, 1)
            textField.frame = CGRect(x: 12 + CGFloat(i) * (textFieldWidth + spacing), y: sendBtn.bottom + 20, width: textFieldWidth, height: textFieldWidth)
            textField.textAlignment = .center
            textField.font = UIFont.boldSystemFont(ofSize: 18)
            textField.keyboardType = .numberPad
            textField.cornerRadius = 12
            textField.delegate = self
            textField.layer.borderWidth = 1
            textField.layer.borderColor = rgba(251, 200, 38, 1).cgColor
            textField.onDeleteBackward = { [weak self] currentTextField in
                self?.deletePreviousTextField(currentTextField: currentTextField)
            }
            textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
            codeTextFields.append(textField)
            whiteBg.addSubview(textField)
        }
        
        let maskBtn = UIButton(type: .custom)
        maskBtn.backgroundColor = .clear
        maskBtn.frame = CGRect(x: 0, y: sendBtn.bottom + 20, width: whiteBg.width, height: textFieldWidth)
        maskBtn.balenceCust { [weak self] in
            self?.focusOnFirstEmptyTextField(true)
        }
        whiteBg.addSubview(maskBtn)
        
        
        let nextBtn = UIButton(type: .custom)
        nextBtn.backgroundColor = rgba(255, 140, 0, 1)
        nextBtn.frame = CGRect(x: 24, y: itemBgBorder.bottom + 40, width: Wids - 48, height: 58)
        nextBtn.cornerRadius = 29
//        content.addSubview(nextBtn)
        
        let nextTop = UILabel()
        nextTop.backgroundColor = rgba(255, 199, 59, 1)
        nextTop.frame = CGRect(x: 24, y: itemBgBorder.bottom + 40, width: Wids - 48, height: 54)
        nextTop.cornerRadius = 27
        nextTop.textColor = .white
        nextTop.font = boldErasItc(27)
        nextTop.text = "Let's Go"
        nextTop.textAlignment = .center
//        content.addSubview(nextTop)
        nextTop.balenceCust { [weak self] in
            self?.nextAction()
        }
        
        self.focusOnFirstEmptyTextField()

    }
    
    private func deletePreviousTextField(currentTextField: CodeTextField) {
        if let currentIndex = codeTextFields.firstIndex(of: currentTextField), currentIndex > 0 {
            let previousTextField = codeTextFields[currentIndex - 1]
            previousTextField.text = ""
            previousTextField.becomeFirstResponder()
        }
    }
    
    private func focusOnFirstEmptyTextField(_ istap:Bool = false) {
        let code = codeTextFields.compactMap { $0.text }.joined()
        if code.count == codeLength {
            if !istap {
                nextAction()
                return
            }
        }
        
        if (!(codeTextFields.last?.text ?? "").isEmpty) {
            codeTextFields.last?.becomeFirstResponder()
            return
        }
        for textField in codeTextFields {
            if textField.text?.isEmpty ?? true {
                textField.becomeFirstResponder()
                break
            }
        }
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
       guard let text = textField.text, text.count <= 1 else { return }
       focusOnFirstEmptyTextField()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return (textField.text?.count ?? 0) + string.count - range.length <= 1
    }
    
    func nextAction() {
        let code = codeTextFields.compactMap { $0.text }.joined()
        if code.count < 6 {
            toast("Please enter a val" + "id verification code")
            return
        }
        
        let point = [
            "rxpCadmusJqj":enterTimeSet,
            "rxpHungJqj":"",
            "rxpSolfegeJqj":"21",
            "rxpMimickerJqj":ELoTudeforbemeetSeeder.litteDOe,
            "rxpUtilisationJqj":timePeraBeeStart(),
            "rxpErythromycinJqj":PERABEEDeviceTool.getIDFV(),
            "rxpInningJqj":ELoTudeforbemeetSeeder.gitteDOe,
        ] as [String : Any]
        
        let dic = ["rxpJurymanJqj":phone, "rxpImperfectibleJqj":code,"point":point, "rxpRepressibleJqj":"duiuyiton"] as [String : Any]
        PBEEFireManWorkLates.kimos.mengingWidgetFocerts(xinbe: "/xjuBursarialUzf", tracking: dic, ibloadfod: true) { suc in
            self.loginResult(suc.feedBaseCall["rxpCowbaneJqj"])
        } ffBoom: { [weak self] errorStr in
            toast(errorStr ?? "")
            self?.clearText()
        }
    }
    
    func clearText() {
        for text in codeTextFields {
            text.text = ""
        }
        view.endEditing(true)
    }
    
    func loginResult(_ info:JSON) {
        let phone = info["rxpJurymanJqj"].stringValue
        let sessionid = info["rxpQuercitronJqj"].stringValue
        let isStore = info["rxpEpistyleJqj"].boolValue
        PBEEDefaultRunsClearVibs.name = phone
        PBEEDefaultRunsClearVibs.appid = sessionid
        PBEEDefaultRunsClearVibs.isStore = isStore
        self.presentingViewController?.presentingViewController?.dismiss(animated: true)
    }
    
    func back() {
        dismiss(animated: true)
    }
}

class CodeTextField: UITextField {
    var onDeleteBackward: ((CodeTextField) -> Void)?
    override func deleteBackward() {
        if text?.isEmpty ?? true {
            onDeleteBackward?(self)
        }
        super.deleteBackward()
    }
}
