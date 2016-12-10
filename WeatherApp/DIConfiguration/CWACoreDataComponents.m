//
//  CWACoreDataAssembly.m
//  WeatherApp
//
//  Created by Tamer on 7/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import "CWACoreDataComponents.h"

#import <CoreData/CoreData.h>

#define kCoreDataStoreName		@"coredata.store.name"
#define kCoreDataModelName		@"coredata.model.name"

@implementation CWACoreDataComponents

- (NSManagedObjectContext *)managedObjectContext {
	
	return [TyphoonDefinition withClass:[NSManagedObjectContext class] configuration:^(TyphoonDefinition *definition) {
		[definition useInitializer:@selector(initWithConcurrencyType:) parameters:^(TyphoonMethod *initializer) {
			[initializer injectParameterWith:@(NSPrivateQueueConcurrencyType)];
		}];
		[definition injectProperty:@selector(persistentStoreCoordinator) with:self.persistentStoreCoordinator];
	}];
}

#pragma mark - Persistent store coordinator

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
	
	return [TyphoonDefinition withClass:[NSPersistentStoreCoordinator class] configuration:^(TyphoonDefinition *definition) {
		[definition useInitializer:@selector(initWithManagedObjectModel:) parameters:^(TyphoonMethod *initializer) {
			[initializer injectParameterWith:self.managedObjectModel];
		}];
		
		[definition injectMethod:@selector(addPersistentStoreWithType:configuration:URL:options:error:) parameters:^(TyphoonMethod *method) {
			[method injectParameterWith:NSSQLiteStoreType];
			[method injectParameterWith:nil];
			[method injectParameterWith:self.storeURL];
			[method injectParameterWith:nil];
			[method injectParameterWith:nil];
		}];
		
		definition.scope = TyphoonScopeLazySingleton;
	}];
}

- (NSFileManager *)fileManager {
	return [TyphoonDefinition with:[NSFileManager defaultManager]];
}

- (NSArray *)applicationDocumentsDirectories {
	
	return [TyphoonDefinition withFactory:[self fileManager] selector:@selector(URLsForDirectory:inDomains:) parameters:^(TyphoonMethod *factoryMethod) {
		[factoryMethod injectParameterWith:@(NSDocumentationDirectory)];
		[factoryMethod injectParameterWith:@(NSUserDomainMask)];
	}];
}

- (id)applicationDocumentsDirectory {
	return [TyphoonDefinition withFactory:[self applicationDocumentsDirectories] selector:@selector(lastObject)];
}

- (NSURL *)storeURL {
	return [TyphoonDefinition withFactory:[self applicationDocumentsDirectory] selector:@selector(URLByAppendingPathComponent:) parameters:^(TyphoonMethod *factoryMethod) {
		[factoryMethod injectParameterWith:TyphoonConfig(kCoreDataStoreName)];
	}];
}

#pragma mark - Managed object model

- (NSManagedObjectModel *)managedObjectModel {
	return [TyphoonDefinition withClass:[NSManagedObjectModel class] configuration:^(TyphoonDefinition *definition) {
		[definition useInitializer:@selector(initWithContentsOfURL:) parameters:^(TyphoonMethod *initializer) {
			[initializer injectParameterWith:self.modelURL];
		}];
	}];
}

- (NSBundle *)mainBundle {
	return [TyphoonDefinition with:[NSBundle mainBundle]];
}

- (NSURL *)modelURL {
	
	return [TyphoonDefinition withFactory:[self mainBundle] selector:@selector(URLForResource:withExtension:) parameters:^(TyphoonMethod *factoryMethod) {
		[factoryMethod injectParameterWith:TyphoonConfig(kCoreDataModelName)];
		[factoryMethod injectParameterWith:@"momd"];
	}];
}

@end
