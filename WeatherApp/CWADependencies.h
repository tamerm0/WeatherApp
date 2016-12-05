//
//  CWADependencies.h
//  WeatherApp
//
//  Created by Tamer on 5/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CWADependencies : NSObject

// A method to add main app view to application window
- (void)installRootViewControllerInWindow:(UIWindow *)window;

@end
