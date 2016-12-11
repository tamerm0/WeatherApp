//
//  CWACitySearchDAOTests.m
//  WeatherApp
//
//  Created by Top on 11/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "CWACitySearchDAO.h"
#import "CWACitySearchManagedObject.h"

@interface CWACitySearchDAOTests : XCTestCase

@property (nonatomic, strong)	CWACitySearchDAO *dao;
@property (nonatomic, strong)	id mockManagedObjectContext;

@end

@implementation CWACitySearchDAOTests

- (void)setUp {
    [super setUp];
	self.mockManagedObjectContext = OCMClassMock([NSManagedObjectContext class]);
	self.dao = [[CWACitySearchDAO alloc] init];
	self.dao.managedObjectContext = self.mockManagedObjectContext;
}

- (void)tearDown {
    [super tearDown];
}

- (void)testQueryLatestSearches {
	int limit = 10;
	OCMStub([self.mockManagedObjectContext performBlock:[OCMArg invokeBlock]]);
	__block NSFetchRequest *fetchRequest = nil;
	[OCMStub([self.mockManagedObjectContext executeFetchRequest:[OCMArg any] error:nil]) andDo:^(NSInvocation *invocation) {
		[invocation getArgument:&fetchRequest atIndex:2];
		id value = nil;
		[invocation setReturnValue:&value];
	}];
	__block NSArray<id<CWACitySearchInterface>> *foundSearches = nil;
	[self.dao queryLatestSearches:limit callback:^(NSArray<id<CWACitySearchInterface>> *searches) {
		foundSearches = searches;
	}];
	
	XCTAssertNotNil(fetchRequest);
	XCTAssertTrue(fetchRequest.fetchLimit == limit);
	XCTAssertNil(fetchRequest.predicate);
	XCTAssertTrue(fetchRequest.sortDescriptors.count == 1);
	XCTAssertTrue([[fetchRequest.sortDescriptors[0] key] isEqualToString:@"queryTime"]);
	XCTAssertNil(foundSearches);
}

- (void)testQueryLatestSearchesWithCityName {
	int limit = 10;
	NSString *cityName = @"Singapore";
	OCMStub([self.mockManagedObjectContext performBlock:[OCMArg invokeBlock]]);
	__block NSFetchRequest *fetchRequest = nil;
	[OCMStub([self.mockManagedObjectContext executeFetchRequest:[OCMArg any] error:nil]) andDo:^(NSInvocation *invocation) {
		[invocation getArgument:&fetchRequest atIndex:2];
		id value = nil;
		[invocation setReturnValue:&value];
	}];
	__block NSArray<id<CWACitySearchInterface>> *foundSearches = nil;
	[self.dao queryLatestSearches:limit cityName:cityName callback:^(NSArray<id<CWACitySearchInterface>> *searches) {
		foundSearches = searches;
	}];
	
	XCTAssertNotNil(fetchRequest);
	XCTAssertTrue(fetchRequest.fetchLimit == limit);
	XCTAssertNotNil(fetchRequest.predicate);
	XCTAssertTrue(fetchRequest.sortDescriptors.count == 1);
	XCTAssertTrue([[fetchRequest.sortDescriptors[0] key] isEqualToString:@"queryTime"]);
	XCTAssertNil(foundSearches);
}

- (void)testCreateInstance {
	NSString *cityName = @"Singapore";
	NSDate *date = [NSDate dateWithTimeIntervalSince1970:123];
	OCMExpect([self.mockManagedObjectContext save:nil]);
	OCMStub([self.mockManagedObjectContext performBlockAndWait:[OCMArg invokeBlock]]);
	id partialMockDao = OCMPartialMock(self.dao);
	id mockInstance = OCMClassMock([CWACitySearchManagedObject class]);
	OCMExpect([mockInstance setCityName:[cityName lowercaseString]]);
	OCMExpect([mockInstance setQueryTime:date]);
	[OCMStub([partialMockDao createInstance]) andReturn:mockInstance];
	[OCMStub([partialMockDao createCitySearch:cityName queryTime:date]) andForwardToRealObject];
	[partialMockDao createCitySearch:cityName queryTime:date];
	OCMVerify(self.mockManagedObjectContext);
	OCMVerifyAll(mockInstance);
}

@end
