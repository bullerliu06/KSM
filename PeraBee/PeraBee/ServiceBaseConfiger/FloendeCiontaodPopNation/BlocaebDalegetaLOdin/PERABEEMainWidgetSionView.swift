//
//  PERABEEMainWidgetSionView.swift
//  PeraBee
//
//  Created by Cris on 2024/10/7.
//

import UIKit

class PERABEEMainWidgetSionView: UIView {
    // MARK: - shared
    @objc static let shared = PERABEEMainWidgetSionView(frame: CGRect(x:Wids - 70, y: 70, width: 52, height: 36))
    
    var pan: UIPanGestureRecognizer?
    @objc var sioniocnImgView: UIImageView!
    @objc var tapActionBlock: PERDefaultBlock?
    
    // MARK:
    private override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupPERABEEMainWidgetSionViewUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    private func setupPERABEEMainWidgetSionViewUI() {
       
        self.pan = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        if let pan = self.pan {
            self.addGestureRecognizer(pan)
        }
        
        self.sioniocnImgView = UIImageView()
        
        self.sioniocnImgView.frame = CGRect(x: 12, y: 0, width: 36, height: 36)
        self.addSubview(self.sioniocnImgView)
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        self.addGestureRecognizer(tap)
    }
    
   
    @objc func tapAction() {
        if let clickBlock = tapActionBlock {
            clickBlock()
        }
    }
    
    // MARK: -handlePanGesture
    @objc func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
        guard let superview = self.superview else { return }
        
        if gesture.state == .changed {
            let translatePoint = gesture.translation(in: superview)
            self.center = CGPoint(x: self.center.x + translatePoint.x, y: self.center.y + translatePoint.y)
            gesture.setTranslation(.zero, in: superview)
        } else if gesture.state == .ended || gesture.state == .cancelled {
            var originY = self.frame.origin.y
            var left: CGFloat
            
            
            if self.center.x > superview.bounds.width / 2 {
                left = superview.bounds.width - self.frame.width
            } else {
                left = 0
            }
            
            if originY < 0 {
                originY = 0
            } else if originY > superview.bounds.height - self.frame.height {
                originY = superview.bounds.height - self.frame.height
            }
            
           
            UIView.animate(withDuration: 0.3) {
                self.frame = CGRect(x: left, y: originY, width: self.frame.width, height: self.frame.height)
            }
        }
    }
  

}
