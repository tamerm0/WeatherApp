//
//  CWADetailsWireframe.h
//  WeatherApp
//
//  Created by Tamer on 7/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CWADetailsWireframeInterface.h"
#import "CWADetailsViewControllerProvider.h"
#import "CWARootWireframeInterface.h"

@interface CWADetailsWireframe : NSObject<CWADetailsWireframeInterface>

@property (nonatomic, strong)	id<CWADetailsViewControllerProvider> detailsViewControllerProvider;
@property (nonatomic, strong)	id<CWARootWireframeInterface> rootWireframe;

@end
