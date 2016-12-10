//
//  CWAPresentersAssembly.m
//  WeatherApp
//
//  Created by Tamer on 6/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import "CWAPresentersAssembly.h"

#import "CWASearchPresenter.h"
#import "CWADetailsPresenter.h"

@implementation CWAPresentersAssembly

- (id<CWASearchPresenterInterface>)searchPresenter {
	return [TyphoonDefinition withClass:[CWASearchPresenter class] configuration:^(TyphoonDefinition *definition) {
		[definition injectProperty:@selector(searchWireframe) with:[self.wireframes searchWireframe]];
		[definition injectProperty:@selector(searchInteractor) with:[self.interactors searchInteractor]];
		[definition injectProperty:@selector(suggestionsSize) with:TyphoonConfig(@"suggestions.size")];
	}];
}

- (id<CWADetailsPresenterInterface>)detailsPresenter {
	return [TyphoonDefinition withClass:[CWADetailsPresenter class] configuration:^(TyphoonDefinition *definition) {
		[definition injectProperty:@selector(detailsWireframe) with:[self.wireframes detailsWireframe]];
		[definition injectProperty:@selector(detailsInteractor) with:[self.interactors detailsInteractor]];
	}];
}

@end
