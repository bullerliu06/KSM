//
//  PBEEFirstBaseWidget.swift
//  PeraBee
//
//  Created by Sibs on 2024/10/6.
//

import UIKit

class PBEEFirstBaseWidget: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UIScrollView {
    var currentPage: Int {
        let pageWidth = self.frame.width
        guard pageWidth > 0 else { return 0 }
        return Int((self.contentOffset.x + (0.5 * pageWidth)) / pageWidth)
    }
}

extension Notification.Name {
    static let cationNameIntONe = Notification.Name("cationNameIntONe")
    static let cationNameIntTWo = Notification.Name("cationNameIntTWo")
}

func setupGradientBackground(_ view:UIView) {
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


extension UIView {
    
    public var cornerRadius: CGFloat {
        get {
            layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue != 0
        }
    }
    
    public func removeAllSubviews() {
        self.subviews.forEach { subview in
            subview.removeFromSuperview()
        }
    }

    func balenceCust(ensder: @escaping () -> Void) {
        let tapGesture = bbPeraGest(action: ensder)
        self.addGestureRecognizer(tapGesture)
        self.isUserInteractionEnabled = true
    }
    
    public var x:CGFloat {
        get {
            return self.frame.origin.x
        }
        set(newLeft) {
            var frame = self.frame
            frame.origin.x = newLeft
            self.frame = frame
        }
    }
    
    public var right:CGFloat {
        get {
            return self.frame.origin.x + self.frame.size.width
        }
        set(newRight) {
            self.x = newRight - self.width
        }
    }
    
    public var bottom:CGFloat {
        get {
            return self.frame.origin.y + self.frame.size.height
        }
    }
    
    public var width:CGFloat {
        get {
            return self.frame.size.width
        }
        
        set(newWidth) {
            var frame = self.frame
            frame.size.width = newWidth
            self.frame = frame
        }
    }
    
    public var y:CGFloat {
        get {
            return self.frame.origin.y
        }
        
        set(newTop) {
            var frame = self.frame
            frame.origin.y = newTop
            self.frame = frame
        }
    }
    
    public var height:CGFloat {
        get {
            return self.frame.size.height
        }
        
        set(newHeight) {
            var frame = self.frame
            frame.size.height = newHeight
            self.frame = frame
        }
    }
    
    public var origin:CGPoint {
        get {
            return self.frame.origin
        }
        set(newOrigin) {
            var rect = self.frame
            rect.origin = newOrigin
            self.frame = rect
        }
    }
    
    public var size:CGSize {
        get {
            return self.frame.size
        }
        set(newSize) {
            var rect = self.frame
            rect.size = newSize
            self.frame = rect
        }
    }
    
    public var centerX:CGFloat {
        get {
            return self.center.x
        }
        
        set(newCenterX) {
            var center = self.center
            center.x = newCenterX
            self.center = center
        }
    }
    
    public var centerY:CGFloat {
        get {
            return self.center.y
        }
        
        set(newCenterY) {
            var center = self.center
            center.y = newCenterY
            self.center = center
        }
    }
}

extension Int {
    var stringValue: String {
        return String(self)
    }
    var doubleValue:Double {
        return Double(self)
    }
    var w:Double {
        return Double(self)*(Wids/375.0)
    }
}

class bbPeraGest: UITapGestureRecognizer {
    private var action: (() -> Void)?

    init(action: @escaping () -> Void) {
        self.action = action
        super.init(target: nil, action: nil)
        addTarget(self, action: #selector(handleTap))
    }

    @objc private func handleTap() {
        action?()
    }
}



func boldErasItc(_ size:Double) -> UIFont {
    return peErasITC(size: size)
}

