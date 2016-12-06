//
//  CWAPresentersAssembly.h
//  WeatherApp
//
//  Created by Tamer on 6/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import <Typhoon/Typhoon.h>

#import "CWAWireframesAssembly.h"

@protocol CWASearchPresenterInterface;

@interface CWAPresentersAssembly : TyphoonAssembly

@property (nonatomic, strong)	CWAWireframesAssembly *wireframes;

- (id<CWASearchPresenterInterface>)searchPresenter;

@end
