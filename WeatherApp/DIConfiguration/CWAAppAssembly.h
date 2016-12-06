//
//  CWAAppComponents.h
//  WeatherApp
//
//  Created by Top on 6/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import <Typhoon/Typhoon.h>

@class CWAAppDelegate, CWAWireframesAssembly;

@interface CWAAppAssembly : TyphoonAssembly

@property (nonatomic, strong)	CWAWireframesAssembly *wireframes;

- (CWAAppDelegate *)appDelegate;


@end
