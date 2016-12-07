//
//  CWADAOsAssembly.h
//  WeatherApp
//
//  Created by Top on 7/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import <Typhoon/Typhoon.h>

#import "CWACoreDataComponents.h"

@protocol CWACitySearchDAOInterface;

@interface CWADAOsAssembly : TyphoonAssembly

@property (nonatomic, strong)	CWACoreDataComponents *coreDataComponents;

- (id<CWACitySearchDAOInterface>)citySearchDAO;

@end
