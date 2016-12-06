//
//  CWAViewControllersAssembly.h
//  WeatherApp
//
//  Created by Top on 6/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import <Typhoon/Typhoon.h>

#import "CWASearchViewController.h"

#import "CWAPresentersAssembly.h"

@interface CWAViewControllersAssembly : TyphoonAssembly

@property (nonatomic, strong)	CWAPresentersAssembly *persenters;

- (CWASearchViewController *)searchViewController;

@end
