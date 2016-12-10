//
//  APIClient.h
//  WeatherApp
//
//  Created by Tamer on 10/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AFHTTPSessionManager;

@interface APIClient : NSObject

@property (nonatomic, strong)	AFHTTPSessionManager *httpClient;
@property (nonatomic, copy)		NSString *apiKey;

@end
