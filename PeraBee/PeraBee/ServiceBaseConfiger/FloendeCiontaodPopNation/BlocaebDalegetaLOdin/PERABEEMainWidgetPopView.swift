//
//  PERABEEMainWidgetPopView.swift
//  PeraBee
//
//  Created by Cris on 2024/10/7.
//

import UIKit

class PERABEEMainWidgetPopView: UIView {
    private var alertView: UIView = UIView()
    private var model: JSON
        var confirmBlock: ((_ data: String?) -> Void)?
    init(jsonModel:JSON){
        self.model = jsonModel
        super.init(frame: .zero)
        setupPERABEEMainWidgetPopViewUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func show() {
           self.alpha = 1
           UIApplication.shared.windows.first?.addSubview(self)

           let scaleAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
           scaleAnimation.values = [0.1, 1.1, 0.9, 1.0]
           scaleAnimation.calculationMode = .linear

           let animationGroup = CAAnimationGroup()
           animationGroup.animations = [scaleAnimation]
           animationGroup.duration = 0.5
           self.alertView.layer.add(animationGroup, forKey: nil)
       }
    
    private func setupPERABEEMainWidgetPopViewUI() {
          self.frame = CGRect(x: 0, y: 0, width: Wids, height: Heis)

           let backButton = UIButton(type: .custom)
           backButton.frame = self.frame
           backButton.backgroundColor = UIColor.black.withAlphaComponent(0.7)
           backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
           self.addSubview(backButton)

          
           let alertWidth: CGFloat = 320
           let alertHeight: CGFloat = 306
           alertView.frame = CGRect(x: 0, y: 0, width: alertWidth, height: alertHeight)
           alertView.backgroundColor = .clear
           alertView.center = self.center
           alertView.layer.cornerRadius = 16
           alertView.clipsToBounds = true
           self.addSubview(alertView)

          
           let logoImageView = UIImageView()
           logoImageView.isUserInteractionEnabled = true
           logoImageView.frame = CGRect(x: 0, y: 0, width: alertWidth, height: alertHeight)
           alertView.addSubview(logoImageView)
           logoImageView.kf.setImage(with: URL(string: self.model["rxpDoublureJqj"].stringValue))

           let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
           logoImageView.addGestureRecognizer(tapGesture)

         
           let closeButton = UIButton(type: .custom)
           closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
           closeButton.setImage(UIImage(named: "Mian_PoView_Close"), for: .normal)
           closeButton.backgroundColor = .clear
           closeButton.frame.size = CGSize(width: 60, height: 40)
           closeButton.center = CGPoint(x: alertView.center.x, y: alertView.frame.maxY + 30)
           self.addSubview(closeButton)
       }

       @objc private func handleTap() {
           hide()
           confirmBlock?(model["rxpOctonaryJqj"].stringValue)
       }

       private func hide() {
           UIView.animate(withDuration: 0.3, animations: {
               self.alpha = 0
           }) { _ in
               self.removeFromSuperview()
           }
       }

       @objc private func closeButtonTapped() {
           hide()
       }

       @objc private func backButtonTapped() {
           hide()
       }
    
}
