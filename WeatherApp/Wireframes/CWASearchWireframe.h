//
//  CWASearchWireframe.h
//  WeatherApp
//
//  Created by Top on 6/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CWARootWireframeInterface.h"

#import "CWASearchWireframeInterface.h"

#import "CWAViewControllersAssembly.h"

@interface CWASearchWireframe : NSObject<CWASearchWireframeInterface>

@property (nonatomic, strong)		CWAViewControllersAssembly *viewConttollers;
	
@property (nonatomic, strong)		id<CWARootWireframeInterface> rootWireframe;

@end
