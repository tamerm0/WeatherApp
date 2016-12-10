//
//  CWADetailsPresenter.m
//  WeatherApp
//
//  Created by Tamer on 7/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import "CWADetailsPresenter.h"
#import "CWASearchWeatherDetails.h"
#import "CWAWeatherCondition.h"

@implementation CWADetailsPresenter

- (void)refreshWeatherDeatils:(NSString *)query callback:(void(^)(NSArray<CWAWeatherCondition *> *))callback {
	[self.detailsInteractor queryWeatherDeatils:query callback:^(CWASearchWeatherDetails *details) {
		dispatch_async(dispatch_get_main_queue(), ^{
			if (callback) {
				callback(details.details);
			}
			if (details.details.count) {
				// TODO ask wireframe to show error message
			}
		});
	}];
}

@end
