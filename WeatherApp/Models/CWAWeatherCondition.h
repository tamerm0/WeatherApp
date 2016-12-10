//
//  CWAWeatherCondition.h
//  WeatherApp
//
//  Created by Tamer on 10/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CWAWeatherCondition : NSObject

@property (nonatomic, copy)	NSString *observationTime;
@property (nonatomic, copy)	NSString *iconUrl;
@property (nonatomic, copy)	NSString *desc;
@property (nonatomic, copy)	NSString *humidity;

- (instancetype)initWithObservationTime:(NSString *)time iconUrl:(NSString *)url description:(NSString *)description humidity:(NSString *)humidity;

@end
