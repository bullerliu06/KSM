//
//  IntentHandler.swift
//  Collector iOS Intents Extension
//
//  Created by Solid Omit on 10/18/19.
//  Copyright © 2019 Sotech Company. All rights reserved.
//

import Intents

class IntentHandler: INExtension {
    
	override func handler(for intent: INIntent) -> Any {
		switch intent {
//		case is AddFeedIntent:
//			return AddFeedIntentHandler()
		default:
			fatalError("Unhandled intent type: \(intent)")
		}
	}
    
}
