//
//  CWARootWireframe.h
//  WeatherApp
//
//  Created by Tamer on 6/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWARootWireframeInterface.h"

/**
 * Root wire frame for showing root view controller
 */
@interface CWARootWireframe : NSObject<CWARootWireframeInterface>

@property (nonatomic, weak)	UIWindow *window;

@end
