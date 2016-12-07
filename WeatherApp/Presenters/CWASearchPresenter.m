//
//  CWASearchPresenter.m
//  WeatherApp
//
//  Created by Tamer on 6/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import "CWASearchPresenter.h"

#import "CWASearchSuggestions.h"
#import "CWASuggestion.h"

#define kMaxSuggestions		10

@implementation CWASearchPresenter

- (void)initialSearchSuggestion:(void (^)(CWASearchSuggestions *))callback {
	
}

- (void)querySearchSuggestions:(NSString *)query callback:(void (^)(CWASearchSuggestions *))callback {

	if ([NSString isEmpty:query]) {
		[self initialSearchSuggestion:callback];
	} else {
		
	}
}

@end
