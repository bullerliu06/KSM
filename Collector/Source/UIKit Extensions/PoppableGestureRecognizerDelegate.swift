//
//  PoppableGestureRecognizerDelegate.swift
//  Collector
//
//  Created by Solid Omit on 11/18/19.
//  Copyright © 2019 Sotech Company. All rights reserved.
//


import UIKit

final class PoppableGestureRecognizerDelegate: NSObject, UIGestureRecognizerDelegate {
	
    weak var navigationController: UINavigationController?

    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return navigationController?.viewControllers.count ?? 0 > 1
    }

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
		return true
    }
	
	func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
		if otherGestureRecognizer is UIPanGestureRecognizer {
			return true
		}
		return false
	}
	
}
