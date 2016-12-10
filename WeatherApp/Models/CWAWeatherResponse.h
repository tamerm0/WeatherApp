//
//  CWAWeatherResponse.h
//  WeatherApp
//
//  Created by Tamer on 10/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "CWAWeatherModel.h"

@interface CWAWeatherResponse : JSONModel

@property (nonatomic, copy)		NSString<Optional> *errorMsg;
@property (nonatomic, strong)	NSArray<CWAWeatherModel, Optional> *currentCondition;

@end
