//
//  CWASearchSuggestions.m
//  WeatherApp
//
//  Created by Tamer on 7/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import "CWASearchSuggestions.h"

@implementation CWASearchSuggestions

#pragma mark - Properties
@synthesize suggestions = _suggestions;

#pragma mark - Initialization

- (instancetype)initWithSuggestions:(NSArray<CWASuggestion *> *)suggestions {
	if (self = [self init]) {
		self.suggestions = suggestions;
	}
	return self;
}

@end
