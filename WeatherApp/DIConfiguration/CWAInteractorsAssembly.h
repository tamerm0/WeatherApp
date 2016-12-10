//
//  CWAInteractorsAssembly.h
//  WeatherApp
//
//  Created by Tamer on 7/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import <Typhoon/Typhoon.h>

#import "CWADAOsAssembly.h"

@protocol CWASearchInteractorInterface, CWADetailsInteractorInterface;

@interface CWAInteractorsAssembly : TyphoonAssembly

@property (nonatomic, strong)	CWADAOsAssembly *daos;

- (id<CWASearchInteractorInterface>)searchInteractor;

- (id<CWADetailsInteractorInterface>)detailsInteractor;

@end
