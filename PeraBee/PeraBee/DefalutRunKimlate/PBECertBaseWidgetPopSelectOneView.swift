//
//  PBECertBaseWidgetPopSelectOneView.swift
//  PeraBee
//
//  Created by Parme on 2024/10/7.
//

import UIKit

class PBECertBaseWidgetPopSelectOneView: UIView {
    
    // MARK: - Propertie
    private var popJson = JSON()
    private var isId:Bool = false
    private var onConfirm: ((String) -> Void)?
    
    // UI Components
    private let backgroundView = UIView()
    private let popupView = UIView()
    private let titleLabel = UILabel()
    private let tableView = UITableView()
    private let confirmButton = UIButton()
    
    // MARK: - Initialization
    init(popJson: JSON,isId:Bool = false,onConfirm: @escaping (String) -> Void) {
        self.isId = isId
        self.popJson =  popJson
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
        
        titleLabel.text = isId ? "Select ID Type" : self.popJson["rxpUmbJqj"].stringValue
        titleLabel.textColor = UIColor(red: 51.0/255.0, green: 51.0/255.0, blue: 51.0/255.0, alpha: 1.0)
        titleLabel.font = PBEE_PR(16)
        titleLabel.numberOfLines = 2
        titleLabel.textAlignment = .center
        popupView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(17)
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(40)
        }
        
        let linsae = UIView()
        linsae.backgroundColor = UIColor(red: 255.0/255.0, green: 247.0/255.0, blue: 238.0/255.0, alpha: 1.0)
        popupView.addSubview(linsae)
        linsae.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(1)
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
            make.bottom.equalToSuperview().inset(20)
        }
        
        if isId{
            var index = 0
            for i in 0..<popJson["rxpConvivialityJqj"].arrayValue.count{
                if popJson["rxpInseverableJqj"].stringValue == popJson["rxpConvivialityJqj"][i]["rxpDehydrogenationJqj"].stringValue{
                    index = i
                }
            }
            if index>0 {
                index -= 1
            }
            tableView.scrollToRow(at: IndexPath(row: index, section: 0), at: .top, animated: false)
        }
        
        
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
    

}

// MARK: - TableView Delegate & DataSource
extension PBECertBaseWidgetPopSelectOneView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isId ? self.popJson["rxpConvivialityJqj"].arrayValue.count : self.popJson["rxpAliyahJqj"].arrayValue.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 36
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OptionCell", for: indexPath)
        let keys = isId ? popJson["rxpConvivialityJqj"][indexPath.row]["rxpDehydrogenationJqj"].stringValue : popJson["rxpAliyahJqj"][indexPath.row]["rxpNeoromanticismJqj"].stringValue
        let values = isId ? popJson["rxpConvivialityJqj"][indexPath.row]["rxpEpeiricJqj"].stringValue : popJson["rxpAliyahJqj"][indexPath.row]["rxpMensalJqj"].stringValue
        
        cell.selectionStyle = .none
        cell.textLabel?.text = values
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        cell.contentView.layer.cornerRadius = 18
        cell.contentView.layer.masksToBounds = true
        let defaultValue = isId ? popJson["rxpInseverableJqj"].stringValue : popJson["rxpIntimismJqj"]["rxpAliyahJqj"].stringValue
        if remakeUi(withUnkownstr: defaultValue),keys == defaultValue {
            cell.contentView.backgroundColor = UIColor(red: 255.0/255.0, green: 231.0/255.0, blue: 201.0/255.0, alpha: 1.0)
            cell.textLabel?.textColor = UIColor(red: 51.0/255.0, green: 51.0/255.0, blue: 51.0/255.0, alpha: 1.0)
        } else {
            cell.contentView.backgroundColor = .white
            cell.textLabel?.textColor = .gray
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedKey = isId ? popJson["rxpConvivialityJqj"][indexPath.row]["rxpDehydrogenationJqj"].stringValue : popJson["rxpAliyahJqj"][indexPath.row]["rxpNeoromanticismJqj"].stringValue
        
        let defaultValue = isId ? popJson["rxpInseverableJqj"].stringValue : popJson["rxpIntimismJqj"]["rxpAliyahJqj"].stringValue
        if selectedKey != defaultValue{
            onConfirm?(selectedKey)
        }
        hidePopup()
    }
}


