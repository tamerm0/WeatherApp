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

@end

@implementation CWADetailsWireframe

- (void)presentDetailsViewController:(NSString *)cityName weatherDetails:(NSArray<CWAWeatherCondition *> *)details {
	
	[self.rootWireframe pushViewController:[self.detailsViewControllerProvider detailsViewController:cityName weather:details]];
}

- (void)showAlertMessage:(NSString *)message {
	[self.rootWireframe showMessageAlert:message];
}

@end
