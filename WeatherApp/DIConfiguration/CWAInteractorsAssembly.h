//
//  CWAInteractorsAssembly.h
//  WeatherApp
//
//  Created by Tamer on 7/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import <Typhoon/Typhoon.h>

@protocol CWASearchInteractorInterface, CWADetailsInteractorInterface;

@interface CWAInteractorsAssembly : TyphoonAssembly

- (id<CWASearchInteractorInterface>)searchInteractor;

- (id<CWADetailsInteractorInterface>)detailsInteractor;

@end
