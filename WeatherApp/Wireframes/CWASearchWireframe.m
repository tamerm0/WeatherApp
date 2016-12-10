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

@implementation CWASearchWireframe

- (void)presentSearchViewController {

	[self.rootWireframe showRootViewController:self.searchViewControllerProvider.searchViewController];
}

- (void)presentDetailsViewController:(NSString *)cityName weatherDetails:(CWASearchWeatherDetails *)details {
	[self.detailsWireframe presentDetailsViewController:cityName weatherDetails:details.details];
}

- (void)showAlertWithMessage:(NSString *)message {
	[self.rootWireframe showMessageAlert:message];
}

@end
