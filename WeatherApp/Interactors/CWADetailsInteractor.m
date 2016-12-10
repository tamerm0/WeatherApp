//
//  CWADetailsInteractor.m
//  WeatherApp
//
//  Created by Tamer on 7/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import "CWADetailsInteractor.h"

#import "CWASearchWeatherDetails.h"
#import "CWAWeatherResponse.h"
#import "CWAWeatherCondition.h"
#import "CWAWeatherModel.h"

@implementation CWADetailsInteractor

- (void)queryWeatherDeatils:(NSString *)query callback:(void(^)(CWASearchWeatherDetails *))callback {
	__weak typeof(self) this = self;
	[self.apiClient fetchWeatherCondations:query callback:^(CWAWeatherResponse *response, NSError *error) {
		if (error) {
			callback([this detailsFromError:error]);
		} else {
			callback([this detailsFromResponse:response]);
			if (response.currentCondition.count) {
				[this.citySearchDao createCitySearch:query queryTime:[NSDate date]];
			}
		}
	}];
}

- (CWASearchWeatherDetails *)detailsFromError:(NSError *)error {
	return [[CWASearchWeatherDetails alloc] initWithEmptyMessage:@"Error occured, try again later."];
}

- (CWASearchWeatherDetails *)detailsFromResponse:(CWAWeatherResponse *)response {
	NSMutableArray<CWAWeatherCondition *> *detailsArray = [NSMutableArray arrayWithCapacity:response.currentCondition.count];
	for (CWAWeatherModel *model in response.currentCondition) {
		[detailsArray addObject:[[CWAWeatherCondition alloc] initWithObservationTime:model.observationTime iconUrl:model.weatherIconUrls.firstObject description:model.weatherDescs.firstObject humidity:model.humidity]];
	}
	return [[CWASearchWeatherDetails alloc] initWithEmptyMessage:[response.errorMsg firstObject] detailsArray:detailsArray];
}

@end
