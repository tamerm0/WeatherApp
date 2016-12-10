//
//  CWAWeatherResponse.h
//  WeatherApp
//
//  Created by Tamer on 10/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "CWAWeatherModel.h"

@protocol NSString;

@interface CWAWeatherResponse : JSONModel

@property (nonatomic, strong)	NSArray<NSString, Optional> *errorMsg;
@property (nonatomic, strong)	NSArray<CWAWeatherModel, Optional> *currentCondition;

@end
