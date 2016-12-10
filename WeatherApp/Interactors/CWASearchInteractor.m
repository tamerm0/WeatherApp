//
//  CWASearchInteractor.m
//  WeatherApp
//
//  Created by Tamer on 7/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import "CWASearchInteractor.h"
#import "CWASearchSuggestions.h"
#import "CWASuggestion.h"

@implementation CWASearchInteractor

- (void)findLatestSearchSuggestions:(NSInteger)limit callback:(void (^)(CWASearchSuggestions *))callback {
	__weak typeof(self) this = self;
	[self.citySearchDao queryLatestSearches:limit callback:^(NSArray<id<CWACitySearchInterface>> *searches) {
		callback([this mapSearchesToSuggestions:searches]);
	}];
}

- (void)findLatestSearchSuggestions:(NSInteger)limit query:(NSString *)query callback:(void (^)(CWASearchSuggestions *))callback {
	__weak typeof(self) this = self;
	[self.citySearchDao queryLatestSearches:limit cityName:query callback:^(NSArray<id<CWACitySearchInterface>> *searches) {
		callback([this mapSearchesToSuggestions:searches]);
	}];
}

- (CWASearchSuggestions *)mapSearchesToSuggestions:(NSArray<id<CWACitySearchInterface>> *)searches {
	NSMutableArray<CWASuggestion *> *suggestions = [NSMutableArray arrayWithCapacity:searches.count];
	for (id<CWACitySearchInterface> search in searches) {
		[suggestions addObject:[[CWASuggestion alloc] initWithQuery:[search cityName]]];
	}
	return [[CWASearchSuggestions alloc] initWithSuggestions:suggestions];
}

- (void)queryWeatherDeatils:(NSString *)query callback:(void(^)(CWASearchWeatherDetails *))callback {
	[self.detailsInteractor queryWeatherDeatils:query callback:callback];
}

@end
