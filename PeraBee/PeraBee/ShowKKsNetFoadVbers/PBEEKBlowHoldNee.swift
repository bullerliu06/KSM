//
//  PBEEKBlowHoldNee.swift
//  PeraBee
//
//  Created by Sibs on 2024/10/6.
//


class PBEEKBlowHoldNee: UIView {
    
    static let shared = PBEEKBlowHoldNee()
    
    private let overlayView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        return view
    }()
    
    private let loadingIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = .white
        indicator.startAnimating()
        return indicator
    }()
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = UIColor.black.withAlphaComponent(0.8)
        layer.cornerRadius = 16
        layer.masksToBounds = true
        
        addSubview(loadingIndicator)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        loadingIndicator.frame = CGRect(x: (self.frame.width - 30) / 2, y: (self.frame.height - 30) / 2, width: 30, height: 30)
    }
    
    
    private func show() {
        let window = UIApplication.shared.windows.first!
        overlayView.frame = window.bounds
        window.addSubview(overlayView)
        
        self.frame = CGRect(x: 0, y: 0, width: 90, height: 90)
        self.center = window.center
        overlayView.addSubview(self)
    }
    
    
    private func hide() {
        removeFromSuperview()
        overlayView.removeFromSuperview()
    }
    
    static func show() {
        PBEEKBlowHoldNee.shared.show()
    }
    
    static func hide() {
        PBEEKBlowHoldNee.shared.hide()
    }
}
