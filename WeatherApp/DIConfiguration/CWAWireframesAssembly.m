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

@implementation CWAWireframesAssembly


- (id<CWASearchWireframeInterface>)searchWireframe {
	return [TyphoonDefinition withClass:[CWASearchWireframe class] configuration:^(TyphoonDefinition *definition) {
		[definition injectProperty:@selector(rootWireframe) with:[self rootWireframe]];
		[definition injectProperty:@selector(searchViewControllerProvider) with:self.viewControllers];
	}];
}

- (id<CWADetailsWireframeInterface>)detailsWireframe {
	return [TyphoonDefinition withClass:[CWADetailsWireframe class] configuration:^(TyphoonDefinition *definition) {
		[definition injectProperty:@selector(detailsViewControllerProvider) with:self.viewControllers];
	}];
}

- (id<CWARootWireframeInterface>)rootWireframe {
	return [TyphoonDefinition withClass:[CWARootWireframe class]];
}


@end
