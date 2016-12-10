//
//  CWAAppComponents.h
//  WeatherApp
//
//  Created by Tamer on 6/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import <Typhoon/Typhoon.h>

@class CWAAppDelegate, CWAWireframesAssembly;

/**
 * Assembly class for Application components DI
 */
@interface CWAAppAssembly : TyphoonAssembly

@property (nonatomic, strong)	CWAWireframesAssembly *wireframes;

- (CWAAppDelegate *)appDelegate;

- (UIWindow *)mainWindow;

@end
