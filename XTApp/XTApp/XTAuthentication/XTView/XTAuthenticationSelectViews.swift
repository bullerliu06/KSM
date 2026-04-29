//
//  XTAuthenticationSelectViews.swift
//  XTApp
//
//  Created by Codex on 2026/4/30.
//

import UIKit

let xtSelectRowHeight: CGFloat = 42

@objcMembers
@objc(XTEmailView)
class XTEmailView: UIView {
    dynamic var block: XTStrBlock?
    private weak var textField: UITextField?
    private let emailList = ["gmail.com", "icloud.com", "yahoo.com", "outlook.com"]
    private var btnList: [UIButton] = []

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
        backgroundColor = XT_RGB(0x02CC56, 1.0)
        layer.cornerRadius = 8
        clipsToBounds = true
        for (index, _) in emailList.enumerated() {
            let btn = UIButton(type: .custom)
            btn.titleLabel?.font = XT_Font(12)
            btn.setTitleColor(.white, for: .normal)
            btn.contentHorizontalAlignment = .left
            btn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 7, bottom: 0, right: 7)
            btn.tag = index
            btn.addTarget(self, action: #selector(selectEmail(_:)), for: .touchUpInside)
            btnList.append(btn)
            addSubview(btn)
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let rowH: CGFloat = 30
        for (index, btn) in btnList.enumerated() {
            btn.frame = CGRect(x: 0, y: CGFloat(index) * rowH, width: bounds.width, height: rowH)
        }
    }

    @objc(xt_showTextField:)
    func xt_showTextField(_ textField: UITextField) {
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboard(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        self.textField = textField
    }

    @objc private func handleKeyboard(_ notification: Notification) {
        guard let textField else { return }
        var view: UIView? = textField
        while view != nil, !(view is UITableView) {
            view = view?.superview
        }
        guard let tableView = view else { return }
        tableView.addSubview(self)
        xt_reloadText()

        let rowH: CGFloat = 30
        let rect = textField.superview?.convert(textField.frame, to: XT_AppDelegate?.window) ?? .zero
        let keyboardFrame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue ?? .zero
        let height = CGFloat(emailList.count) * rowH
        let y: CGFloat
        if rect.maxY + keyboardFrame.height + height > XT_Screen_Height {
            y = max(textField.frame.minY - height, 0)
        } else {
            y = textField.frame.maxY
        }
        frame = CGRect(x: textField.frame.minX, y: y, width: max(textField.frame.width - 18, 0), height: height)
    }

    @objc func xt_reloadText() {
        let prefix = XT_Object_To_Stirng(textField?.text).components(separatedBy: "@").first ?? ""
        for (index, domain) in emailList.enumerated() where index < btnList.count {
            btnList[index].setTitle("\(prefix)@\(domain)", for: .normal)
        }
    }

    @objc func xt_remove() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        textField = nil
        removeFromSuperview()
    }

    @objc private func selectEmail(_ sender: UIButton) {
        block?(sender.title(for: .normal))
    }
}

@objcMembers
@objc(XTSelectDayView)
class XTSelectDayView: UIView {
    dynamic var closeBlock: XTBlock?
    dynamic var sureBlock: XTDicBlock?
    private weak var picker: UIDatePicker?

    @objc(initTit:)
    init(tit: String) {
        super.init(frame: UIScreen.main.bounds)
        setup(tit: tit)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup(tit: "")
    }

