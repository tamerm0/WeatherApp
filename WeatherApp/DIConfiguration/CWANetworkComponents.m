//
//  CWANetworkComponents.m
//  WeatherApp
//
//  Created by Tamer on 10/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import "CWANetworkComponents.h"

@implementation CWANetworkComponents

- (AFHTTPSessionManager *)sessionManager {
	return [TyphoonDefinition withClass:[AFHTTPSessionManager class] configuration:^(TyphoonDefinition *definition) {
		[definition useInitializer:@selector(initWithBaseURL:) parameters:^(TyphoonMethod *initializer) {
			[initializer injectParameterWith:[NSURL URLWithString:TyphoonConfig(@"api.endpoint")]];
		}];
	}];
}

- (APIClient *)apiClient {
	return [TyphoonDefinition withClass:[APIClient class] configuration:^(TyphoonDefinition *definition) {
		[definition injectProperty:@selector(apiKey) with:TyphoonConfig(@"api.key")];
		[definition injectProperty:@selector(httpClient) with:self.sessionManager];
	}];
}

@end
