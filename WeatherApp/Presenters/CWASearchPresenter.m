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

@implementation CWASearchPresenter

- (void)initialSearchSuggestion:(void (^)(CWASearchSuggestions *))callback {
	
	[self.searchInteractor findLatestSearchSuggestions:self.suggestionsSize callback:^(CWASearchSuggestions *suggestions) {
		dispatch_async(dispatch_get_main_queue(), ^{
			callback(suggestions);
		});
	}];
}

- (void)querySearchSuggestions:(NSString *)query callback:(void (^)(CWASearchSuggestions *))callback {

	if ([NSString isEmpty:query]) {
		[self initialSearchSuggestion:callback];
	} else {
		[self.searchInteractor findLatestSearchSuggestions:self.suggestionsSize query:query callback:^(CWASearchSuggestions *suggestions) {
			dispatch_async(dispatch_get_main_queue(), ^{
				callback(suggestions);
			});
		}];
	}
}

@end
