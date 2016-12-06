//
//  CWARootWireframe.m
//  WeatherApp
//
//  Created by Tamer on 6/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import "CWARootWireframe.h"

@implementation CWARootWireframe

- (void)showRootViewController:(UIViewController *)viewController inWindow:(UIWindow *)window {
	
	UINavigationController *navigationController = [self navigationControllerFromWindow:window];
	navigationController.viewControllers = @[viewController];
}
	
- (UINavigationController *)navigationControllerFromWindow:(UIWindow *)window {
	
	UINavigationController *navigationController = (UINavigationController *)[window rootViewController];
	return navigationController;
}
	
@end
