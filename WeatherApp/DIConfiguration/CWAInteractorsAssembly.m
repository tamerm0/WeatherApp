//
//  CWAInteractorsAssembly.m
//  WeatherApp
//
//  Created by Tamer on 7/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import "CWAInteractorsAssembly.h"

#import "CWASearchInteractor.h"
#import "CWADetailsInteractor.h"

@implementation CWAInteractorsAssembly

- (id<CWASearchInteractorInterface>)searchInteractor {
	return [TyphoonDefinition withClass:[CWASearchInteractor class] configuration:^(TyphoonDefinition *definition) {
		[definition injectProperty:@selector(citySearchDao) with:[self.daos citySearchDao]];
		[definition injectProperty:@selector(detailsInteractor) with:[self detailsInteractor]];
	}];
}

- (id<CWADetailsInteractorInterface>)detailsInteractor {
	return [TyphoonDefinition withClass:[CWADetailsInteractor class] configuration:^(TyphoonDefinition *definition) {
		[definition injectProperty:@selector(apiClient) with:[self.network apiClient]];
		[definition injectProperty:@selector(citySearchDao) with:[self.daos citySearchDao]];
	}];
}

@end
