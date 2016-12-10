//
//  CWADetailsViewControllerProvider.h
//  WeatherApp
//
//  Created by Tamer on 7/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import "CWADetailsViewController.h"

@class CWAWeatherCondition;

@protocol CWADetailsViewControllerProvider <NSObject>

/**
 * Provide details view controller instance with city name and weather
 */
- (CWADetailsViewController *)detailsViewController:(NSString *)cityName weather:(NSArray<CWAWeatherCondition *> *)weather;

@end
