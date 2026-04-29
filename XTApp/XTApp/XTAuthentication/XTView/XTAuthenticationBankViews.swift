//
//  XTAuthenticationBankViews.swift
//  XTApp
//
//  Created by Codex on 2026/4/30.
//

import UIKit

@objcMembers
@objc(XTWalletView)
class XTWalletView: UIView, UITableViewDelegate, UITableViewDataSource {
    weak dynamic var textField: UITextField?
    weak dynamic var indexModel: XTNoteModel?
    weak dynamic var model: XTBankItemModel? {
        didSet {
            textField?.text = model?.xt_account
            indexModel = model?.note?.first { $0.xt_type == model?.xt_channel } ?? model?.note?.first
            tableView.reloadData()
        }
    }

    private let tableView = UITableView(frame: .zero, style: .plain)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    convenience init() {
        self.init(frame: .zero)
    }

    private func setup() {
        tableView.frame = bounds
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.tableHeaderView = headerView()
        tableView.tableFooterView = footerView()
        addSubview(tableView)
    }

    private func headerView() -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: XT_Screen_Width, height: 25))
        let label = UILabel(frame: CGRect(x: 14, y: 0, width: XT_Screen_Width - 28, height: 21))
        label.text = "Select your recipient E-wallet"
        label.font = XT_Font_SD(15)
        label.textColor = XT_RGB(0x333333, 1.0)
        view.addSubview(label)
        return view
    }

    private func footerView() -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: XT_Screen_Width, height: 115))
        let label = UILabel(frame: CGRect(x: 14, y: 8, width: XT_Screen_Width - 28, height: 21))
        label.text = "E-wallet Account"
        label.font = XT_Font(15)
        label.textColor = XT_RGB(0x01A652, 1.0)
        view.addSubview(label)

        let textField = UITextField(frame: CGRect(x: 14, y: label.frame.maxY + 6, width: XT_Screen_Width - 28, height: 48))
        textField.placeholder = "Please enter your E-wallet account"
        textField.font = XT_Font(15)
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = XT_RGB(0xDDDDDD, 1.0).cgColor
        textField.layer.borderWidth = 1
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 48))
        view.addSubview(textField)
        self.textField = textField
        return view
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model?.note?.count ?? 0
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        76
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "XTWalletCell") as? XTWalletCell)
            ?? XTWalletCell(style: .default, reuseIdentifier: "XTWalletCell")
        let item = model?.note?[indexPath.row]
        cell.model = item
        cell.isSelect = item === indexModel
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        indexModel = model?.note?[indexPath.row]
        tableView.reloadData()
    }
}

@objcMembers
@objc(XTBankView)
class XTBankView: UIView {
    weak dynamic var model: XTBankItemModel? {
        didSet {
            guard let model else { return }
            if !NSString.xt_isEmpty(model.xt_channel) {
                name = model.xt_channel_name
                value = model.xt_channel
                bankTextField.text = name
                accountTextField.text = model.xt_account
            }
        }
    }
    dynamic var block: XTSelectBlock?
    dynamic var name: String?
    dynamic var value: String?
    dynamic var accountTextField = UITextField()

    private let bankTextField = UITextField()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    convenience init() {
        self.init(frame: .zero)
    }

