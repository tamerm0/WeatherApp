//
//  CWADetailsInteractorInterface.h
//  WeatherApp
//
//  Created by Tamer on 7/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

@class CWASearchWeatherDetails;

@protocol CWADetailsInteractorInterface <NSObject>

- (void)queryWeatherDeatils:(NSString *)query callback:(void(^)(CWASearchWeatherDetails *))callback;

@end
