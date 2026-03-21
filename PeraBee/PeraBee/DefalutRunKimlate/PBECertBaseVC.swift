//
//  PBECertBaseVC.swift
//  PeraBee
//
//  Created by Parme on 2024/10/3.
//

import UIKit

class PBECertBaseVC: UIViewController,UIGestureRecognizerDelegate {

    @IBOutlet weak var tipLab: UILabel!
    @IBOutlet weak var topImg: UIImageView!
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var tvView: UIView!
    @IBOutlet weak var hourLab: UILabel!
    @IBOutlet weak var muniteLab: UILabel!
    @IBOutlet weak var secondLab: UILabel!
    
    @IBOutlet weak var certTab: UITableView!
    
    @IBOutlet weak var stepMar: NSLayoutConstraint!
    @IBOutlet weak var tvH: NSLayoutConstraint!
    
    @IBOutlet weak var wanlView: UIView!
    
    @IBOutlet weak var doneButton: UIButton!
    
    var currentPid:String = ""
    var currentCert:String = ""
    
    var currentStart:String = ""
    var rxpSolfegeJqj:String = ""
    
    var widgeter:Timer?
    var currentWidget:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        navigationController?.isNavigationBarHidden = true
        currentStart = timePeraBeeStart()
        
        defaultUI()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: "PBECertBaseVC", bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    private func defaultUI(){
        certTab.showsVerticalScrollIndicator = false
        
        topView.layer.masksToBounds = true
        topView.layer.cornerRadius = 12
        topView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        tvView.layer.masksToBounds = true
        tvView.layer.cornerRadius = 12
        tvView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        switch currentCert{
        case "dlernwqej":
            rxpSolfegeJqj = "22"
            tipLab.text = "Basic"
            tipLab.font = PBEEMPLUS2m(16)
            topImg.isHidden = false
            topImg.image = UIImage(named: "cert_step1")
            stepMar.constant = -83
            
            wanlImg.image = UIImage(named: "cert_alert_top1")
            wanlCLab.text = "Complete the form to apply for a loan, and we'll tailor a loan amount just for you."
            
        case "rqwrtjqfs":
            rxpSolfegeJqj = "23"
            tipLab.text = "Contact"
            topImg.isHidden = false
            topImg.image = UIImage(named: "cert_step2")
            stepMar.constant = -83
            
            wanlImg.image = UIImage(named: "cert_alert_top2")
            wanlCLab.text = "Enhance your loan approval chances by providing your emergency contact information now."
            
        case "betrntfub":
            rxpSolfegeJqj = "24"
            tipLab.text = "Identification"
            topImg.isHidden = false
            topImg.image = UIImage(named: "cert_step3")
            stepMar.constant = -83
            doneButton.isHidden = true
            
            wanlImg.image = UIImage(named: "cert_alert_top3")
            wanlCLab.text = "Complete your identification now for a chance to increase your loan limit."
            
        case "ilfapwsdf":
            rxpSolfegeJqj = "25"
            tipLab.text = "Facial Recognition"
            topImg.isHidden = true
            stepMar.constant = 0
            
            wanlImg.image = UIImage(named: "cert_alert_top4")
            wanlCLab.text = "Boost your credit score by completing facial recognition now."
            
        case "khktnhsfn":
            rxpSolfegeJqj = "26"
            tipLab.text = "Withdrawal account"
            topImg.isHidden = true
            stepMar.constant = 0
            
            wanlImg.image = UIImage(named: "cert_alert_top5")
            wanlCLab.text = "Take the final step to apply for your loan—submitting now will enhance your approval rate."
            
        default:
            topImg.isHidden = true
            stepMar.constant = 0
        }
        
    }
    
    @objc private func startWidget(){
        currentWidget -= 1
        loadFormWidget()
    }
    
    private func loadFormWidget(){
        
        if currentWidget > 0{
            let doubleTime = Double(currentWidget)
            let hours = Int(doubleTime / 3600)
            hourLab.text = String(format: "%02d", hours)
            
            let lastTimes = doubleTime.truncatingRemainder(dividingBy: 3600)
            let minutes = Int(lastTimes / 60)
            muniteLab.text = String(format: "%02d", minutes)
            
            let remainingSecondsAfterMinutes = lastTimes.truncatingRemainder(dividingBy: 60)
            let seconds = Int(remainingSecondsAfterMinutes)
            secondLab.text = String(format: "%02d", seconds)
            
        }else{
            hourLab.text = "00"
            muniteLab.text = "00"
            secondLab.text = "00"
            widgeter?.invalidate()
            widgeter = nil
            tvView.isHidden = true
            tvH.constant = 0
            
        }
        
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        showAlertView()
        return false
    }
    
    @IBOutlet weak var wanlImg: UIImageView!
    @IBOutlet weak var wanlTLab: UILabel!
    @IBOutlet weak var wanlCLab: UILabel!
    private func showAlertView(){
        wanlView.isHidden = false
    }
    
    @IBAction func wanLClick(_ sender: UIButton) {
        if sender.tag == 2{
            self.navigationController?.popViewController(animated: true)
        }else{
            wanlView.isHidden = true
        }
    }
    
    @IBAction func backClick(_ sender: Any) {
        showAlertView()
    }
    
    @IBAction func runGoForward(_ sender: Any) {
        
    }
    
    func localSucDeal(deals:JSON){
        let rxpCharmerJqj = deals["rxpMechanicsJqj"]["excuse"].stringValue
        if rxpCharmerJqj.count > 0{
            applyHandle.applyHandleJumpPages(page: rxpCharmerJqj, pid: self.currentPid)
            jumpRemoved()
        }else{
            let rxpOctonaryJqj = deals["rxpOctonaryJqj"].stringValue
            if rxpOctonaryJqj.hasPrefix("http"){
                applyHandle.firstDaylbondIntrance(palcee: rxpOctonaryJqj)
                jumpRemoved()
            }
        }
        
    }
    
    public func findTimeWidget(tt:String){
        let timeInt = Int(tt) ?? 0
        tvView.isHidden = timeInt == 0
        tvH.constant = timeInt == 0 ? 0 : 37
        
        currentWidget = timeInt
        if timeInt > 0{
            widgeter = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(startWidget), userInfo: nil, repeats: true)
        }

    }
    
    public func getNewPP() ->[String:Any]{
        return [
            "rxpCadmusJqj":currentStart,
            "rxpHungJqj":currentPid,
            "rxpSolfegeJqj":rxpSolfegeJqj,
            "rxpMimickerJqj":ELoTudeforbemeetSeeder.litteDOe,
            "rxpUtilisationJqj":timePeraBeeStart(),
            "rxpErythromycinJqj":PERABEEDeviceTool.getIDFV(),
            "rxpInningJqj":ELoTudeforbemeetSeeder.gitteDOe,
        ]
    }
    
    public func jumpRemoved() {
        guard var viewControllers = self.navigationController?.viewControllers else { return }
        if let index = viewControllers.firstIndex(of: self) {
            viewControllers.remove(at: index)
            self.navigationController?.viewControllers = viewControllers
        }
    }
    
}

