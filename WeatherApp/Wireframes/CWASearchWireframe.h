//
//  CWASearchWireframe.h
//  WeatherApp
//
//  Created by Tamer on 6/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CWARootWireframeInterface.h"

#import "CWASearchWireframeInterface.h"

#import "CWASearchViewControllerProvider.h"
#import "CWADetailsWireframeInterface.h"

@interface CWASearchWireframe : NSObject<CWASearchWireframeInterface>

@property (nonatomic, strong)		id<CWASearchViewControllerProvider> searchViewControllerProvider;

@property (nonatomic, strong)		id<CWADetailsWireframeInterface> detailsWireframe;
	
@property (nonatomic, strong)		id<CWARootWireframeInterface> rootWireframe;

@end
