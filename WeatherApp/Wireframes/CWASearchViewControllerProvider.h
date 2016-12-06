//
//  CWASearchViewControllerFactory.h
//  WeatherApp
//
//  Created by Tamer on 6/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import "CWASearchViewController.h"

/**
 * Protocal to provide searv view controller instances
 */
@protocol CWASearchViewControllerProvider <NSObject>

- (CWASearchViewController *)searchViewController;

@end
