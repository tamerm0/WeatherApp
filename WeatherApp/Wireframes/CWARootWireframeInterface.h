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
- (void)showRootViewController:(UIViewController *)viewController
					  inWindow:(UIWindow *)window;
	
@end
