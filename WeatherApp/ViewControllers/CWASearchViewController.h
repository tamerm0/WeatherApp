//
//  CWASearchViewController.h
//  WeatherApp
//
//  Created by Tamer on 5/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CWASearchPresenterInterface;
@interface CWASearchViewController : UIViewController

@property (nonatomic, strong)	id<CWASearchPresenterInterface> eventHandler;

@end
