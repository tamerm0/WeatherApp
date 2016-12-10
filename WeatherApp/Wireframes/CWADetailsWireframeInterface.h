//
//  CWADetailsWireframeInterface.h
//  WeatherApp
//
//  Created by Tamer on 7/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

@class CWAWeatherCondition;

@protocol CWADetailsWireframeInterface <NSObject>

/**
 * Presents detials view controller
 */
- (void)presentDetailsViewController:(NSString *)cityName weatherDetails:(NSArray<CWAWeatherCondition *> *)details;

@end
