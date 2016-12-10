//
//  CWASearchInteractorInterface.h
//  WeatherApp
//
//  Created by Tamer on 7/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

@class CWASearchSuggestions, CWASearchWeatherDetails;

@protocol CWASearchInteractorInterface <NSObject>

- (void)findLatestSearchSuggestions:(NSInteger)limit callback:(void(^)(CWASearchSuggestions *suggestions))callback;

- (void)findLatestSearchSuggestions:(NSInteger)limit query:(NSString *)query callback:(void (^)(CWASearchSuggestions *))callback;

- (void)queryWeatherDeatils:(NSString *)query callback:(void(^)(CWASearchWeatherDetails *))callback;

@end
