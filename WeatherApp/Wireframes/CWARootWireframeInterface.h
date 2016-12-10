//
//  CWARootWireframeInterface.h
//  WeatherApp
//
//  Created by Tamer on 6/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CWARootWireframeInterface <NSObject>
	
/**
 * Display viewController as the root viewController of window
 */
- (void)showRootViewController:(UIViewController *)viewController;

/**
 * Push view controller to the nevigation view controller
 */
- (void)pushViewController:(UIViewController *)viewController;

/**
 * Show alert with message in view controller
 */
- (void)showMessageAlert:(NSString *)message viewController:(UIViewController *)controller;
	
@end
