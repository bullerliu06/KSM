//
//  PBECertBaseWidgetBankConfirmViewController.swift
//  PeraBee
//
//  Created by Parme on 2024/10/9.
//

import UIKit

class PBECertBaseWidgetBankConfirmViewController: UIViewController {

    @IBOutlet weak var wuliView: UIView!
    @IBOutlet weak var caaountLab: UILabel!
    @IBOutlet weak var channerLab: UILabel!
    
    var str1:String = ""
    var str2:String = ""
    
    var cliajhebe:PERIntBlock?
    override func viewDidLoad() {
        super.viewDidLoad()

        channerLab.text = str1
        caaountLab.text = str2
    }

    @IBAction func confirmCLisje(_ sender: Any) {
        cliajhebe?(0)
    }
    
    @IBAction func basubekdui(_ sender: Any) {
        cliajhebe?(1)
    }
    
}
