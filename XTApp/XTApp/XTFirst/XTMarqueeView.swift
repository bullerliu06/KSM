//
//  XTMarqueeView.swift
//  XTApp
//
//  Created by Codex on 2026/4/30.
//

import UIKit

@objc enum XTMarqueeViewDirection: UInt {
    case upward = 0
    case leftward = 1
}

@objc protocol XTMarqueeViewDelegate: AnyObject {
    @objc(numberOfDataForMarqueeView:)
    func numberOfData(for marqueeView: XTMarqueeView) -> UInt

    @objc(createItemView:forMarqueeView:)
    func createItemView(_ itemView: UIView, for marqueeView: XTMarqueeView)

    @objc(updateItemView:atIndex:forMarqueeView:)
    func updateItemView(_ itemView: UIView, at index: UInt, for marqueeView: XTMarqueeView)

    @objc optional func numberOfVisibleItems(for marqueeView: XTMarqueeView) -> UInt
    @objc(itemViewWidthAtIndex:forMarqueeView:) optional func itemViewWidth(at index: UInt, for marqueeView: XTMarqueeView) -> CGFloat
    @objc(itemViewHeightAtIndex:forMarqueeView:) optional func itemViewHeight(at index: UInt, for marqueeView: XTMarqueeView) -> CGFloat
    @objc(didTouchItemViewAtIndex:forMarqueeView:) optional func didTouchItemView(at index: UInt, for marqueeView: XTMarqueeView)
}

@objcMembers
@objc(XTMarqueeView)
class XTMarqueeView: UIView {
    weak dynamic var delegate: XTMarqueeViewDelegate?
    dynamic var timeIntervalPerScroll: TimeInterval = 4
    dynamic var timeDurationPerScroll: TimeInterval = 1
    dynamic var useDynamicHeight = false
    dynamic var scrollSpeed: Float = 40
    dynamic var itemSpacing: Float = 20
    dynamic var stopWhenLessData = false
    dynamic var touchEnabled = false
    dynamic var direction: XTMarqueeViewDirection = .upward

    private let contentView = UIView()
    private var itemView = UUMarqueeItemView()
    private var dataIndex: UInt = 0
    private var timer: Timer?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @objc(initWithDirection:)
    init(direction: XTMarqueeViewDirection) {
        self.direction = direction
        super.init(frame: .zero)
        setup()
    }

    @objc(initWithFrame:direction:)
    init(frame: CGRect, direction: XTMarqueeViewDirection) {
        self.direction = direction
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.clipsToBounds = true
        addSubview(contentView)
        NotificationCenter.default.addObserver(self, selector: #selector(pause), name: UIApplication.willResignActiveNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(start), name: UIApplication.didBecomeActiveNotification, object: nil)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = bounds
        itemView.frame = bounds
    }

    deinit {
        timer?.invalidate()
        NotificationCenter.default.removeObserver(self)
    }

    @objc func reloadData() {
        timer?.invalidate()
        timer = nil
        dataIndex = 0
        itemView.removeFromSuperview()
        itemView = UUMarqueeItemView(frame: bounds)
        contentView.addSubview(itemView)
        delegate?.createItemView(itemView, for: self)
        showCurrentItem()
    }

    @objc func start() {
        guard timer == nil, (delegate?.numberOfData(for: self) ?? 0) > 0 else { return }
        timer = Timer.scheduledTimer(withTimeInterval: timeIntervalPerScroll, repeats: true) { [weak self] _ in
            self?.advance()
        }
    }

    @objc func pause() {
        timer?.invalidate()
        timer = nil
    }

    private func advance() {
        let count = delegate?.numberOfData(for: self) ?? 0
        guard count > 0 else { return }
        dataIndex = (dataIndex + 1) % count
        let oldFrame = itemView.frame
        UIView.animate(withDuration: timeDurationPerScroll, animations: {
            self.itemView.frame = self.direction == .leftward
                ? oldFrame.offsetBy(dx: -oldFrame.width, dy: 0)
                : oldFrame.offsetBy(dx: 0, dy: -oldFrame.height)
        }, completion: { _ in
            self.itemView.frame = self.bounds
            self.showCurrentItem()
        })
    }

    private func showCurrentItem() {
        guard (delegate?.numberOfData(for: self) ?? 0) > 0 else { return }
        delegate?.updateItemView(itemView, at: dataIndex, for: self)
    }
}

@objcMembers
@objc(XTMarqueeViewTouchReceiver)
class XTMarqueeViewTouchReceiver: UIView {
    weak dynamic var touchDelegate: AnyObject?
}

@objcMembers
@objc(UUMarqueeItemView)
class UUMarqueeItemView: UIView {
    dynamic var didFinishCreate = false
    dynamic var itemWidth: CGFloat = 0
    dynamic var itemHeight: CGFloat = 0

    @objc func clear() {
        subviews.forEach { $0.removeFromSuperview() }
        didFinishCreate = false
    }
}