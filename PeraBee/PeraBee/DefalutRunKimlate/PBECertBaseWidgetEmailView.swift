//
//  PBECertBaseWidgetEmailView.swift
//  PeraBee
//
//  Created by Parme on 2024/10/7.
//

import UIKit

class PBECertBaseWidgetEmailView: UIView,UITableViewDataSource, UITableViewDelegate {
    
    var dataArray: [String] = [] {
        didSet {
            tableView.frame.origin.y = topMargin
            heightMargin = dataArray.count > 4 ? (36.0 * 4 + 15.0) : (CGFloat(dataArray.count) * 36.0 + 15.0)
            tableView.frame.size.height = heightMargin
            tableView.reloadData()
            if dataArray.isEmpty {
                dismiss()
            }
        }
    }
    var topMargin: CGFloat = 0.0
    var heightMargin: CGFloat = 0.0
    var selectBlock: ((String) -> Void)?
    var cancelBlock: (() -> Void)?
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect(x: 12, y: 0, width: Wids-48, height: 144), style: .plain)
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private lazy var tapBgView: UIView = {
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = .clear
        let tap = UITapGestureRecognizer(target: self, action: #selector(canceled))
        view.addGestureRecognizer(tap)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        timiCioardLoads()
    }
    
    required init?(coder: NSCoder) {
        fatalError("coder init error")
    }
    
    private func timiCioardLoads() {
        addSubview(tapBgView)
        addSubview(tableView)
    }
    
    func showView(in view: UIView) {
        IQKeyboardManager.shared.resignOnTouchOutside = false
        IQKeyboardManager.shared.enable = false
        tableView.frame.origin.y = topMargin
        view.addSubview(self)
    }
    
    func dismiss() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.resignOnTouchOutside = true
        removeFromSuperview()
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = Bundle.main.loadNibNamed("PBECertBaseWidgetEmailCell", owner: self, options: nil)?.first as? PBECertBaseWidgetEmailCell {
            cell.neopajhfLbde(tiaoe: self.dataArray[indexPath.row], isserhfgyiahf: indexPath.row==0)
            return cell
        }
        return UITableViewCell()
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row < dataArray.count {
            selectBlock?(dataArray[indexPath.row])
            dismiss()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 36.0
    }
    
    @objc private func canceled() {
        cancelBlock?()
    }
    
}
