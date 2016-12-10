//
//  CWAWireframesComponents.h
//  WeatherApp
//
//  Created by Tamer on 6/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import <Typhoon/Typhoon.h>

@protocol CWASearchWireframeInterface, CWARootWireframeInterface, CWADetailsWireframeInterface;
@class CWAViewControllersAssembly, CWAAppAssembly;

@interface CWAWireframesAssembly : TyphoonAssembly

@property (nonatomic, strong)	CWAViewControllersAssembly *viewControllers;
@property (nonatomic, strong)	CWAAppAssembly *appAssembly;

- (id<CWASearchWireframeInterface>)searchWireframe;

- (id<CWADetailsWireframeInterface>)detailsWireframe;

- (id<CWARootWireframeInterface>)rootWireframe;

@end