    private func setup(tit: String) {
        let dismiss = UIButton(type: .custom)
        dismiss.addTarget(self, action: #selector(close), for: .touchUpInside)
        dismiss.frame = bounds
        addSubview(dismiss)

        let containerHeight = 45 + 20 + 216 + 48 + 20 + XT_Bottom_Height
        let container = UIView(frame: CGRect(x: 0, y: bounds.height - containerHeight, width: bounds.width, height: containerHeight))
        container.backgroundColor = .white
        addSubview(container)
        container.xt_rect(container.bounds, corners: [.topLeft, .topRight], size: CGSize(width: 15, height: 15))

        let titleLabel = UILabel(frame: CGRect(x: 15, y: 0, width: container.width - 30, height: 45))
        titleLabel.text = tit
        titleLabel.font = XT_Font_M(15)
        titleLabel.textColor = .black
        container.addSubview(titleLabel)
        container.addSubview(UIView.xt_frame(CGRect(x: 15, y: 45, width: container.width - 30, height: 1), color: XT_RGB(0xE2E2E2, 1.0)))

        let picker = UIDatePicker(frame: CGRect(x: 0, y: 65, width: container.width, height: 216))
        picker.locale = Locale(identifier: "en_GB")
        if #available(iOS 13.4, *) {
            picker.preferredDatePickerStyle = .wheels
        }
        picker.datePickerMode = .date
        picker.backgroundColor = .white
        picker.minimumDate = NSDate.dateFromString("1960-01-01", format: "yyyy-MM-dd") as Date?
        picker.maximumDate = NSDate.dateFromString("2040-12-31", format: "yyyy-MM-dd") as Date?
        container.addSubview(picker)
        self.picker = picker

        let submit = UIButton.xt_btn("Confirm", font: XT_Font_B(20), textColor: .white, cornerRadius: 24, tag: 0)
        submit.backgroundColor = XT_RGB(0x02CC56, 1.0)
        submit.frame = CGRect(x: 20, y: picker.frame.maxY, width: container.width - 40, height: 48)
        submit.addTarget(self, action: #selector(confirm), for: .touchUpInside)
        container.addSubview(submit)
    }

    @objc(xt_value:)
    func xt_value(_ value: String?) {
        XT_AppDelegate?.window?.endEditing(true)
        guard let value, !NSString.xt_isEmpty(value),
              let date = NSDate.dateFromString(value, format: "dd-MM-yyyy") as Date? else { return }
        picker?.date = date
    }

    @objc private func close() {
        closeBlock?()
    }

    @objc private func confirm() {
        let time = (picker?.date as NSDate?)?.getDateStringByFormat("dd-MM-yyyy") ?? ""
        sureBlock?(["name": time, "value": time])
        closeBlock?()
    }
}

@objcMembers
@objc(XTSelectView)
class XTSelectView: UIView, UITableViewDelegate, UITableViewDataSource {
    dynamic var closeBlock: XTBlock?
    dynamic var sureBlock: XTDicBlock?
    private weak var indexModel: XTNoteModel?
    private var list: [XTNoteModel] = []
    private let tableView = UITableView(frame: .zero, style: .plain)

    @objc(initTit:arr:)
    init(tit: String, arr: [XTNoteModel]) {
        super.init(frame: UIScreen.main.bounds)
        list = arr
        setup(tit: tit)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup(tit: "")
    }

    private func setup(tit: String) {
        let dismiss = UIButton(type: .custom)
        dismiss.frame = bounds
        dismiss.addTarget(self, action: #selector(close), for: .touchUpInside)
        addSubview(dismiss)

        let tableHeight = xtSelectRowHeight * 4
        let containerHeight = 45 + 20 + tableHeight + 48 + 20 + XT_Bottom_Height
        let container = UIView(frame: CGRect(x: 0, y: bounds.height - containerHeight, width: bounds.width, height: containerHeight))
        container.backgroundColor = .white
        addSubview(container)
        container.xt_rect(container.bounds, corners: [.topLeft, .topRight], size: CGSize(width: 15, height: 15))

        let titleLabel = UILabel(frame: CGRect(x: 15, y: 0, width: container.width - 30, height: 45))
        titleLabel.text = tit
        titleLabel.font = XT_Font_M(15)
        titleLabel.textColor = .black
        container.addSubview(titleLabel)
        container.addSubview(UIView.xt_frame(CGRect(x: 15, y: 45, width: container.width - 30, height: 1), color: XT_RGB(0xE2E2E2, 1.0)))

        tableView.frame = CGRect(x: 0, y: 65, width: container.width, height: tableHeight)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        container.addSubview(tableView)

        let submit = UIButton.xt_btn("Confirm", font: XT_Font_B(20), textColor: .white, cornerRadius: 24, tag: 0)
        submit.backgroundColor = XT_RGB(0x02CC56, 1.0)
        submit.frame = CGRect(x: 20, y: tableView.frame.maxY, width: container.width - 40, height: 48)
        submit.addTarget(self, action: #selector(confirm), for: .touchUpInside)
        container.addSubview(submit)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "XTSelectViewCell") as? XTSelectViewCell)
            ?? XTSelectViewCell(style: .default, reuseIdentifier: "XTSelectViewCell")
        let model = list[indexPath.row]
        cell.model = model
        cell.isSelect = model === indexModel
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        xtSelectRowHeight
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        indexModel = list[indexPath.row]
        tableView.reloadData()
    }

