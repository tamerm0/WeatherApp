//
//  CWACitySearchManagedObject.h
//  WeatherApp
//
//  Created by Tamer on 7/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import <CoreData/CoreData.h>

#import "CWACitySearchInterface.h"

@interface CWACitySearchManagedObject : NSManagedObject <CWACitySearchInterface>

@property (nonatomic, retain)	NSString *cityName;
@property (nonatomic, retain)	NSDate *queryTime;

@end
