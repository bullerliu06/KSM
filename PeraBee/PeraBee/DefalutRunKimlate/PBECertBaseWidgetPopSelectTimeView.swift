//
//  PBECertBaseWidgetPopSelectTimeView.swift
//  PeraBee
//
//  Created by Parme on 2024/10/8.
//
/*
 let basicTimeSing = PBECertBaseWidgetPopSelectTimeView(dateStr: "08-01-2025", title: "Next Pay Date")
 basicTimeSing.show()
 basicTimeSing.selectBlock = { dataStr  in
     
 }
 */

import UIKit

class PBECertBaseWidgetPopSelectTimeView: UIView {
    
    private var dateStr: String?
    private var titleStr: String?
    private var alertView: UIView = UIView()
    private var datePicker: UIDatePicker = UIDatePicker()
    var selectBlock: (_ result: String) -> Void = {_  in}

    init(dateStr: String?, title: String) {
        super.init(frame: .zero)
        self.dateStr = dateStr
        self.titleStr = title
        timiCioardLoads()
        dateChange()
    }
    
    required init?(coder: NSCoder) {
        fatalError("coder init error")
    }
    
    private func timiCioardLoads() {
        frame = UIScreen.main.bounds
        
        let bgGrayView = UIButton(type: .custom)
        bgGrayView.frame = frame
        bgGrayView.backgroundColor = .black.withAlphaComponent(0.18)
        bgGrayView.addTarget(self, action: #selector(bgBtnClick), for: .touchUpInside)
        addSubview(bgGrayView)
        
        alertView.backgroundColor = .white
        alertView.layer.cornerRadius = 16
        alertView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        addSubview(alertView)

       
        alertView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(400)
        }

       
        let titleLabel = UILabel()
        titleLabel.text = titleStr ?? ""
        titleLabel.textColor = UIColor(red: 51.0/255.0, green: 51.0/255.0, blue: 51.0/255.0, alpha: 1.0)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.textAlignment = .center
        alertView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(alertView).inset(15)
            make.top.equalTo(alertView)
            make.height.equalTo(50)
        }
        
        datePicker.datePickerMode = .date
        datePicker.locale = Locale(identifier: "en_AU")
        
        
        datePicker.maximumDate = Date(timeIntervalSince1970:self.toolTime(with: "31-12-2040", formatter: "dd-MM-yyyy"))
        datePicker.minimumDate = Date(timeIntervalSince1970:self.toolTime(with: "01-01-1960", formatter: "dd-MM-yyyy"))
        
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        if let dateStr = dateStr,let date = dateFormatter.date(from: dateStr){
            datePicker.setDate(date, animated: false)
        }
        datePicker.addTarget(self, action: #selector(dateChange), for: .valueChanged)
        alertView.addSubview(datePicker)
       
        datePicker.snp.makeConstraints { make in
            make.leading.trailing.equalTo(alertView)
            make.top.equalTo(titleLabel.snp.bottom)
            make.height.equalTo(240)
        }

        
        let confirmBtn = UIButton(type: .custom)
        confirmBtn.backgroundColor = UIColor(red: 255.0/255.0, green: 140.0/255.0, blue: 0, alpha: 1.0)
        confirmBtn.setTitle("confirm", for: .normal)
        confirmBtn.setTitleColor(.white, for: .normal)
        confirmBtn.titleLabel?.font = .boldSystemFont(ofSize: 18)
        confirmBtn.layer.cornerRadius = 23
        confirmBtn.addTarget(self, action: #selector(selectAction), for: .touchUpInside)
        alertView.addSubview(confirmBtn)

        
        confirmBtn.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(20)
            make.left.right.equalToSuperview().inset(25)
            make.height.equalTo(46)
        }
    }

    @objc private func dateChange() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        dateStr = formatter.string(from: datePicker.date)
        print("===\(dateStr ?? "")")
    }
    
    @objc private func selectAction() {
        if let dateStr = dateStr, !dateStr.isEmpty {
            selectBlock(dateStr)
        }
        hide()
    }
    
    func show() {
        alertView.frame.origin.y = UIScreen.main.bounds.height
        UIApplication.shared.windows.first { $0.isKeyWindow }?.addSubview(self)
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.alertView.frame.origin.y = UIScreen.main.bounds.height - 400
        }
    }
    
    @objc private func bgBtnClick() {
        hide()
    }
    
    private func hide() {
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = 0
        }) { _ in
            self.removeFromSuperview()
        }
    }
    
    func toolTime(with dateString: String, formatter: String) -> TimeInterval {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatter
        if let date = dateFormatter.date(from: dateString) {
            return date.timeIntervalSince1970
        }
        return 0
    }

}
