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
#import "CWASearchWeatherDetails.h"

@implementation CWASearchPresenter

- (void)querySearchSuggestions:(NSString *)query callback:(void (^)(CWASearchSuggestions *))callback {

	void(^completion)(CWASearchSuggestions *) = ^(CWASearchSuggestions *suggestions){
		dispatch_async(dispatch_get_main_queue(), ^{
			if (callback) {
				callback(suggestions);
			}
		});
	};
	
	if ([NSString isEmpty:query]) {
		[self.searchInteractor findLatestSearchSuggestions:self.suggestionsSize callback:completion];
	} else {
		[self.searchInteractor findLatestSearchSuggestions:self.suggestionsSize query:query callback:completion];
	}
}

- (void)presentSearchDetails:(NSString *)query {
	__weak typeof(self) weakSelf = self;
	[self.searchInteractor queryWeatherDeatils:query callback:^(CWASearchWeatherDetails *details) {
		dispatch_async(dispatch_get_main_queue(), ^{
			if (details.details.count) {
				[weakSelf.searchWireframe presentDetailsViewController:query weatherDetails:details];
			} else {
				[weakSelf.searchWireframe showAlertWithMessage:details.emptyMessage];
			}
		});
	}];
}

@end
