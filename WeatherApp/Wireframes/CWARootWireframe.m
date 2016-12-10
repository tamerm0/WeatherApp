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
	
	UINavigationController *navigationController = [self navigationController];
	navigationController.viewControllers = @[viewController];
}
	
- (UINavigationController *)navigationController {
	
	UINavigationController *navigationController = (UINavigationController *)[self.window rootViewController];
	return navigationController;
}

- (void)showMessageAlert:(NSString *)message {
	UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];
	[alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil]];
	[[self navigationController] presentViewController:alertController animated:YES completion:nil];
}

- (void)pushViewController:(UIViewController *)viewController {
	UINavigationController *navigationController = [self navigationController];
	[navigationController pushViewController:viewController animated:YES];
}
	
@end
