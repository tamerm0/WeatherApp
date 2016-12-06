//
//  CWADependencies.m
//  WeatherApp
//
//  Created by Tamer on 5/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import "CWADependencies.h"
#import "CWASearchWireframe.h"
#import "CWARootWireframe.h"

@interface CWADependencies ()

@property (nonatomic, strong)	CWASearchWireframe *searchWireframe;

@end

@implementation CWADependencies
	
#pragma mark - Initializations

- (instancetype)init {
	if (self = [super init]) {
		[self configureAppDependances];
	}
	return self;
}

#pragma mark - Instance methods

- (void)installRootViewControllerInWindow:(UIWindow *)window {
	[self.searchWireframe presentSearchViewInWindow:window];
}
	
#pragma mark - Private methods
	
- (void)configureAppDependances {
	
	self.searchWireframe = [[CWASearchWireframe alloc] init];
	self.searchWireframe.rootWireframe = [[CWARootWireframe alloc] init];
}
	
@end
