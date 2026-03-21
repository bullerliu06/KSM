//
//  PBEEWonderfullMainWidget.swift
//  CreditPro
//
//  Created by Sibs on 2024/10/2.
//

import UIKit

class PBEEWonderfullMainWidget: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(getMainWidgetData), name: Notification.Name(CoreadNEsteesklior), object: nibName)
        certMainWidgetUI()
        if PBEEDefaultRunsClearVibs.isLogin{
            getMainWidgetPopViewData()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getMainWidgetData()
    }
    

    @objc func getMainWidgetData(){
        self.mianViewModel.getMainWidgetData { [weak self] result in
            guard let self = self else { return }
            if(result){
                self.mianTableView.reloadData()
                 self.updataMainWidgetSionViewData()
            }
        }
    }
    
    //MARK: - updataMainWidgetSionViewData
    func updataMainWidgetSionViewData(){
    
        if PBEEDefaultRunsClearVibs.isLogin && remakeUi(withUnkownstr:self.mianViewModel.sionViewData["rxpAdversityJqj"].stringValue){
            sionView.sioniocnImgView.kf.setImage(with: URL(string: self.mianViewModel.sionViewData["rxpAdversityJqj"].stringValue),placeholder: UIImage(named: "Mian_SionView_Back")) { result in
                switch result {
                      case .success(let value):
                       sionView.isHidden = false
                       sionView.sioniocnImgView.image = value.image
                       case .failure(_):
                        sionView.isHidden = true
                      }
           }
        }else{
            sionView.isHidden = true
        }
        
    }
    
    func getMainWidgetPopViewData(){
        self.mianViewModel.getMainWidgetPOPViewData { result in
            if remakeUi(withUnkownstr: result["rxpDoublureJqj"].stringValue){
                let mainWidgetPopView =  PERABEEMainWidgetPopView(jsonModel: result)
                mainWidgetPopView.show()
                mainWidgetPopView.confirmBlock = { url in
                    self.mainWidgetJumpWeb(jump: url ?? "")
                }
            }
            
        }
        
    }
    
    
    //MARK: - setupGradientBackground
    func certMainWidgetUI(){
        setupGradientBackground()
        let blurView = UIVisualEffectView(effect: nil)
        blurView.frame = view.bounds
        blurView.backgroundColor = UIColor.clear
        view.addSubview(blurView)
        view.addSubview(mianTableView)
        
        sionView.tapActionBlock = {
            self.mainWidgetJumpWeb(jump: self.mianViewModel.sionViewData["rxpSjcJqj"].stringValue)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0) {
            sionView.frame = CGRect(x: Wids - 60, y: Heis - tabBarHeight - NavBarHeight, width: 52, height: 36)
            UIApplication.shared.windows.first?.addSubview(sionView)
            sionView.isHidden = true
        }

    }
    
    func mainWidgetApply(pid:String){
        if PBEEDefaultRunsClearVibs.isLogin{
            applyHandle.mainWidgetApply(pid: pid)
        }else{
            PBEEDefaultRunsClearVibs.toLogin()
        }
        
    }
    
    func mainWidgetJumpWeb(jump url:String){
        if remakeUi(withUnkownstr: url){
            let webViewVC = PERABEERunPlaSafireToler()
            webViewVC.uiGuester = url
            self.navigationController?.pushViewController(webViewVC, animated: true)
        }
        
    }
    
    //MARK: - setupGradientBackground
    func setupGradientBackground() {
            let foundtaionYer = CAGradientLayer()
             foundtaionYer.frame = CGRect(x: 0, y: 0, width: Wids, height: Heis)
             foundtaionYer.colors = [
                hex("#81EEFA").cgColor,
                hex("#A1FDEA").cgColor,
                hex("#A2FDE9").cgColor,
                hex("#F9F9F9").cgColor,
            ]
            foundtaionYer.startPoint = CGPoint(x: 0.5, y: 0.0)
            foundtaionYer.endPoint = CGPoint(x: 0.5, y: 1.0)
            view.layer.insertSublayer(foundtaionYer, at: 0)
        }
    
    //MARK: - lazy
    lazy var mianViewModel : PERABEEMianViewModel = {
        let mianViewModel = PERABEEMianViewModel()
        return mianViewModel
    }()
    
    lazy var mianTableView : UITableView = {
        let mianTableView = UITableView(frame: CGRect(x: 0, y: NavBarHeight, width: Wids, height: Heis - NavBarHeight - tabBarHeight), style: .plain)
        mianTableView.backgroundColor = .clear
        mianTableView.separatorStyle = .none
        mianTableView.delegate = self
        mianTableView.dataSource = self
        return mianTableView
    }()
    
}

