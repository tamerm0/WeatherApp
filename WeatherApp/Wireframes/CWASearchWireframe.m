//
//  CWASearchWireframe.m
//  WeatherApp
//
//  Created by Top on 6/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import "CWASearchWireframe.h"
#import "CWASearchViewController.h"

@implementation CWASearchWireframe

- (void)presentSearchViewInWindow:(UIWindow *)window {
	
	[self.rootWireframe showRootViewController:self.viewConttollers.searchViewController inWindow:window];
}

@end
