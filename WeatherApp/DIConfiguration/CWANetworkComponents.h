//
//  CWANetworkComponents.h
//  WeatherApp
//
//  Created by Tamer on 10/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import <Typhoon/Typhoon.h>
#import <AFNetworking/AFNetworking.h>

#import "APIClient.h"

@interface CWANetworkComponents : TyphoonAssembly

- (AFHTTPSessionManager *)sessionManager;

- (APIClient *)apiClient;

@end
