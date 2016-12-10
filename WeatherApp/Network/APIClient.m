//
//  APIClient.m
//  WeatherApp
//
//  Created by Tamer on 10/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import "APIClient.h"

#import "CWAWeatherResponse.h"
#import <AFNetworking/AFNetworking.h>

#define kWeatherPath	@"/free/v1/weather.ashx"
#define kKey			@"key"
#define kFormat			@"format"
#define kQuery			@"q"

@implementation APIClient

- (void)fetchWeatherCondations:(NSString *)query callback:(void(^)(CWAWeatherResponse *, NSError *))completion {
	[self.httpClient GET:kWeatherPath parameters:[self requestParams:query] progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
		NSError *error = nil;
		CWAWeatherResponse *response = [[CWAWeatherResponse alloc] initWithDictionary:responseObject error:&error];
		completion(response, error);
	} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
		completion(nil, error);
	}];
}

- (NSDictionary<NSString *, NSString *> *)requestParams:(NSString *)query {
	return @{kKey: self.apiKey,
			 kFormat: self.format,
			 kQuery: query};
}

@end
