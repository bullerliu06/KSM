//
//  ViewController.swift
//  PeraBee
//
//  Created by Sibs on 2024/10/3.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

func peFloadt(_ size:Double) -> UIFont {
    return PBEERobotoBb(size: size)
}

func PBEEMPLUS2r(size:CGFloat) ->UIFont{
    let franklin = UIFont(name: "MPLUS2-Regular", size: size)
    return franklin ?? UIFont.systemFont(ofSize: size, weight: .bold)
}

