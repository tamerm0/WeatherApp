//
//  CWAAppComponents.m
//  WeatherApp
//
//  Created by Tamer on 6/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import "CWAAppAssembly.h"

#import "CWAAppDelegate.h"

#import "CWAWireframesAssembly.h"

@implementation CWAAppAssembly

- (CWAAppDelegate *)appDelegate {
	return [TyphoonDefinition withClass:[CWAAppDelegate class] configuration:^(TyphoonDefinition *definition) {
		[definition injectProperty:@selector(window) with:[self mainWindow]];
		[definition injectProperty:@selector(searchWireframe) with:[self.wireframes searchWireframe]];
	}];
}

- (UIWindow *)mainWindow {
	
	return [TyphoonDefinition withClass:[UIWindow class] configuration:^(TyphoonDefinition *definition) {
		[definition useInitializer:@selector(initWithFrame:) parameters:^(TyphoonMethod *initializer) {
			[initializer injectParameterWith:[NSValue valueWithCGRect:[[UIScreen mainScreen] bounds]]];
		}];
		[definition injectProperty:@selector(rootViewController) with:[self navigationController]];
	}];
}

- (UINavigationController *)navigationController {
	
	return [TyphoonDefinition withClass:[UINavigationController class]];
}

@end
