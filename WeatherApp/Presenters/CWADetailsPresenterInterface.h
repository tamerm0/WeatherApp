//
//  CWADetailsPresenterInterface.h
//  WeatherApp
//
//  Created by Tamer on 7/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

@class CWAWeatherCondition;

@protocol CWADetailsPresenterInterface <NSObject>

/**
 * Updates weather details for some query
 */
- (void)refreshWeatherDeatils:(NSString *)query callback:(void(^)(NSArray<CWAWeatherCondition *> *))callback;

@end
