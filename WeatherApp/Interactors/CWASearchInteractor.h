//
//  CWASearchInteractor.h
//  WeatherApp
//
//  Created by Tamer on 7/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CWASearchInteractorInterface.h"
#import "CWACitySearchDAOInterface.h"
#import "CWADetailsInteractorInterface.h"

@interface CWASearchInteractor : NSObject <CWASearchInteractorInterface>

@property (nonatomic, strong)		id<CWACitySearchDAOInterface> citySearchDao;
@property (nonatomic, strong)		id<CWADetailsInteractorInterface> detailsInteractor;

@end
