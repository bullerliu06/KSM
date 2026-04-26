//
//  UIView+XTPositioning.swift
//  XTApp
//
//  Created by Codex on 2026/4/26.
//

import UIKit

@objc
extension UIView {
    @objc dynamic var x: CGFloat {
        get { frame.origin.x }
        set {
            var newFrame = frame
            newFrame.origin.x = newValue
            frame = newFrame
        }
    }

    @objc dynamic var y: CGFloat {
        get { frame.origin.y }
        set {
            var newFrame = frame
            newFrame.origin.y = newValue
            frame = newFrame
        }
    }

    @objc dynamic var width: CGFloat {
        get { frame.size.width }
        set {
            var newFrame = frame
            newFrame.size.width = newValue
            frame = newFrame
        }
    }

    @objc dynamic var height: CGFloat {
        get { frame.size.height }
        set {
            var newFrame = frame
            newFrame.size.height = newValue
            frame = newFrame
        }
    }

    @objc dynamic var origin: CGPoint {
        get { CGPoint(x: x, y: y) }
        set {
            x = newValue.x
            y = newValue.y
        }
    }

    @objc dynamic var size: CGSize {
        get { CGSize(width: width, height: height) }
        set {
            width = newValue.width
            height = newValue.height
        }
    }

    @objc dynamic var bottom: CGFloat {
        get { frame.origin.y + frame.size.height }
        set {
            var newFrame = frame
            newFrame.origin.y = newValue - newFrame.size.height
            frame = newFrame
        }
    }

    @objc dynamic var right: CGFloat {
        get { frame.origin.x + frame.size.width }
        set {
            var newFrame = frame
            newFrame.origin.x = newValue - newFrame.size.width
            frame = newFrame
        }
    }

    @objc dynamic var centerX: CGFloat {
        get { center.x }
        set { center = CGPoint(x: newValue, y: center.y) }
    }

    @objc dynamic var centerY: CGFloat {
        get { center.y }
        set { center = CGPoint(x: center.x, y: newValue) }
    }

    @objc dynamic var lastSubviewOnX: UIView? {
        guard var outView = subviews.first else { return nil }
        for view in subviews where view.x > outView.x {
            outView = view
        }
        return outView
    }

    @objc dynamic var lastSubviewOnY: UIView? {
        guard var outView = subviews.first else { return nil }
        for view in subviews where view.y > outView.y {
            outView = view
        }
        return outView
    }

    @objc func centerToParent() {
        guard let superview else { return }
        let orientation = UIApplication.shared.statusBarOrientation
        switch orientation {
        case .landscapeLeft, .landscapeRight:
            x = (superview.height / 2) - (width / 2)
            y = (superview.width / 2) - (height / 2)
        case .portrait, .portraitUpsideDown, .unknown:
            x = (superview.width / 2) - (width / 2)
            y = (superview.height / 2) - (height / 2)
        @unknown default:
            x = (superview.width / 2) - (width / 2)
            y = (superview.height / 2) - (height / 2)
        }
    }
}
