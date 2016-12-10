//
//  CWADAOsAssembly.m
//  WeatherApp
//
//  Created by Top on 7/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import "CWADAOsAssembly.h"
#import "CWACitySearchDAO.h"

@implementation CWADAOsAssembly

- (id<CWACitySearchDAOInterface>)citySearchDao {
	return [TyphoonDefinition withClass:[CWACitySearchDAO class] configuration:^(TyphoonDefinition *definition) {
		[definition injectProperty:@selector(managedObjectContext) with:self.coreDataComponents.managedObjectContext];
	}];
}

@end
