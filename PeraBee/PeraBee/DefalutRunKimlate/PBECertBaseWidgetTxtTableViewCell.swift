//
//  PBECertBaseWidgetTxtTableViewCell.swift
//  PeraBee
//
//  Created by Parme on 2024/10/6.
//

import UIKit

class PBECertBaseWidgetTxtTableViewCell: UITableViewCell,UITextFieldDelegate {
    
    var clickBalcik:PERStringBlock?

    @IBOutlet weak var txtLaev: UITextField!
    @IBOutlet weak var topLabs: UILabel!
    
    var tabseonnse:UITableView?
    var datst = JSON()
    override func awakeFromNib() {
        super.awakeFromNib()
        txtLaev.delegate = self
        txtLaev.addTarget(self, action: #selector(textDidChange(_:)), for: .editingChanged)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        clickBalcik?(textField.text ?? "")
        emailAlertView.dismiss()
    }
    
    @objc private func textDidChange(_ textField: UITextField){
        guard let tableView = self.tabseonnse ,datst["rxpUmbJqj"].stringValue == "Email" else { return }
        let components = textField.text?.components(separatedBy: "@") ?? []
        let prefix = components.first ?? ""
        let suffix = components.count > 1 ? components[1] : ""
        
        var currentSuggestions = [String]()
        if !textField.text!.isEmpty {
            let suggestions = ["gmail.com", "icloud.com", "yahoo.com", "outlook.com"].map { "\(prefix)@\($0)" }
            currentSuggestions = suffix.isEmpty ? suggestions : suggestions.filter { $0.hasPrefix(suffix) }
            // Display suggestion popover
            let rectInScreen = tableView.convert(self.frame, to: self.superview)
            emailAlertView.frame.origin.y = rectInScreen.origin.y + 40
            emailAlertView.isHidden = false
            emailAlertView.dataArray = currentSuggestions
            tableView.setContentOffset(CGPoint(x: 0, y: rectInScreen.origin.y - self.frame.size.height), animated: true)
            if tableView.subviews.contains(emailAlertView) == false {
                emailAlertView.showView(in: tableView)
            }
        }
        
        if textField.text!.isEmpty {
            emailAlertView.dismiss()
        }
    }
    
    lazy var emailAlertView: PBECertBaseWidgetEmailView = {
        let alertView = PBECertBaseWidgetEmailView(frame: UIScreen.main.bounds)
        alertView.selectBlock = { [weak self] title in
            self?.txtLaev.text = title
            self?.txtLaev.resignFirstResponder()
        }
        alertView.cancelBlock = { [weak self] in
            if self?.txtLaev.text?.hasSuffix("@") == true {
                self?.txtLaev.text = String(self?.txtLaev.text?.dropLast() ?? "")
            }
            self?.txtLaev.resignFirstResponder()
            self?.emailAlertView.dismiss()
        }
        return alertView
    }()
    
    public func bettrayJsons(datst:JSON,tabse:UITableView?){
        self.datst = datst
        topLabs.text = datst["rxpUmbJqj"].stringValue
        txtLaev.text = datst["rxpRattlebrainJqj"].stringValue
        txtLaev.placeholder = datst["rxpOverrigidJqj"].stringValue
        self.tabseonnse = tabse
        txtLaev.keyboardType = datst["rxpNitrifyJqj"].intValue == 1 ? .numberPad : .default
    }
    
}
