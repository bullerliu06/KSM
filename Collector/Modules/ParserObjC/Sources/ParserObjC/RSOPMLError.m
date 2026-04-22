//
//  RSOPMLError.m
//  RSParser
//
//  Created by Solid Omit on 2/28/16.
//  Copyright © 2016 Sotech Company, LLC. All rights reserved.
//

#import "RSOPMLError.h"

NSString *RSOPMLErrorDomain = @"com.sotech.OPML";

NSError *RSOPMLWrongFormatError(NSString *fileName) {

	NSString *localizedDescriptionFormatString = NSLocalizedString(@"The file ‘%@’ can’t be parsed because it’s not an OPML file.", @"OPML wrong format");
	NSString *localizedDescription = [NSString stringWithFormat:localizedDescriptionFormatString, fileName];

	NSString *localizedFailureString = NSLocalizedString(@"The file is not an OPML file.", @"OPML wrong format");
	NSDictionary *userInfo = @{NSLocalizedDescriptionKey: localizedDescription, NSLocalizedFailureReasonErrorKey: localizedFailureString};

	return [[NSError alloc] initWithDomain:RSOPMLErrorDomain code:RSOPMLErrorCodeDataIsWrongFormat userInfo:userInfo];
}