extension PBEEWonderfullMainWidget: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.mianViewModel.mainDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellId = "PERABEEMiaCellID"
        let baseCell = UITableViewCell(style: .default, reuseIdentifier: cellId)
        if (indexPath.row > self.mianViewModel.mainDataArray.count){
            return baseCell
        }
        
        let model = self.mianViewModel.mainDataArray[indexPath.row]
        
        if(model["cityLand"].stringValue == "rdjgmoxpv"){
            let largeCardCell = tableView.dequeueReusableCell(withIdentifier: cellId) as? PERABEEMianLargeCardCell ?? PERABEEMianLargeCardCell(style: .default, reuseIdentifier: model["cityLand"].stringValue)
            largeCardCell.updataPERABEEMianLargeCardCellUI(jsonModel: model)
            largeCardCell.applyClickBlock = { rxpGalvanoscopicJqj  in
                self.mainWidgetApply(pid: rxpGalvanoscopicJqj)
            }
            return largeCardCell
        }
        
        if(model["cityLand"].stringValue == "maeipcdwu"){
            let smallCardCell = tableView.dequeueReusableCell(withIdentifier: cellId) as? PERABEEMianSmallCardCell ?? PERABEEMianSmallCardCell(style: .default, reuseIdentifier: model["cityLand"].stringValue)
            smallCardCell.updataPERABEEMianSmallCardCellUIUI(jsonModel: model)
            smallCardCell.applyClickBlock = { rxpGalvanoscopicJqj  in
                self.mainWidgetApply(pid: rxpGalvanoscopicJqj)
            }
            return smallCardCell
        }
        
        if(model["cityLand"].stringValue == "wxcsznmaz"){
            let productItemCell = tableView.dequeueReusableCell(withIdentifier: cellId) as? PERABEEMianProductItemCell ?? PERABEEMianProductItemCell(style: .default, reuseIdentifier: model["cityLand"].stringValue)
            productItemCell.updataPERABEEMianProductItemCellUI(jsonModel: model)
            productItemCell.applyClickBlock = { rxpGalvanoscopicJqj  in
                self.mainWidgetApply(pid: rxpGalvanoscopicJqj)
            }
            return productItemCell
        }
        
        if(model["cityLand"].stringValue == "irgepczto"){
            let repayCell = tableView.dequeueReusableCell(withIdentifier: cellId) as? PERABEMainEirgepcztoCell ?? PERABEMainEirgepcztoCell(style: .default, reuseIdentifier: model["cityLand"].stringValue)
            repayCell.updatasetPERABEMainEirgepcztoCellUI(jsonModel: model)
            repayCell.applyClickBlock = { rxpOctonaryJqj  in
                self.mainWidgetJumpWeb(jump: rxpOctonaryJqj)
            }
            return repayCell
        }
        
        if(model["cityLand"].stringValue == "efsidydua"){
            let bannerCell = tableView.dequeueReusableCell(withIdentifier: cellId) as? PERABEEMianEFsidyduaCell ?? PERABEEMianEFsidyduaCell(style: .default, reuseIdentifier: model["cityLand"].stringValue)
            bannerCell.updataPERABEEMianEFsidyduaCellUI(jsonModel: model)
            bannerCell.bannerClickBlock = { rxpOctonaryJqj  in
                self.mainWidgetJumpWeb(jump: rxpOctonaryJqj)
            }
            return bannerCell
        }
        
        if(model["cityLand"].stringValue == "rdjgmoxpJ"){
            let djgmoxpJCell = tableView.dequeueReusableCell(withIdentifier: cellId) as? PERABEEMianrDjgmoxpJCell ?? PERABEEMianrDjgmoxpJCell(style: .default, reuseIdentifier: model["cityLand"].stringValue)
            return djgmoxpJCell
        }
        
        if(model["cityLand"].stringValue == "rdjgmoxpSec"){
            let djgmoxpJSecCell = tableView.dequeueReusableCell(withIdentifier: cellId) as? PERABEEMianrDjgmoxpSecCell ?? PERABEEMianrDjgmoxpSecCell(style: .default, reuseIdentifier: model["cityLand"].stringValue)
            return djgmoxpJSecCell
        }
        
        return baseCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      
        let model = self.mianViewModel.mainDataArray[indexPath.row]
        return CGFloat(model["height"].floatValue)
    }
    
}
