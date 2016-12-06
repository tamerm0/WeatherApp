//
//  CWAPresentersAssembly.h
//  WeatherApp
//
//  Created by Tamer on 6/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import <Typhoon/Typhoon.h>

#import "CWAWireframesAssembly.h"
#import "CWAInteractorsAssembly.h"

@protocol CWASearchPresenterInterface, CWADetailsPresenterInterface;

@interface CWAPresentersAssembly : TyphoonAssembly

@property (nonatomic, strong)	CWAWireframesAssembly *wireframes;
@property (nonatomic, strong)	CWAInteractorsAssembly *interactors;

- (id<CWASearchPresenterInterface>)searchPresenter;

- (id<CWADetailsPresenterInterface>)detailsPresenter;

@end
