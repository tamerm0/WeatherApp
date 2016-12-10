//
//  CWAWireframesComponents.m
//  WeatherApp
//
//  Created by Tamer on 6/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import "CWAWireframesAssembly.h"

#import "CWASearchWireframe.h"
#import "CWADetailsWireframe.h"
#import "CWARootWireframe.h"

#import "CWAViewControllersAssembly.h"
#import "CWAAppAssembly.h"

@implementation CWAWireframesAssembly


- (id<CWASearchWireframeInterface>)searchWireframe {
	return [TyphoonDefinition withClass:[CWASearchWireframe class] configuration:^(TyphoonDefinition *definition) {
		[definition injectProperty:@selector(rootWireframe) with:[self rootWireframe]];
		[definition injectProperty:@selector(searchViewControllerProvider) with:self.viewControllers];
		[definition injectProperty:@selector(detailsWireframe) with:self.detailsWireframe];
	}];
}

- (id<CWADetailsWireframeInterface>)detailsWireframe {
	return [TyphoonDefinition withClass:[CWADetailsWireframe class] configuration:^(TyphoonDefinition *definition) {
		[definition injectProperty:@selector(detailsViewControllerProvider) with:self.viewControllers];
		[definition injectProperty:@selector(rootWireframe) with:self.rootWireframe];
	}];
}

- (id<CWARootWireframeInterface>)rootWireframe {
	return [TyphoonDefinition withClass:[CWARootWireframe class] configuration:^(TyphoonDefinition *definition) {
		[definition injectProperty:@selector(window) with:[self.appAssembly mainWindow]];
	}];
}


@end
