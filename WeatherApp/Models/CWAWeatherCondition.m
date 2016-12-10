//
//  CWAWeatherCondition.m
//  WeatherApp
//
//  Created by Tamer on 10/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import "CWAWeatherCondition.h"

@implementation CWAWeatherCondition

- (instancetype)initWithObservationTime:(NSString *)time iconUrl:(NSString *)url description:(NSString *)description humidity:(NSString *)humidity {
	if (self = [self init]) {
		self.observationTime = time;
		self.iconUrl = url;
		self.desc = description;
		self.humidity = humidity;
	}
	return self;
}

@end
