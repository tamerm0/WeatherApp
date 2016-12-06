//
//  CWAViewControllersAssembly.h
//  WeatherApp
//
//  Created by Tamer on 6/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import <Typhoon/Typhoon.h>

#import "CWASearchViewController.h"

#import "CWAPresentersAssembly.h"

#import "CWASearchViewControllerProvider.h"
#import "CWADetailsViewControllerProvider.h"

@interface CWAViewControllersAssembly : TyphoonAssembly<CWASearchViewControllerProvider, CWADetailsViewControllerProvider>

@property (nonatomic, strong)	CWAPresentersAssembly *presenters;

@end
