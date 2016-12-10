//
//  CWAWeatherResponse.m
//  WeatherApp
//
//  Created by Tamer on 10/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import "CWAWeatherResponse.h"

@implementation CWAWeatherResponse

+ (JSONKeyMapper *)keyMapper {
	return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
																  @"errorMsg": @"data.error.msg",
																  @"currentCondition": @"data.current_condition"
																  }];
}

@end
