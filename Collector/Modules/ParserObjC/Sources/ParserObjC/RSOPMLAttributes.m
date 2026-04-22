//
//  RSOPMLAttributes.m
//  RSParser
//
//  Created by Solid Omit on 2/28/16.
//  Copyright © 2016 Sotech Company, LLC. All rights reserved.
//

#import "RSOPMLAttributes.h"
#import "RSParserInternal.h"




NSString *OPMLTextKey = @"text";
NSString *OPMLTitleKey = @"title";
NSString *OPMLDescriptionKey = @"description";
NSString *OPMLTypeKey = @"type";
NSString *OPMLVersionKey = @"version";
NSString *OPMLHMTLURLKey = @"htmlUrl";
NSString *OPMLXMLURLKey = @"xmlUrl";


@implementation NSDictionary (RSOPMLAttributes)

- (NSString *)opml_text {

	return [self rsparser_objectForCaseInsensitiveKey:OPMLTextKey];
}


- (NSString *)opml_title {

	return [self rsparser_objectForCaseInsensitiveKey:OPMLTitleKey];
}


- (NSString *)opml_description {

	return [self rsparser_objectForCaseInsensitiveKey:OPMLDescriptionKey];
}


- (NSString *)opml_type {

	return [self rsparser_objectForCaseInsensitiveKey:OPMLTypeKey];
}


- (NSString *)opml_version {

	return [self rsparser_objectForCaseInsensitiveKey:OPMLVersionKey];
}


- (NSString *)opml_htmlUrl {

	return [self rsparser_objectForCaseInsensitiveKey:OPMLHMTLURLKey];
}


- (NSString *)opml_xmlUrl {

	return [self rsparser_objectForCaseInsensitiveKey:OPMLXMLURLKey];
}


@end
