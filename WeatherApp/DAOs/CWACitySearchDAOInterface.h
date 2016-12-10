//
//  CWACitySearchDAOInterface.h
//  WeatherApp
//
//  Created by Tamer on 7/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import "CWACitySearchInterface.h"

@protocol CWACitySearchDAOInterface <NSObject>

/**
 * Query latest searches limited to limit
 */
- (void)queryLatestSearches:(NSUInteger)limit callback:(void (^)(NSArray<id<CWACitySearchInterface>> *))callback;

/**
 * Query latest city searches with limit
 */
- (void)queryLatestSearches:(NSUInteger)limit cityName:(NSString *)cityName callback:(void (^)(NSArray<id<CWACitySearchInterface>> *))callback;

/**
 * Create new query search with city name and query time
 */
- (void)createCitySearch:(NSString *)cityName queryTime:(NSDate *)queryTime;

@end
