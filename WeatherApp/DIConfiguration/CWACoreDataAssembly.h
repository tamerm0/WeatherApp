//
//  CWACoreDataAssembly.h
//  WeatherApp
//
//  Created by Top on 7/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import <Typhoon/Typhoon.h>

@interface CWACoreDataAssembly : TyphoonAssembly

- (NSManagedObjectContext *)mainManagedObjectContext;

- (NSManagedObjectContext *)managedObjectContext;

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator;

@end
