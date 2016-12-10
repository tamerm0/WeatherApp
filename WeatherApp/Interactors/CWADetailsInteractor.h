//
//  CWADetailsInteractor.h
//  WeatherApp
//
//  Created by Tamer on 7/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CWADetailsInteractorInterface.h"
#import "APIClient.h"

@interface CWADetailsInteractor : NSObject <CWADetailsInteractorInterface>

@property (nonatomic, strong)	APIClient *apiClient;

@end
