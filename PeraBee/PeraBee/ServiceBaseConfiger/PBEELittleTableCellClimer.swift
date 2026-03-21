//
//  PBEELittleTableCellClimer.swift
//  PeraBee
//
//  Created by Sibs on 2024/10/9.
//


class PBEELittleTableCellClimer: UITableViewCell {
    var jumpUrl  = ""
    var bgView = UIView()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style:  style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        bgView.frame = CGRect(x: 12, y: 0, width: Wids - 24, height: 157)
        bgView.cornerRadius = 12
        contentView.addSubview(bgView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static func cellHeight(info:JSON) -> Double {
        let btnText = info["rxpHippiedomJqj"].stringValue
        if btnText.isEmpty {
            return 133
        }else {
            return 169
        }
    }
    
    func loadData(info:JSON) {
        let btnText = info["rxpHippiedomJqj"].stringValue
        let logo = info["rxpReturnedJqj"].stringValue
        let name = info["rxpGefuffleJqj"].stringValue
        let orderStatus = info["rxpImpeditiveJqj"].stringValue
        
        let colorText = info["rxpZoosterolJqj"].stringValue
        
        
        var aColor = rgba(252, 181, 1, 1)
        if !colorText.isEmpty {
            aColor = hex(colorText)
        }
        
        let amountText = info["rxpGranititeJqj"].stringValue
        
        let endDate = info["rxpTrumanJqj"].stringValue
        let amountTextDesc = info["amount_foot_test"].stringValue

        
        bgView.height = 157
        if btnText.isEmpty {
            bgView.height = 121
        }
        bgView.removeAllSubviews()
        bgView.backgroundColor = aColor
        
        let debtBg = UIView(frame: CGRect(x: 12, y: 0, width: bgView.width - 24, height: bgView.height))
        debtBg.backgroundColor = .white
        bgView.addSubview(debtBg)
        
        let icon = UIImageView(frame: CGRect(x:8, y: 10, width: 28, height: 28))
        icon.kf.setImage(with: URL(string: logo))
        icon.cornerRadius = 4
        debtBg.addSubview(icon)
        
        let nameLabel = UILabel(frame: CGRect(x: icon.right + 4, y: icon.y, width: debtBg.width/2, height: icon.height))
        nameLabel.textColor = aColor
        nameLabel.font = boldErasItc(10)
        nameLabel.text = name
        debtBg.addSubview(nameLabel)
        
        let status = UILabel(frame: CGRect(x: 0, y: icon.y, width: debtBg.width - 12, height: icon.height))
        status.textColor = aColor
        status.font = .systemFont(ofSize: 14)
        status.text = orderStatus
        status.textAlignment = .right
        debtBg.addSubview(status)
        
        let line = DashedLineView(frame: CGRect(x: 12, y: 45, width: debtBg.width - 24, height: 1))
        debtBg.addSubview(line)
        
        let amount = UILabel(frame: CGRect(x: endDate.isEmpty ? debtBg.width/4 : 0, y: 49, width: debtBg.width/2, height: 47))
        amount.textColor = aColor
        amount.font = boldErasItc(32)
        amount.text = amountText
        amount.textAlignment = .center
        debtBg.addSubview(amount)
        
        let amountDesc = UILabel(frame: CGRect(x: endDate.isEmpty ? debtBg.width/4 : 0, y: 90, width: debtBg.width/2, height: 15))
        amountDesc.textColor = rgba(102, 102, 102, 1)
        amountDesc.font = .systemFont(ofSize: 12)
        amountDesc.text = amountTextDesc
        amountDesc.textAlignment = .center
        debtBg.addSubview(amountDesc)
        
        if !endDate.isEmpty {
            let date = UILabel(frame: CGRect(x: debtBg.width/2, y: 49, width: debtBg.width/2, height: 47))
            date.textColor = aColor
            date.font = boldErasItc(20)
            date.text = endDate
            date.textAlignment = .center
            debtBg.addSubview(date)
            
            let dateDesc = UILabel(frame: CGRect(x: debtBg.width/2, y: 90, width: debtBg.width/2, height: 15))
            dateDesc.textColor = rgba(102, 102, 102, 1)
            dateDesc.font = .systemFont(ofSize: 12)
            dateDesc.text = "Repayment date"
            dateDesc.textAlignment = .center
            debtBg.addSubview(dateDesc)
        }
        
        if btnText.isEmpty {
            return
        }
        
        let debtBtnBg = UIView(frame: CGRect(x: 12, y: 113, width: debtBg.width - 24, height: 34))
        debtBtnBg.backgroundColor = aColor
        debtBtnBg.cornerRadius = 17
        debtBg.addSubview(debtBtnBg)
        
        let debtBtn = UILabel(frame: CGRect(x: 0, y: 0, width: debtBtnBg.width, height: 32))
        debtBtn.textColor = aColor
        debtBtn.font = boldErasItc(12)
        debtBtn.text = btnText
        debtBtn.cornerRadius = 16
        debtBtn.textAlignment = .center
        debtBtn.backgroundColor = rgba(245, 255, 211, 1)
        debtBtnBg.addSubview(debtBtn)
    }
    
}

class EmptyCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style:  style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        
        let image = UIImageView(frame: CGRect(x:88.w, y: 88.w, width: 194.w, height: 194.w))
        image.image = UIImage(named: "blank_icon")
        contentView.addSubview(image)
        
        let toApply = UILabel(frame: CGRect(x: 40, y: image.bottom + 40, width: Wids - 80, height: 40))
        toApply.textColor = .white
        toApply.backgroundColor = rgba(255, 140, 0, 1)
        toApply.cornerRadius = 20
        toApply.font = boldErasItc(16)
        toApply.textAlignment = .center
        toApply.text = "Apply now"
        contentView.addSubview(toApply)
        toApply.balenceCust {
            AppDelegate.tabVC.selectedIndex = 0
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
