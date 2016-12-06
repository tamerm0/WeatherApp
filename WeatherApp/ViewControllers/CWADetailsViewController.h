//
//  CWADetailsViewController.h
//  WeatherApp
//
//  Created by Tamer on 7/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CWADetailsPresenterInterface.h"

@interface CWADetailsViewController : UIViewController

@property (nonatomic, strong)	id<CWADetailsPresenterInterface> eventHandler;

@end
