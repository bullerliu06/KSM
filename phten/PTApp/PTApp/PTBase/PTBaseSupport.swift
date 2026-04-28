//
//  PTBaseSupport.swift
//  PTApp
//

import UIKit

@objc(PTBaseViewModel)
class PTBaseViewModel: NSObject {}

@objc(PTBaseTableViewCell)
class PTBaseTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    @objc(configUIWithModel:)
    func configUI(with model: Any) {}

    @objc(setupUI)
    func setupUI() {}
}
