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
	
	CWASearchViewController *searchViewController = [self searchViewController];
	[self.rootWireframe showRootViewController:searchViewController inWindow:window];
}
	
- (CWASearchViewController *)searchViewController {
	return [[CWASearchViewController alloc] initWithNibName:nil bundle:nil];
}
	
@end
