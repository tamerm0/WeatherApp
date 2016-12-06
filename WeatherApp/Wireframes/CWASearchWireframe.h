//
//  CWASearchWireframe.h
//  WeatherApp
//
//  Created by Top on 6/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CWARootWireframeInterface.h"

@interface CWASearchWireframe : NSObject
	
@property (nonatomic, strong)		id<CWARootWireframeInterface> rootWireframe;

/**
 * Present search view controller to app window
 */
- (void)presentSearchViewInWindow:(UIWindow *)window;
	
@end
