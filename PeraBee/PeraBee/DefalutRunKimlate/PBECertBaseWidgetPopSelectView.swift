//
//  PBECertBaseWidgetPopSelectView.swift
//  PeraBee
//
//  Created by Parme on 2024/10/7.
//

import UIKit

class PBECertBaseWidgetPopSelectView: UIView {
    
    // MARK: - Propertie
    private var selectedValue:String = ""
    private var popJson = JSON()
    private var isB = false
    private var onConfirm: ((String) -> Void)?
    
    
    // UI Components
    private let backgroundView = UIView()
    private let popupView = UIView()
    private let titleLabel = UILabel()
    private let tableView = UITableView()
    private let confirmButton = UIButton()
    
    // MARK: - Initialization
    init(popJson: JSON,isB:Bool=false,onConfirm: @escaping (String) -> Void) {
        self.popJson =  popJson
        self.isB = isB
        self.selectedValue = isB ? popJson["rxpIntimismJqj"]["rxpGanoinJqj"].stringValue : popJson["rxpRattlebrainJqj"].stringValue
        self.onConfirm = onConfirm
        super.init(frame: UIScreen.main.bounds)
        setupUI()
        showPopup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        backgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.13)
        backgroundView.alpha = 0
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hidePopup))
        backgroundView.addGestureRecognizer(tapGesture)
        addSubview(backgroundView)
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        popupView.backgroundColor = .white
        popupView.layer.cornerRadius = 16
        popupView.clipsToBounds = true
        addSubview(popupView)
        popupView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(300)
            make.height.equalTo(300)
        }
        
        let closeBtn = UIButton(type: .custom)
        closeBtn.setImage(UIImage(named: "cert_close"), for: .normal)
        closeBtn.addTarget(self, action: #selector(hidePopup), for: .touchUpInside)
        popupView.addSubview(closeBtn)
        
        
        titleLabel.text = isB ? "Please Select" : self.popJson["rxpUmbJqj"].stringValue
        titleLabel.textColor = UIColor(red: 51.0/255.0, green: 51.0/255.0, blue: 51.0/255.0, alpha: 1.0)
        titleLabel.font = PBEE_PR(16)
        titleLabel.numberOfLines = 2
        popupView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(17)
            make.left.equalToSuperview().offset(24)
            make.right.equalTo(closeBtn.snp.left).offset(-40)
            make.height.equalTo(40)
        }
        
        closeBtn.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-20)
            make.centerY.equalTo(titleLabel)
            make.size.equalTo(CGSize(width: 17, height: 17))
        }
        
        let linsae = UIView()
        linsae.backgroundColor = UIColor(red: 255.0/255.0, green: 247.0/255.0, blue: 238.0/255.0, alpha: 1.0)
        popupView.addSubview(linsae)
        linsae.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(1)
        }

        confirmButton.setTitle("confirm", for: .normal)
        confirmButton.backgroundColor = UIColor(red: 255.0/255.0, green: 140.0/255.0, blue: 0, alpha: 1.0)
        confirmButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        confirmButton.setTitleColor(.white, for: .normal)
        confirmButton.layer.cornerRadius = 23
        confirmButton.addTarget(self, action: #selector(confirmSelection), for: .touchUpInside)
        popupView.addSubview(confirmButton)
        confirmButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(20)
            make.left.right.equalToSuperview().inset(25)
            make.height.equalTo(46)
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "OptionCell")
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        popupView.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(linsae.snp.bottom).offset(1)
            make.left.right.equalToSuperview().inset(24)
            make.bottom.equalTo(confirmButton.snp.top).offset(-2)
        }
        var index = 0
        if isB{
            for i in 0..<popJson["rxpUnpresentedJqj"].arrayValue.count{
                if selectedValue == popJson["rxpUnpresentedJqj"][i]["rxpGalvanoscopicJqj"].stringValue{
                    index = i
                }
            }
        }else{
            for i in 0..<popJson["rxpConvivialityJqj"].arrayValue.count{
                if selectedValue == popJson["rxpConvivialityJqj"][i]["rxpOsculateJqj"].stringValue{
                    index = i
                }
            }
        }
        
        if index>0 {
            index -= 1
        }
        tableView.scrollToRow(at: IndexPath(row: index, section: 0), at: .top, animated: true)
    }
    
    // MARK: - Show & Hide Popup
    private func showPopup() {
        guard let window = UIApplication.shared.windows.first else { return }
        window.addSubview(self)
        layoutIfNeeded()
        UIView.animate(withDuration: 0.3) {
            self.backgroundView.alpha = 1
            self.popupView.snp.updateConstraints { make in
                make.bottom.equalToSuperview()
            }
            self.layoutIfNeeded()
        }
    }
    
    @objc private func hidePopup() {
        UIView.animate(withDuration: 0.3, animations: {
            self.backgroundView.alpha = 0
            self.popupView.snp.updateConstraints { make in
                make.bottom.equalToSuperview().offset(300)
            }
            self.layoutIfNeeded()
        }) { _ in
            self.removeFromSuperview()
        }
    }
    
    // MARK: - Actions
    @objc private func confirmSelection() {
        let defalutV = isB ? self.popJson["rxpIntimismJqj"]["rxpGanoinJqj"].stringValue : self.popJson["rxpRattlebrainJqj"].stringValue
        if selectedValue != defalutV {
            onConfirm?(selectedValue)
        }
        hidePopup()
    }
}

// MARK: - TableView Delegate & DataSource
extension PBECertBaseWidgetPopSelectView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isB ? self.popJson["rxpUnpresentedJqj"].arrayValue.count : self.popJson["rxpConvivialityJqj"].arrayValue.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 36
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OptionCell", for: indexPath)
        let keys = isB ? popJson["rxpUnpresentedJqj"][indexPath.row]["rxpGalvanoscopicJqj"].stringValue : popJson["rxpConvivialityJqj"][indexPath.row]["rxpOsculateJqj"].stringValue
        let values = isB ? popJson["rxpUnpresentedJqj"][indexPath.row]["rxpMensalJqj"].stringValue : popJson["rxpConvivialityJqj"][indexPath.row]["rxpMensalJqj"].stringValue
        cell.selectionStyle = .none
        cell.textLabel?.text = values
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        cell.contentView.layer.cornerRadius = 18
        cell.contentView.layer.masksToBounds = true
        if keys == selectedValue {
            cell.contentView.backgroundColor = UIColor(red: 255.0/255.0, green: 231.0/255.0, blue: 201.0/255.0, alpha: 1.0)
            cell.textLabel?.textColor = UIColor(red: 51.0/255.0, green: 51.0/255.0, blue: 51.0/255.0, alpha: 1.0)
        } else {
            cell.contentView.backgroundColor = .white
            cell.textLabel?.textColor = .gray
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedValue = isB ? popJson["rxpUnpresentedJqj"][indexPath.row]["rxpGalvanoscopicJqj"].stringValue : popJson["rxpConvivialityJqj"][indexPath.row]["rxpOsculateJqj"].stringValue
        tableView.reloadData()
        tableView.scrollToRow(at: indexPath, at: .middle, animated: true)
    }
}

