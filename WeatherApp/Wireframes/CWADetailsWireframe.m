//
//  CWADetailsWireframe.m
//  WeatherApp
//
//  Created by Tamer on 7/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import "CWADetailsWireframe.h"
#import "CWASearchWeatherDetails.h"

@interface CWADetailsWireframe ()

@property (nonatomic, weak)	CWADetailsViewController *detailsViewController;

@end

@implementation CWADetailsWireframe

- (void)presentDetailsViewController:(NSString *)cityName weatherDetails:(NSArray<CWAWeatherCondition *> *)details {
	
	CWADetailsViewController *viewController = [self.detailsViewControllerProvider detailsViewController:cityName weather:details];
	[self.rootWireframe pushViewController:viewController];
	self.detailsViewController = viewController;
}

@end
