//
//  XTWebViewProgressView.swift
//  XTApp
//
//  Created by Codex on 2026/4/26.
//

import UIKit
import WebKit

private let xtProgressAnimationDurationMultiplier = 1.8

@objcMembers
@objc(XTWebViewProgressView)
class XTWebViewProgressView: UIView, CAAnimationDelegate {
    private var progressStorage: Float = 0
    private var progressObservation: NSKeyValueObservation?

    private(set) dynamic var progressView = UIView()
    dynamic var barDuration: TimeInterval = 0.5
    dynamic var fadeDuration: TimeInterval = 0.27

    dynamic var progressColor: UIColor? {
        get { progressView.backgroundColor }
        set { progressView.backgroundColor = newValue }
    }

    dynamic var progress: Float {
        get { progressStorage }
        set { setProgress(newValue, animated: false) }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureViews()
    }

    deinit {
        progressObservation?.invalidate()
        NSLog("dealloc:%@", NSStringFromClass(type(of: self)))
    }

    private func configureViews() {
        isUserInteractionEnabled = false
        clipsToBounds = true
        autoresizingMask = .flexibleWidth

        progressView = UIView(frame: bounds)
        progressView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        let tintColor = UIApplication.shared.windows.first { $0.isKeyWindow }?.tintColor
            ?? UIColor(red: 22 / 255.0, green: 126 / 255.0, blue: 251 / 255.0, alpha: 1)
        progressView.backgroundColor = tintColor
        addSubview(progressView)

        setProgress(0, animated: false)
    }

    @objc(useWebView:)
    func useWebView(_ webView: WKWebView?) {
        guard let webView else { return }
        progressObservation = webView.observe(\.estimatedProgress, options: .new) { [weak self] webView, _ in
            self?.setProgress(Float(webView.estimatedProgress), animated: true)
        }
    }

    @objc(setProgress:animated:)
    func setProgress(_ progress: Float, animated: Bool) {
        var animated = animated
        let isGrowing = progress > 0
        let originX = -bounds.width / 2
        var positionBegin = CGPoint(
            x: originX + CGFloat(progressStorage) * bounds.width,
            y: progressView.frame.height / 2
        )
        let positionEnd = CGPoint(
            x: originX + CGFloat(progress) * bounds.width,
            y: progressView.frame.height / 2
        )

        if progress < progressStorage {
            animated = false
        }

        if !isGrowing {
            if animated {
                UIView.animate(withDuration: fadeDuration, delay: 0, options: .curveEaseInOut) {
                    self.progressView.center = positionEnd
                    self.progressView.alpha = 1
                }
            } else {
                progressView.alpha = 1
                progressView.center = positionEnd
            }
        } else {
            UIView.animate(withDuration: animated ? fadeDuration : 0, delay: 0, options: .curveEaseInOut) {
                self.progressView.alpha = 1
            }

            if animated {
                let animationBounds: CAAnimation
                if progress < 1 {
                    if progressStorage > 0.01,
                       progressView.layer.animation(forKey: "positionAnimation") != nil,
                       let presentation = progressView.layer.presentation() {
                        positionBegin = presentation.position
                        progressView.layer.position = positionBegin
                        progressView.layer.removeAnimation(forKey: "positionAnimation")
                    }

                    let keyFrameAnimation = CAKeyframeAnimation(keyPath: "position")
                    keyFrameAnimation.duration = xtProgressAnimationDurationMultiplier * Double(progress - progressStorage) * 10
                    keyFrameAnimation.keyTimes = [0, 0.3, 1]
                    keyFrameAnimation.values = [
                        NSValue(cgPoint: positionBegin),
                        NSValue(cgPoint: CGPoint(
                            x: positionBegin.x + (positionEnd.x - positionBegin.x) * 0.9,
                            y: positionEnd.y
                        )),
                        NSValue(cgPoint: positionEnd)
                    ]
                    keyFrameAnimation.timingFunctions = [
                        CAMediaTimingFunction(controlPoints: 0.092, 0.000, 0.618, 1.000),
                        CAMediaTimingFunction(controlPoints: 0.000, 0.688, 0.479, 1.000)
                    ]
                    animationBounds = keyFrameAnimation
                } else {
                    if progressStorage > 0.05,
                       progressView.layer.animation(forKey: "positionAnimation") != nil,
                       let presentation = progressView.layer.presentation() {
                        positionBegin = presentation.position
                        progressView.layer.position = positionBegin
                        progressView.layer.removeAnimation(forKey: "positionAnimation")
                    }
                    let basicAnimationBounds = CABasicAnimation(keyPath: "position")
                    basicAnimationBounds.fromValue = NSValue(cgPoint: positionBegin)
                    basicAnimationBounds.toValue = NSValue(cgPoint: positionEnd)
                    basicAnimationBounds.duration = barDuration
                    basicAnimationBounds.timingFunction = CAMediaTimingFunction(controlPoints: 0.486, 0.056, 0.778, 0.480)
                    basicAnimationBounds.delegate = self
                    animationBounds = basicAnimationBounds
                }

                progressView.layer.add(animationBounds, forKey: "positionAnimation")
                progressView.layer.position = positionEnd
            } else {
                progressView.layer.position = positionEnd
            }
        }

        progressStorage = progress
    }

    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        progressStorage = 0
        let animationOpacity = CABasicAnimation(keyPath: "opacity")
        animationOpacity.fromValue = 1
        animationOpacity.toValue = 0
        animationOpacity.duration = fadeDuration
        animationOpacity.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        progressView.layer.add(animationOpacity, forKey: "opacityAnimation")
        progressView.layer.opacity = 0
    }
}
