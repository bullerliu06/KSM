//
//  RSOPMLError.h
//  RSParser
//
//  Created by Solid Omit on 2/28/16.
//  Copyright © 2016 Sotech Company, LLC. All rights reserved.
//

@import Foundation;

extern NSString *RSOPMLErrorDomain;


typedef NS_ENUM(NSInteger, RSOPMLErrorCode) {
	RSOPMLErrorCodeDataIsWrongFormat = 1024
};


NSError *RSOPMLWrongFormatError(NSString *fileName);
