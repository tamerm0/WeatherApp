//
//  CWADetailsInteractor.h
//  WeatherApp
//
//  Created by Tamer on 7/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CWADetailsInteractorInterface.h"
#import "CWACitySearchDAOInterface.h"
#import "APIClient.h"

@interface CWADetailsInteractor : NSObject <CWADetailsInteractorInterface>

@property (nonatomic, strong)	APIClient *apiClient;
@property (nonatomic, strong)	id<CWACitySearchDAOInterface> citySearchDao;

@end
