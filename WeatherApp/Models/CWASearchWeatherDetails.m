//
//  CWASearchWeatherDetails.m
//  WeatherApp
//
//  Created by Tamer on 10/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import "CWASearchWeatherDetails.h"

@implementation CWASearchWeatherDetails

- (instancetype)initWithEmptyMessage:(NSString *)message {
	return [self initWithEmptyMessage:message detailsArray:nil];
}

- (instancetype)initWithEmptyMessage:(NSString *)message detailsArray:(NSArray<CWAWeatherCondition *> *)details {
	if (self = [self init]) {
		self.emptyMessage = message;
		self.details = details;
	}
	return self;
}

@end
