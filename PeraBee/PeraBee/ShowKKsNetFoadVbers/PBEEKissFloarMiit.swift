//
//  PBEEKissFloarMiit.swift
//  PeraBee
//
//  Created by Sibs on 2024/10/6.
//


import UIKit

func toast(_ content:String) {
    PBEEKissFloarMiit.show(message: content)
}


class PBEEKissFloarMiit {
    private static var overlayView: UIView?
    static func show(message: String, duration: TimeInterval = 2.0) {
        guard let window = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first else { return }

        let overlayView = UIView(frame: window.bounds)
        overlayView.backgroundColor = UIColor.clear
        overlayView.isUserInteractionEnabled = true
        window.addSubview(overlayView)
        self.overlayView = overlayView

        let toastView = UIView()
        toastView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        toastView.layer.cornerRadius = 10
        toastView.clipsToBounds = true

        let messageLabel = UILabel()
        messageLabel.text = message
        messageLabel.textColor = .white
        messageLabel.font = UIFont.systemFont(ofSize: 14)
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center

        toastView.addSubview(messageLabel)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            messageLabel.leadingAnchor.constraint(equalTo: toastView.leadingAnchor, constant: 10),
            messageLabel.trailingAnchor.constraint(equalTo: toastView.trailingAnchor, constant: -10),
            messageLabel.topAnchor.constraint(equalTo: toastView.topAnchor, constant: 10),
            messageLabel.bottomAnchor.constraint(equalTo: toastView.bottomAnchor, constant: -10)
        ])

        overlayView.addSubview(toastView)
        toastView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            toastView.centerXAnchor.constraint(equalTo: overlayView.centerXAnchor),
            toastView.bottomAnchor.constraint(equalTo: overlayView.bottomAnchor, constant: -window.bounds.size.height/2),
            toastView.widthAnchor.constraint(lessThanOrEqualToConstant: 250)
        ])

        toastView.alpha = 0
        UIView.animate(withDuration: 0.3, animations: {
            toastView.alpha = 1
        }) { _ in
            UIView.animate(withDuration: 0.3, delay: duration, options: .curveEaseOut, animations: {
                toastView.alpha = 0
            }) { _ in
                toastView.removeFromSuperview()
                overlayView.removeFromSuperview()
                self.overlayView = nil
            }
        }
    }
}
