//
//  CWAAppComponents.m
//  WeatherApp
//
//  Created by Top on 6/12/16.
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
	
	UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	window.rootViewController = [self navigationController];
	return window;
}

- (UINavigationController *)navigationController {
	
	UINavigationController *navigationController = [[UINavigationController alloc] init];
	navigationController.navigationBar.translucent = NO;
	return navigationController;
}

@end
