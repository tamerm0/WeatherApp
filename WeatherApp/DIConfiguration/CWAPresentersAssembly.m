//
//  CWAPresentersAssembly.m
//  WeatherApp
//
//  Created by Tamer on 6/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import "CWAPresentersAssembly.h"

#import "CWASearchPresenterInterface.h"
#import "CWASearchPresenter.h"

@implementation CWAPresentersAssembly

- (id<CWASearchPresenterInterface>)searchPresenter {
	return [TyphoonDefinition withClass:[CWASearchPresenter class] configuration:^(TyphoonDefinition *definition) {
		[definition injectProperty:@selector(searchWireframe) with:[self.wireframes searchWireframe]];
	}];
}

@end
