//
//  CWACitySearchInterface.h
//  WeatherApp
//
//  Created by Top on 7/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

/**
 * Interface to persisted city search
 */
@protocol CWACitySearchInterface <NSObject>

@property (nonatomic)	NSString *cityName;
@property (nonatomic)	NSDate *queryTime;

@end
