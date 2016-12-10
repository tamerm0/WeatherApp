//
//  CWASearchWireframe.m
//  WeatherApp
//
//  Created by Tamer on 6/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import "CWASearchWireframe.h"
#import "CWASearchViewController.h"
#import "CWASearchWeatherDetails.h"

@interface CWASearchWireframe ()

@property (nonatomic, weak)	CWASearchViewController *searchViewController;

@end

@implementation CWASearchWireframe

- (void)presentSearchViewController {

	CWASearchViewController *viewController = self.searchViewControllerProvider.searchViewController;
	[self.rootWireframe showRootViewController:viewController];
	self.searchViewController = viewController;
}

- (void)presentDetailsViewController:(NSString *)cityName weatherDetails:(CWASearchWeatherDetails *)details {
	[self.detailsWireframe presentDetailsViewController:cityName weatherDetails:details.details];
}

- (void)showAlertWithMessage:(NSString *)message {
	[self.rootWireframe showMessageAlert:message viewController:self.searchViewController];
}

@end
