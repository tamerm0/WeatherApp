//
//  CWAWireframesComponents.h
//  WeatherApp
//
//  Created by Top on 6/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import <Typhoon/Typhoon.h>

@protocol CWASearchWireframeInterface, CWARootWireframeInterface;
@class CWAViewControllersAssembly;

@interface CWAWireframesAssembly : TyphoonAssembly

@property (nonatomic, strong)	CWAViewControllersAssembly *viewControllers;

- (id<CWASearchWireframeInterface>)searchWireframe;

- (id<CWARootWireframeInterface>)rootWireframe;

@end