    private func setup() {
        let title = UILabel(frame: CGRect(x: 14, y: 0, width: XT_Screen_Width - 28, height: 24))
        title.text = "Select Bank"
        title.font = XT_Font_SD(17)
        title.textColor = XT_RGB(0x333333, 1.0)
        addSubview(title)

        addLabel("Bank", y: 40)
        configure(field: bankTextField, y: 67, placeholder: "Please select your bank")
        bankTextField.isUserInteractionEnabled = false
        let btn = UIButton(type: .custom)
        btn.frame = bankTextField.frame
        btn.addTarget(self, action: #selector(selectBank), for: .touchUpInside)
        addSubview(btn)

        addLabel("Bank Account", y: 127)
        configure(field: accountTextField, y: 154, placeholder: "Please enter your bank account number")
    }

    private func addLabel(_ text: String, y: CGFloat) {
        let label = UILabel(frame: CGRect(x: 14, y: y, width: XT_Screen_Width - 28, height: 21))
        label.text = text
        label.font = XT_Font(15)
        label.textColor = .black
        addSubview(label)
    }

    private func configure(field: UITextField, y: CGFloat, placeholder: String) {
        field.frame = CGRect(x: 14, y: y, width: XT_Screen_Width - 28, height: 48)
        field.placeholder = placeholder
        field.font = XT_Font(15)
        field.backgroundColor = .white
        field.layer.cornerRadius = 10
        field.layer.borderColor = XT_RGB(0xDDDDDD, 1.0).cgColor
        field.layer.borderWidth = 1
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 48))
        addSubview(field)
    }

    @objc private func selectBank() {
        block? { [weak self] dic in
            self?.name = XT_Object_To_Stirng(dic?["name"])
            self?.value = XT_Object_To_Stirng(dic?["value"])
            self?.bankTextField.text = self?.name
        }
    }
}

@objcMembers
@objc(XTBankAltView)
class XTBankAltView: UIView {
    dynamic var submitBlock: XTBlock?
    dynamic var cancelBlock: XTBlock?

    @objc(initTit:name:account:)
    init(tit: String, name: String, account: String) {
        super.init(frame: CGRect(x: 0, y: 0, width: 290, height: 413))
        setup(tit: tit, name: name, account: account)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup(tit: "", name: "", account: "")
    }

    private func setup(tit: String, name: String, account: String) {
        backgroundColor = .white
        layer.cornerRadius = 16
        clipsToBounds = true

        let alt = UILabel(frame: CGRect(x: 16, y: 34, width: bounds.width - 32, height: 70))
        alt.text = "Please confirm your withdrawal\naccount information belongs to\nyourself and is correct"
        alt.numberOfLines = 0
        alt.textAlignment = .center
        alt.font = XT_Font(16)
        alt.textColor = XT_RGB(0x3C3C3C, 1.0)
        addSubview(alt)

        addFieldTitle(tit, y: 132)
        addReadonlyField(name, y: 156)
        addFieldTitle("Account number", y: 211)
        addReadonlyField(account, y: 235)

        let cancel = UIButton.xt_btn("Cancel", font: XT_Font_SD(18), textColor: .white, cornerRadius: 20, tag: 0)
        cancel.backgroundColor = XT_RGB(0x0BB559, 1.0)
        cancel.frame = CGRect(x: 13, y: 302, width: 124, height: 40)
        cancel.addTarget(self, action: #selector(cancelTap), for: .touchUpInside)
        addSubview(cancel)

        let submit = UIButton.xt_btn("Confirm", font: XT_Font(18), textColor: XT_RGB(0x0BB559, 1.0), cornerRadius: 20, borderColor: XT_RGB(0x0BB559, 1.0), borderWidth: 1, backgroundColor: .clear, tag: 0)
        submit.frame = CGRect(x: bounds.width - 137, y: 302, width: 124, height: 40)
        submit.addTarget(self, action: #selector(submitTap), for: .touchUpInside)
        addSubview(submit)
    }

    private func addFieldTitle(_ text: String, y: CGFloat) {
        let label = UILabel(frame: CGRect(x: 13, y: y, width: bounds.width - 26, height: 19))
        label.text = text
        label.font = XT_Font(14)
        label.textColor = .black
        addSubview(label)
    }

    private func addReadonlyField(_ text: String, y: CGFloat) {
        let field = UITextField(frame: CGRect(x: 13, y: y, width: bounds.width - 26, height: 43))
        field.text = text
        field.font = XT_Font_SD(14)
        field.backgroundColor = XT_RGB(0xF8F8F8, 1.0)
        field.layer.cornerRadius = 9
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 43))
        field.isUserInteractionEnabled = false
        addSubview(field)
    }

    @objc private func submitTap() {
        submitBlock?()
        cancelBlock?()
    }

    @objc private func cancelTap() {
        cancelBlock?()
    }
}