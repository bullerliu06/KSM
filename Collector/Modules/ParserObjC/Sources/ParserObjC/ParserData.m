//
//  ParserData.m
//  RSParser
//
//  Created by Solid Omit on 10/4/17.
//  Copyright © 2017 Sotech Company, LLC. All rights reserved.
//

#import "ParserData.h"

@implementation ParserData

- (instancetype)initWithURL:(NSString *)url data:(NSData *)data {

	self = [super init];
	if (!self) {
		return nil;
	}

	_url = url;
	_data = data;

	return self;
}

@end
