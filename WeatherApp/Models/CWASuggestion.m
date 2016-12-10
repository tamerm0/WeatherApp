//
//  CWASuggestion.m
//  WeatherApp
//
//  Created by Tamer on 7/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import "CWASuggestion.h"

@implementation CWASuggestion

#pragma mark - Properties
@synthesize query = _query;

#pragma mark - Initialization

- (instancetype)initWithQuery:(NSString *)query {
	if (self = [self init]) {
		self.query = query;
	}
	return self;
}

@end
