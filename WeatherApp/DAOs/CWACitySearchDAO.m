//
//  CWACitySearchDAO.m
//  WeatherApp
//
//  Created by Tamer on 7/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import "CWACitySearchDAO.h"
#import "CWACitySearchManagedObject.h"

@implementation CWACitySearchDAO

#pragma mark - CWACitySearchDAOInterface methods

- (void)queryLatestSearches:(NSUInteger)limit callback:(void (^)(NSArray<id<CWACitySearchInterface>> *))callback {
	__weak typeof(self) this = self;
	[self.managedObjectContext performBlock:^{
		
		NSFetchRequest *fetchRequest = [this fetchRequestWithLimit:limit sortDescriptor:@[[NSSortDescriptor sortDescriptorWithKey:@"queryTime" ascending:NO]] predicate:nil];
		NSArray<CWACitySearchManagedObject *> *searches = [this.managedObjectContext executeFetchRequest:fetchRequest error:nil];
		callback(searches);
	}];
}

- (void)queryLatestSearches:(NSUInteger)limit cityName:(NSString *)cityName callback:(void (^)(NSArray<id<CWACitySearchInterface>> *))callback {
	__weak typeof(self) this = self;
	[self.managedObjectContext performBlock:^{
		NSFetchRequest *fetchRequest = [this fetchRequestWithLimit:limit sortDescriptor:@[[NSSortDescriptor sortDescriptorWithKey:@"queryTime" ascending:NO]] predicate:[NSPredicate predicateWithFormat:@"cityName CONTAINS[cd] %@", [cityName lowercaseString]]];
		NSArray<CWACitySearchManagedObject *> *searches = [this.managedObjectContext executeFetchRequest:fetchRequest error:nil];
		callback(searches);
	}];
}

- (void)createCitySearch:(NSString *)cityName queryTime:(NSDate *)queryTime {
	
	__weak typeof(self) this = self;
	[self.managedObjectContext performBlockAndWait:^{
		NSFetchRequest *fetchRequest = [this fetchRequestWithLimit:0 sortDescriptor:@[[NSSortDescriptor sortDescriptorWithKey:@"queryTime" ascending:NO]] predicate:[NSPredicate predicateWithFormat:@"cityName == %@", [cityName lowercaseString]]];
		NSArray<CWACitySearchManagedObject *> *searches = [this.managedObjectContext executeFetchRequest:fetchRequest error:nil];
		CWACitySearchManagedObject *citySearch = searches.firstObject;
		if (!citySearch) {
			citySearch = [this createInstance];
		}
		citySearch.cityName = [cityName lowercaseString];
		citySearch.queryTime = queryTime;
		[this.managedObjectContext save:nil];
	}];
}

#pragma mark - Private methods

- (NSFetchRequest *)fetchRequestWithLimit:(NSUInteger)limit sortDescriptor:(NSArray<NSSortDescriptor *> *)sortDescriptors predicate:(NSPredicate *)predicate {
	
	NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:NSStringFromClass([CWACitySearchManagedObject class])];
	if (limit != 0) {
		fetchRequest.fetchLimit = limit;
	}
	fetchRequest.sortDescriptors = sortDescriptors;
	fetchRequest.predicate = predicate;
	return fetchRequest;
}

- (CWACitySearchManagedObject *)createInstance {
	NSEntityDescription *entityDescription = [NSEntityDescription entityForName:NSStringFromClass([CWACitySearchManagedObject class]) inManagedObjectContext:self.managedObjectContext];
	CWACitySearchManagedObject *citySearch = [[CWACitySearchManagedObject alloc] initWithEntity:entityDescription insertIntoManagedObjectContext:self.managedObjectContext];
	return citySearch;
}

@end
