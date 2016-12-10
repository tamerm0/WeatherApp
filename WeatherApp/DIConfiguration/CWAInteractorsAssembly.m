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
		[definition injectProperty:@selector(citySearchDAO) with:[self.daos citySearchDAO]];
	}];
}

- (id<CWADetailsInteractorInterface>)detailsInteractor {
	return [TyphoonDefinition withClass:[CWADetailsInteractor class]];
}

@end
