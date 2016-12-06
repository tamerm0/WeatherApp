//
//  CWASearchPresenter.h
//  WeatherApp
//
//  Created by Tamer on 6/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CWASearchPresenterInterface.h"
#import "CWASearchWireframeInterface.h"

@interface CWASearchPresenter : NSObject<CWASearchPresenterInterface>

@property (nonatomic, strong)	id<CWASearchWireframeInterface> searchWireframe;

@end
