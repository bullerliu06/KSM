//
//  XTCommonCells.swift
//  XTApp
//
//  Created by Codex on 2026/4/26.
//

import UIKit

@objcMembers
@objc(XTCell)
class XTCell: UITableViewCell {
    var ID: String?
    var xt_height: Float = 0
    var xt_data: Any?

    required override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        selectionStyle = .none
        backgroundColor = .clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    @objc(xt_reloadData:)
    func xt_reloadData(_ data: Any?) {
        xt_data = data
    }
}

@objcMembers
@objc(XTSpaceCell)
class XTSpaceCell: XTCell {
}

@objcMembers
@objc(XTCellModel)
class XTCellModel: NSObject {
    var height: CGFloat = 0
    var xt_data: Any?
    var indexCell = XTCell(style: .default, reuseIdentifier: nil)

    @objc(xt_cellClassName:height:model:)
    class func xt_cellClassName(_ className: String, height: CGFloat, model: Any?) -> XTCellModel {
        let cellModel = XTCellModel()
        cellModel.height = height
        cellModel.xt_data = model

        let targetCell = (NSClassFromString(className) as? XTCell.Type)?
            .init(style: .default, reuseIdentifier: nil) ?? XTCell(style: .default, reuseIdentifier: nil)

        targetCell.xt_height = Float(height)
        cellModel.indexCell = targetCell
        targetCell.xt_reloadData(model)

        return cellModel
    }

    @objc(xt_cellClassName:height:model:ID:)
    class func xt_cellClassName(_ className: String, height: CGFloat, model: Any?, ID: String) -> XTCellModel {
        let cellModel = xt_cellClassName(className, height: height, model: model)
        cellModel.indexCell.ID = ID
        return cellModel
    }
}
