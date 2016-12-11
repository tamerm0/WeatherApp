//
//  CWADetailsInteractorTests.m
//  WeatherApp
//
//  Created by Top on 11/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "CWADetailsInteractor.h"
#import "CWASearchWeatherDetails.h"
#import "CWAWeatherResponse.h"
#import "CWAWeatherModel.h"
#import "NSString+Utilities.h"
#import "CWAWeatherCondition.h"

@interface CWADetailsInteractorTests : XCTestCase

@property (nonatomic, strong)	CWADetailsInteractor *interactor;
@property (nonatomic, strong)	id mockClient;
@property (nonatomic, strong)	id mockCitySearchDao;

@end

@implementation CWADetailsInteractorTests

- (void)setUp {
    [super setUp];
	self.mockClient = OCMClassMock([APIClient class]);
	self.mockCitySearchDao = OCMProtocolMock(@protocol(CWACitySearchDAOInterface));
	self.interactor = [[CWADetailsInteractor alloc] init];
	self.interactor.apiClient = self.mockClient;
	self.interactor.citySearchDao = self.mockCitySearchDao;
}

- (void)tearDown {
	
    [super tearDown];
}

- (void)testQueryWeatherDetailsNoItems {
	NSString *query = @"Singapore";
	NSString *message = @"No Items";
	CWAWeatherResponse *mockResponse = OCMClassMock([CWAWeatherResponse class]);
	[OCMStub([mockResponse errorMsg]) andReturn:@[message]];
	[OCMStub([mockResponse currentCondition]) andReturn:@[]];
	id invokeBlock = [OCMArg invokeBlockWithArgs:mockResponse, [NSNull null], nil];
	OCMStub([self.mockClient fetchWeatherCondations:query callback:invokeBlock]);
	__block CWASearchWeatherDetails *foundDetails = nil;
	[self.interactor queryWeatherDeatils:query callback:^(CWASearchWeatherDetails *details) {
		foundDetails = details;
	}];
	OCMVerifyAllWithDelay(self.mockClient, 2);
	XCTAssertNotNil(foundDetails);
	XCTAssertTrue([[foundDetails emptyMessage] isEqualToString:message]);
	XCTAssertTrue([[foundDetails details] count] == 0);	
}

- (void)testQueryWeatherDetails {
	NSString *query = @"Singapore";
	NSString *observationTime = @"observationTime";
	NSString *url = @"url";
	NSString *desc = @"desc";
	NSString *humidity = @"humidity";
	CWAWeatherModel *mockWeatherModel = OCMClassMock([CWAWeatherModel class]);
	[OCMStub([mockWeatherModel observationTime]) andReturn:observationTime];
	[OCMStub([mockWeatherModel weatherIconUrls]) andReturn:@[url]];
	[OCMStub([mockWeatherModel weatherDescs]) andReturn:@[desc]];
	[OCMStub([mockWeatherModel humidity]) andReturn:humidity];
	
	CWAWeatherResponse *mockResponse = OCMClassMock([CWAWeatherResponse class]);
	[OCMStub([mockResponse errorMsg]) andReturn:@[[NSNull null]]];
	[OCMStub([mockResponse currentCondition]) andReturn:@[mockWeatherModel]];
	id invokeBlock = [OCMArg invokeBlockWithArgs:mockResponse, [NSNull null], nil];
	OCMStub([self.mockClient fetchWeatherCondations:query callback:invokeBlock]);
	
	OCMExpect([self.mockCitySearchDao createCitySearch:query queryTime:[OCMArg any]]);
	__block CWASearchWeatherDetails *foundDetails = nil;
	[self.interactor queryWeatherDeatils:query callback:^(CWASearchWeatherDetails *details) {
		foundDetails = details;
	}];
	OCMVerifyAllWithDelay(self.mockCitySearchDao, 2);
	XCTAssertNotNil(foundDetails);
	XCTAssertTrue([NSString isEmpty:[foundDetails emptyMessage]]);
	XCTAssertTrue([[foundDetails details] count] == 1);
	CWAWeatherCondition *condition = foundDetails.details[0];
	XCTAssertTrue([condition.observationTime isEqualToString:observationTime]);
	XCTAssertTrue([condition.iconUrl isEqualToString:url]);
	XCTAssertTrue([condition.desc isEqualToString:desc]);
	XCTAssertTrue([condition.humidity isEqualToString:humidity]);
}

- (void)testQueryWeatherDetailsError {
	NSString *query = @"Singapore";
	NSError *error = OCMClassMock([NSError class]);
	id invokeBlock = [OCMArg invokeBlockWithArgs:[NSNull null], error, nil];
	OCMStub([self.mockClient fetchWeatherCondations:query callback:invokeBlock]);
	__block CWASearchWeatherDetails *foundDetails = nil;
	[self.interactor queryWeatherDeatils:query callback:^(CWASearchWeatherDetails *details) {
		foundDetails = details;
	}];
	OCMVerifyAllWithDelay(self.mockClient, 2);
	XCTAssertNotNil(foundDetails);
	XCTAssertTrue(![NSString isEmpty:[foundDetails emptyMessage]]);
	XCTAssertTrue([[foundDetails details] count] == 0);
}

@end
