//
//  CWADetailsViewControllerProvider.h
//  WeatherApp
//
//  Created by Tamer on 7/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import "CWADetailsViewController.h"

@protocol CWADetailsViewControllerProvider <NSObject>

- (CWADetailsViewController *)detailsViewController;

@end
