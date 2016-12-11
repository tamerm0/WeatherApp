//
//  CWADetailsInteractorInterface.h
//  WeatherApp
//
//  Created by Tamer on 7/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

@class CWASearchWeatherDetails;

@protocol CWADetailsInteractorInterface <NSObject>

/**
 * Query weather details for search query
 */
- (void)queryWeatherDeatils:(NSString *)query callback:(void(^)(CWASearchWeatherDetails *))callback;

@end
