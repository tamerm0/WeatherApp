//
//  CWASearchWireframe.m
//  WeatherApp
//
//  Created by Tamer on 6/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import "CWASearchWireframe.h"
#import "CWASearchViewController.h"

@implementation CWASearchWireframe

- (void)presentSearchViewInWindow:(UIWindow *)window {
	
	[self.rootWireframe showRootViewController:self.searchViewControllerProvider.searchViewController inWindow:window];
}

@end
