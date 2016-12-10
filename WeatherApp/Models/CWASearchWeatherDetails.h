//
//  CWASearchWeatherDetails.h
//  WeatherApp
//
//  Created by Tamer on 10/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CWAWeatherCondition;

@interface CWASearchWeatherDetails : NSObject

@property (nonatomic, copy)		NSString *emptyMessage;
@property (nonatomic, strong)	NSArray<CWAWeatherCondition *> *details;

- (instancetype)initWithEmptyMessage:(NSString *)message;

- (instancetype)initWithEmptyMessage:(NSString *)message detailsArray:(NSArray<CWAWeatherCondition *> *)details;

@end
