//
//  CWARootWireframe.m
//  WeatherApp
//
//  Created by Tamer on 6/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import "CWARootWireframe.h"

@implementation CWARootWireframe

- (void)showRootViewController:(UIViewController *)viewController {
	
	UINavigationController *navigationController = [self navigationControllerFromWindow:self.window];
	navigationController.viewControllers = @[viewController];
}
	
- (UINavigationController *)navigationControllerFromWindow:(UIWindow *)window {
	
	UINavigationController *navigationController = (UINavigationController *)[window rootViewController];
	return navigationController;
}

- (void)showMessageAlert:(NSString *)message viewController:(UIViewController *)controller {
	UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];
	[alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil]];
	[controller presentViewController:alertController animated:YES completion:nil];
}

- (void)pushViewController:(UIViewController *)viewController {
	UINavigationController *navigationController = [self navigationControllerFromWindow:self.window];
	[navigationController pushViewController:viewController animated:YES];
}
	
@end
