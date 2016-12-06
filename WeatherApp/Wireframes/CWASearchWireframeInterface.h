//
//  CWASearchWireframeInterface.h
//  WeatherApp
//
//  Created by Tamer on 6/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CWASearchWireframeInterface <NSObject>

/**
 * Present search view controller to app window
 */
- (void)presentSearchViewInWindow:(UIWindow *)window;

@end
