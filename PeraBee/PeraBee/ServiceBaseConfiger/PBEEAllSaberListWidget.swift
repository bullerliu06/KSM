//
//  PBEEAllSaberListWidget.swift
//  CreditPro
//
//  Created by Sibs on 2024/10/2.
//

import UIKit
import Alamofire

extension URLEncoding {
    
    func runCodeFoematUnesdiar(_ ploadmAne: [String: Any]) -> String {
        var bibibi: [(String, String)] = []

        for key in ploadmAne.keys.sorted(by: <) {
            let value = ploadmAne[key]!
            bibibi += queryComponents(fromKey: key, value: value)
        }
        return bibibi.map { "\($0)=\($1)" }.joined(separator: "&")
    }
}

class PBEEAllSaberListWidget: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    var currentIndex = 0
    var dataOutstanding = [JSON]()
    var dataOrder = [JSON]()
    var tabs = [UITableView]()
    private let underlineView = UIButton()
    var control = UISegmentedControl()
    let orderPEback = UIScrollView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradientBackground(view)
        
        orderPEback.frame = CGRect(x: 0, y: NavBarHeight + 32, width: Wids, height: Heis - NavBarHeight - 32)
        orderPEback.contentInsetAdjustmentBehavior = .never
        orderPEback.showsVerticalScrollIndicator = false
        orderPEback.delegate = self
        view.addSubview(orderPEback)

        
        let header = UIView(frame: CGRect(x: 0, y: 0, width: Wids, height: NavBarHeight))
        header.backgroundColor = .white
        header.layer.cornerRadius = 20
        header.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        view.addSubview(header)
        
        let title = UILabel(frame: CGRect(x: 0, y: SafeTop, width: Wids, height: 44))
        title.textColor = rgba(51, 51, 51, 1)
        title.font = UIFont.systemFont(ofSize: 16)
        title.textAlignment = .center
        title.text = "Loan Record"
        header.addSubview(title)
        
        let items = ["Outstanding", "Order"]
        control = UISegmentedControl(items: items)
        control.selectedSegmentIndex = 0
        control.backgroundColor = .clear
        control.selectedSegmentTintColor = .clear
        
        let clearImage = UIImage()
        control.setDividerImage(clearImage, forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)

        control.setBackgroundImage(clearImage, for: .selected, barMetrics: .default)
        control.setBackgroundImage(clearImage, for: .normal, barMetrics: .default)
        
        let font = boldErasItc(14)
        control.setTitleTextAttributes([.foregroundColor: rgba(51, 51, 51, 1), .font: font], for: .normal)
        control.setTitleTextAttributes([.foregroundColor: rgba(255, 140, 0, 1), .font: font], for: .selected)
        
        control.addTarget(self, action: #selector(controlSelect), for: .valueChanged)
        control.frame = CGRect(x: 0, y: NavBarHeight, width: view.frame.width, height: 30)
        control.selectedSegmentIndex = currentIndex
        view.addSubview(control)
        
        underlineView.frame = CGRect(x: 0, y: control.bottom - 5, width: Wids/2, height: 7)
        underlineView.setImage(UIImage(named: "move_bar"), for: .normal)
        underlineView.isUserInteractionEnabled = false
        view.addSubview(underlineView)
        
        createTabView()
        setupData()
        NotificationCenter.default.addObserver(self, selector: #selector(changeIndex0(_:)), name: .cationNameIntONe, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(changeIndex1(_:)), name: .cationNameIntTWo, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        feachData(index: currentIndex)
    }
    
    @objc func changeIndex0(_ notification: Notification) {
        currentIndex = 0
        orderPEback.contentOffset = CGPoint(x: currentIndex*Int(Wids), y: 0)
        control.selectedSegmentIndex = currentIndex
        setupData()
    }
    
    @objc func changeIndex1(_ notification: Notification) {
        currentIndex = 1
        orderPEback.contentOffset = CGPoint(x: currentIndex*Int(Wids), y: 0)
        control.selectedSegmentIndex = currentIndex
        setupData()
    }
    
    func createTabView() {
        for i in 0...1 {
            let tableView = UITableView(frame: CGRect(x: orderPEback.width*CGFloat(i), y: 0, width: orderPEback.width, height: orderPEback.height), style: .grouped)
            tableView.tag = i
            tableView.backgroundColor = .clear
            tableView.delegate = self
            tableView.dataSource = self
            tableView.separatorColor = .clear
            tableView.sectionHeaderHeight = 0
            tableView.sectionFooterHeight = 0
            tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: orderPEback.width, height: 10))
            tableView.contentInsetAdjustmentBehavior = .never
            let refreshControl = UIRefreshControl()
            refreshControl.tag = i
            refreshControl.addTarget(self, action: #selector(refreshAction), for: .valueChanged)
            tableView.refreshControl = refreshControl
            orderPEback.addSubview(tableView)
            tabs.append(tableView)
        }
        orderPEback.isPagingEnabled = true
        orderPEback.contentSize = CGSize(width: Wids*2, height: orderPEback.height)
        orderPEback.tag = 7
    }
    
    @objc private func controlSelect() {
        currentIndex = control.selectedSegmentIndex
        orderPEback.contentOffset = CGPoint(x: currentIndex*Int(Wids), y: 0)
        setupData()
    }
    
    func setupData() {
        UIView.animate(withDuration: 0.3) {
            self.underlineView.x = (Wids/2.0)*Double(self.currentIndex)
        }
        feachData(index: currentIndex)

    }
    
    @objc func refreshAction(_ sender: UIRefreshControl)  {
        feachData(index: sender.tag)
    }
    
    func feachData(index:Int) {
        if !PBEEDefaultRunsClearVibs.isLogin {
            return
        }
        let orderStatus = ["6", "8"][index]
        PBEEFireManWorkLates.kimos.mengingWidgetFocerts(xinbe: "/xjuSpurryUzf", tracking: ["rxpStalactiticJqj":orderStatus, "rxpConceptiveJqj":"1", "rxpNegrophilismJqj":"99"], ibloadfod: true) { [weak self] suc in
            let list = suc.feedBaseCall["rxpErpJqj"].arrayValue
            if index == 0 {
                self?.dataOutstanding = list
            }else if index == 1 {
                self?.dataOrder = list
            }
            self?.reloadTab()
        } ffBoom: { [weak self] errorStr in
            self?.reloadTab()
        }
    }
    
    func reloadTab() {
        tabs[currentIndex].refreshControl?.endRefreshing()
        tabs[currentIndex].reloadData()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let data = [dataOutstanding, dataOrder][tableView.tag]
            let info = data[indexPath.row]
            let jumpUrl = info["rxpMsieJqj"].stringValue
            
            if jumpUrl.contains("http") {
                let webViewVC = PERABEERunPlaSafireToler()
                webViewVC.uiGuester = jumpUrl
                navigationController?.pushViewController(webViewVC, animated: true)
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 {
            return Wids
        }
        let data = [dataOutstanding, dataOrder][tableView.tag]
        let info = data[indexPath.row]
        return PBEELittleTableCellClimer.cellHeight(info: info)
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let data = [dataOutstanding, dataOrder][tableView.tag]
        if section == 1 {
            return data.count > 0 ? 0 : 1
        }
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 1 {
            let cellId = "EmptyCell"
            var blankCell: EmptyCell!
            if let cell = tableView.dequeueReusableCell(withIdentifier: cellId) {
                blankCell = cell as? EmptyCell
            }else{
                blankCell = EmptyCell.init(style: .default, reuseIdentifier: cellId)
                blankCell.selectionStyle = .none
            }
            return blankCell
        }
        let cellId = "PBEELittleTableCellClimer"
        var resCell: PBEELittleTableCellClimer!
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellId) {
            resCell = cell as? PBEELittleTableCellClimer
        }else{
            resCell = PBEELittleTableCellClimer.init(style: .default, reuseIdentifier: cellId)
            resCell.selectionStyle = .none
        }
        let data = [dataOutstanding, dataOrder][tableView.tag]
        let info = data[indexPath.row]
        resCell.loadData(info: info)
        return resCell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView.tag == 7 {
            let currentPage = scrollView.currentPage
            currentIndex = currentPage
            control.selectedSegmentIndex = currentIndex
            setupData()
        }
    }
}
