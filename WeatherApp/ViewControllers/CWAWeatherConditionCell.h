//
//  CWAWeatherConditionCell.h
//  WeatherApp
//
//  Created by Tamer on 10/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CWAWeatherCondition.h"

@interface CWAWeatherConditionCell : UITableViewCell

- (void)updateViewWithWeatherCondition:(CWAWeatherCondition *)condition;

@end
