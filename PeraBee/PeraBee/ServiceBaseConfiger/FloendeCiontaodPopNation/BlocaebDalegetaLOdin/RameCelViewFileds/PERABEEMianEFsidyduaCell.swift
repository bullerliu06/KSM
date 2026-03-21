//
//  PERABEEMianEFsidyduaCell.swift
//  PeraBee
//
//  Created by Cris on 2024/10/6.
//

import UIKit
import FSPagerView

class PERABEEMianEFsidyduaCell: UITableViewCell,FSPagerViewDelegate, FSPagerViewDataSource {
   
    var bannerClickBlock: PERStringBlock?
    var jsonModel: JSON = JSON()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        setPERABEEMianEFsidyduaCellUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setPERABEEMianEFsidyduaCellUI(){
        bannerView.frame = CGRect(x: 12, y: 0, width: Wids - 24, height: 112)
        contentView.addSubview(bannerView)
    }
    
    
    func updataPERABEEMianEFsidyduaCellUI(jsonModel:JSON){
        self.jsonModel = jsonModel
        
        if ( self.jsonModel["rxpCowbaneJqj"].arrayValue.count == 1) {
            bannerView.isScrollEnabled = false
            bannerView.automaticSlidingInterval = 0
        }else {
            bannerView.isScrollEnabled = true
            bannerView.automaticSlidingInterval = 3
        }
        self.bannerView.reloadData()
    }
    
    
    //MARK: - FSPagerView
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        self.jsonModel["rxpCowbaneJqj"].arrayValue.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "PERABEEMianBannerCellID", at: index)
        let dic = self.jsonModel["rxpCowbaneJqj"].arrayValue[index].dictionaryValue
        let imageUrl = dic["rxpServiceJqj"]?.stringValue
        //cell.imageView?.kf.setImage(with: URL(string:(imageUrl ?? "")))
        cell.imageView?.kf.setImage(with: URL(string:(imageUrl ?? "")), placeholder:(UIImage(named: "Mian_Banner_Nor")))
        return cell
    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        let dic = self.jsonModel["rxpCowbaneJqj"].arrayValue[index].dictionaryValue
        if let bannerClickBlock = bannerClickBlock  {
            bannerClickBlock(dic["rxpOctonaryJqj"]?.stringValue ?? "")
        }
    }
    
    //MARK: - lazy

    private lazy var bannerView : FSPagerView = {
        let bannerView = FSPagerView()
        bannerView.delegate = self
        bannerView.dataSource = self
        bannerView.automaticSlidingInterval =  3
        bannerView.isInfinite = !bannerView.isInfinite
        bannerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "PERABEEMianBannerCellID")
        return bannerView
    }()
    
}
