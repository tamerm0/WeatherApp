//
//  CWACitySearchDAO.h
//  WeatherApp
//
//  Created by Tamer on 7/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#import "CWACitySearchDAOInterface.h"

@interface CWACitySearchDAO : NSObject <CWACitySearchDAOInterface>

@property (nonatomic, strong)	NSManagedObjectContext *managedObjectContext;

@end
