//
//  CWASearchWireframeInterface.h
//  WeatherApp
//
//  Created by Tamer on 6/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CWASearchWeatherDetails;

@protocol CWASearchWireframeInterface <NSObject>

/**
 * Present search view controller to app window
 */
- (void)presentSearchViewController;

/**
 * Present details view controller with fetched weather details
 */
- (void)presentDetailsViewController:(NSString *)cityName weatherDetails:(CWASearchWeatherDetails *)details;

/**
 * Shows alert with message to the user
 */
- (void)showAlertWithMessage:(NSString *)message;

@end
