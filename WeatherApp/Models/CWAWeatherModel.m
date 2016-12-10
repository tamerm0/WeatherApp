//
//  CWAWeatherModel.m
//  WeatherApp
//
//  Created by Tamer on 10/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import "CWAWeatherModel.h"

@implementation CWAWeatherModel

+ (JSONKeyMapper *)keyMapper {
	return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
																  @"observationTime": @"observation_time",
																  @"tempC": @"temp_C",
																  @"tempF": @"temp_F",
																  @"weatherCode": @"weatherCode",
																  @"weatherIconUrls": @"weatherIconUrl.value",
																  @"weatherDescs": @"weatherDesc.value",
																  @"windSpeedMiles": @"windspeedMiles",
																  @"windSpeedKmph": @"windspeedKmph",
																  @"windDirectionDegree": @"winddirDegree",
																  @"windDirection16Point": @"winddir16Point",
																  @"preceptionMM": @"precipMM",
																  @"humidity": @"humidity",
																  @"visibility": @"visibility",
																  @"pressure": @"pressure",
																  @"cloudCover": @"cloudcover"
																  }];
}

@end
