//
//  CWAViewControllersAssembly.m
//  WeatherApp
//
//  Created by Tamer on 6/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import "CWAViewControllersAssembly.h"

@implementation CWAViewControllersAssembly

- (CWASearchViewController *)searchViewController {
	return [TyphoonDefinition withClass:[CWASearchViewController class] configuration:^(TyphoonDefinition *definition) {
		[definition useInitializer:@selector(initWithNibName:bundle:) parameters:^(TyphoonMethod *initializer) {
			[initializer injectParameterWith:NSStringFromClass([CWASearchViewController class])];
			[initializer injectParameterWith:[NSBundle mainBundle]];
		}];
		[definition injectProperty:@selector(eventHandler) with:[self.presenters searchPresenter]];
	}];
}

- (CWADetailsViewController *)detailsViewController {
	return [TyphoonDefinition withClass:[CWADetailsViewController class] configuration:^(TyphoonDefinition *definition) {
		[definition useInitializer:@selector(initWithNibName:bundle:) parameters:^(TyphoonMethod *initializer) {
			[initializer injectParameterWith:NSStringFromClass([CWADetailsViewController class])];
			[initializer injectParameterWith:[NSBundle mainBundle]];
		}];
		[definition injectProperty:@selector(eventHandler) with:[self.presenters detailsPresenter]];
	}];
}

@end
