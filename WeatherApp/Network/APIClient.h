//
//  APIClient.h
//  WeatherApp
//
//  Created by Tamer on 10/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AFHTTPSessionManager, CWAWeatherResponse;

@interface APIClient : NSObject

@property (nonatomic, strong)	AFHTTPSessionManager *httpClient;
@property (nonatomic, copy)		NSString *apiKey;
@property (nonatomic, copy)		NSString *format;

- (void)fetchWeatherCondtions:(NSString *)query callback:(void(^)(CWAWeatherResponse *, NSError *))completion;

@end
