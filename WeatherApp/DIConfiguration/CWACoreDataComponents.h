//
//  CWACoreDataAssembly.h
//  WeatherApp
//
//  Created by Tamer on 7/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import <Typhoon/Typhoon.h>

@interface CWACoreDataComponents : TyphoonAssembly

- (NSManagedObjectContext *)managedObjectContext;

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator;

@end
