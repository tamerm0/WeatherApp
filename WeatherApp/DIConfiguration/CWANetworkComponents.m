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
			[initializer injectParameterWith:[self apiEndpoint]];
		}];
		[definition injectProperty:@selector(completionQueue) with:dispatch_queue_create("network-callbacks", DISPATCH_QUEUE_CONCURRENT)];
	}];
}

- (APIClient *)apiClient {
	return [TyphoonDefinition withClass:[APIClient class] configuration:^(TyphoonDefinition *definition) {
		[definition injectProperty:@selector(apiKey) with:TyphoonConfig(@"api.key")];
		[definition injectProperty:@selector(format) with:TyphoonConfig(@"api.format")];
		[definition injectProperty:@selector(httpClient) with:self.sessionManager];
	}];
}

- (NSURL *)apiEndpoint {
	return [TyphoonDefinition withClass:[NSURL class] configuration:^(TyphoonDefinition *definition) {
		[definition useInitializer:@selector(initWithString:) parameters:^(TyphoonMethod *initializer) {
			[initializer injectParameterWith:TyphoonConfig(@"api.endpoint")];
		}];
	}];
}

@end
