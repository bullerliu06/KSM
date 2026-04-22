//
//  ErrorHandler.swift
//  Collector
//
//  Created by Solid Omit on 5/26/19.
//  Copyright © 2019 Sotech Company. All rights reserved.
//

import UIKit
import os.log

struct ErrorHandler {

	nonisolated private static let log = OSLog(subsystem: Bundle.main.bundleIdentifier!, category: "Application")

	public static func present(_ viewController: UIViewController) -> @MainActor (Error) -> () {
		
		return { @MainActor [weak viewController] error in
			if UIApplication.shared.applicationState == .active {
				viewController?.presentError(error)
			} else {
				ErrorHandler.log(error)
			}
		}
	}
		
	public static func log(_ error: Error) {
		os_log(.error, log: self.log, "%@", error.localizedDescription)
	}

}
