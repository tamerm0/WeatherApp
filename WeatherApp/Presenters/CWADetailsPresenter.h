//
//  CWADetailsPresenter.h
//  WeatherApp
//
//  Created by Tamer on 7/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CWADetailsPresenterInterface.h"
#import "CWADetailsWireframeInterface.h"
#import "CWADetailsInteractorInterface.h"

@interface CWADetailsPresenter : NSObject <CWADetailsPresenterInterface>

@property (nonatomic, strong)	id<CWADetailsWireframeInterface> detailsWireframe;
@property (nonatomic, strong)	id<CWADetailsInteractorInterface> detailsInteractor;

@end