    @objc(xt_value:)
    func xt_value(_ value: String?) {
        XT_AppDelegate?.window?.endEditing(true)
        indexModel = list.first { $0.xt_type == value }
        tableView.reloadData()
    }

    @objc private func close() {
        closeBlock?()
    }

    @objc private func confirm() {
        guard let indexModel else {
            closeBlock?()
            return
        }
        var dic: [AnyHashable: Any] = [
            "name": XT_Object_To_Stirng(indexModel.xt_name),
            "value": XT_Object_To_Stirng(indexModel.xt_type)
        ]
        if let ocr = indexModel as? XTOcrNoteModel {
            dic["url"] = XT_Object_To_Stirng(ocr.xt_bg_img)
        }
        sureBlock?(dic)
        closeBlock?()
    }
}

@objcMembers
@objc(XTSelectCell)
class XTSelectCell: XTCell {
    weak dynamic var model: XTListModel? {
        didSet {
            nameLab.text = model?.xt_title
            textField.text = model?.name
        }
    }
    dynamic var selectBlock: XTSelectBlock?
    private let nameLab = UILabel()
    private let textField = UITextField()

    required init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        nameLab.font = XT_Font(15)
        nameLab.textColor = .black
        nameLab.frame = CGRect(x: 14, y: 0, width: XT_Screen_Width - 28, height: 21)
        contentView.addSubview(nameLab)

        textField.frame = CGRect(x: 14, y: 27, width: XT_Screen_Width - 28, height: 48)
        textField.font = XT_Font(15)
        textField.textColor = .black
        textField.placeholder = "Please select"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = XT_RGB(0xDDDDDD, 1.0).cgColor
        textField.layer.borderWidth = 1
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 48))
        textField.isUserInteractionEnabled = false
        contentView.addSubview(textField)

        let btn = UIButton(type: .custom)
        btn.frame = textField.frame
        btn.addTarget(self, action: #selector(selectValue), for: .touchUpInside)
        contentView.addSubview(btn)
    }

    @objc func becomeFirst() {
        selectValue()
    }

    @objc private func selectValue() {
        selectBlock? { [weak self] dic in
            self?.model?.name = XT_Object_To_Stirng(dic?["name"])
            self?.model?.value = XT_Object_To_Stirng(dic?["value"])
            self?.model?.xt_value = XT_Object_To_Stirng(dic?["value"])
            self?.textField.text = self?.model?.name
        }
    }
}

@objcMembers
@objc(XTTextCell)
class XTTextCell: XTCell, UITextFieldDelegate {
    weak dynamic var model: XTListModel? {
        didSet {
            nameLab.text = model?.xt_title
            textField.text = model?.value
            textField.keyboardType = model?.xt_cate == "AASIXTENBJ" ? .emailAddress : .default
        }
    }
    dynamic var block: XTBlock?
    private let nameLab = UILabel()
    private let textField = UITextField()
    private lazy var emailView = XTEmailView()

    required init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        nameLab.font = XT_Font(15)
        nameLab.textColor = .black
        nameLab.frame = CGRect(x: 14, y: 0, width: XT_Screen_Width - 28, height: 21)
        contentView.addSubview(nameLab)

        textField.frame = CGRect(x: 14, y: 27, width: XT_Screen_Width - 28, height: 48)
        textField.font = XT_Font(15)
        textField.textColor = .black
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = XT_RGB(0xDDDDDD, 1.0).cgColor
        textField.layer.borderWidth = 1
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 48))
        textField.delegate = self
        textField.addTarget(self, action: #selector(textChanged), for: .editingChanged)
        contentView.addSubview(textField)

        emailView.block = { [weak self] text in
            self?.textField.text = text
            self?.textChanged()
            self?.emailView.xt_remove()
        }
    }

    @objc func becomeFirst() {
        textField.becomeFirstResponder()
    }

    @objc private func textChanged() {
        model?.value = textField.text
        model?.xt_value = textField.text
        block?()
    }

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if model?.xt_cate == "AASIXTENBJ" {
            emailView.xt_showTextField(textField)
        }
        return true
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        emailView.xt_remove()
        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}