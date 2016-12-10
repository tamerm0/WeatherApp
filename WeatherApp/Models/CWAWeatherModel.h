//
//  CWAWeatherModel.h
//  WeatherApp
//
//  Created by Tamer on 10/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol CWAWeatherModel;

@interface CWAWeatherModel : JSONModel

@property (nonatomic, copy)	NSString *observationTime;
@property (nonatomic, copy)	NSString *tempC;
@property (nonatomic, copy)	NSString *tempF;
@property (nonatomic, copy)	NSString *weatherCode;
@property (nonatomic, copy)	NSString *weatherIconUrl;
@property (nonatomic, copy)	NSString *weatherDesc;
@property (nonatomic, copy)	NSString *windSpeedMiles;
@property (nonatomic, copy)	NSString *windSpeedKmph;
@property (nonatomic, copy)	NSString *windDirectionDegree;
@property (nonatomic, copy)	NSString *windDirection16Point;
@property (nonatomic, copy)	NSString *preceptionMM;
@property (nonatomic, copy)	NSString *humidity;
@property (nonatomic, copy)	NSString *visibility;
@property (nonatomic, copy)	NSString *pressure;
@property (nonatomic, copy)	NSString *cloudCover;

@end
