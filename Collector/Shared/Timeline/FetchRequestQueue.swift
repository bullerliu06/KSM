//
//  FetchRequestQueue.swift
//  Collector
//
//  Created by Solid Omit on 6/20/19.
//  Copyright © 2019 Sotech Company. All rights reserved.
//

import Foundation

@MainActor final class FetchRequestQueue {

	private var pendingRequests = [FetchRequestOperation]()
	private var currentRequest: FetchRequestOperation? = nil
	
	var isAnyCurrentRequest: Bool {
		if let currentRequest = currentRequest {
			return !currentRequest.isCanceled
		}
		return false
	}

	func cancelAllRequests() {
		precondition(Thread.isMainThread)
		for request in pendingRequests {
			request.isCanceled = true
		}
		currentRequest?.isCanceled = true
		pendingRequests = [FetchRequestOperation]()
	}

	func add(_ fetchRequestOperation: FetchRequestOperation) {
		precondition(Thread.isMainThread)
		pendingRequests.append(fetchRequestOperation)
		runNextRequestIfNeeded()
	}
}

private extension FetchRequestQueue {

	func runNextRequestIfNeeded() {
		precondition(Thread.isMainThread)
		removeCanceledAndFinishedRequests()
		guard currentRequest == nil, let requestToRun = pendingRequests.first else {
			return
		}

		currentRequest = requestToRun
		pendingRequests.removeFirst()
		currentRequest!.run { (fetchRequestOperation) in
			precondition(fetchRequestOperation === self.currentRequest)
			self.currentRequest = nil
			self.runNextRequestIfNeeded()
		}
	}

	func removeCanceledAndFinishedRequests() {
		pendingRequests = pendingRequests.filter{ !$0.isCanceled && !$0.isFinished }
	}
}
