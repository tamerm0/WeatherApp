//
//  CWASearchInteractorTests.m
//  WeatherApp
//
//  Created by Top on 11/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "CWASearchInteractor.h"
#import "CWASearchSuggestions.h"
#import "CWACitySearchInterface.h"
#import "CWASuggestion.h"

@interface CWASearchInteractorTests : XCTestCase

@property (nonatomic, strong)	CWASearchInteractor *interactor;
@property (nonatomic, strong)	id mockCitySearchDao;
@property (nonatomic, strong)	id mockDetailsInteractor;

@end

@implementation CWASearchInteractorTests

- (void)setUp {
    [super setUp];
	self.mockCitySearchDao = OCMProtocolMock(@protocol(CWACitySearchDAOInterface));
	self.mockDetailsInteractor = OCMProtocolMock(@protocol(CWADetailsInteractorInterface));
	self.interactor = [[CWASearchInteractor alloc] init];
	self.interactor.citySearchDao = self.mockCitySearchDao;
	self.interactor.detailsInteractor = self.mockDetailsInteractor;
}

- (void)tearDown {
    [super tearDown];
}

- (void)testQueryWeatherDetails {
	
	NSString *query = @"Singapore";
	OCMExpect([self.mockDetailsInteractor queryWeatherDeatils:query callback:nil]);
	[self.interactor queryWeatherDeatils:query callback:nil];
	OCMVerifyAll(self.mockDetailsInteractor);
}

- (void)testFindLatestSuggestionsNoQueryNoResult {
	int limit = 10;
	id invokeBlock = [OCMArg invokeBlockWithArgs:@[], nil];
	OCMStub([self.mockCitySearchDao queryLatestSearches:limit callback:invokeBlock]);
	__block NSArray<CWASuggestion *> *suggestionsArray = nil;
	[self.interactor findLatestSearchSuggestions:limit callback:^(CWASearchSuggestions *suggestions) {
		suggestionsArray = suggestions.suggestions;
	}];
	OCMVerifyAllWithDelay(self.mockCitySearchDao, 1);
	XCTAssertTrue(suggestionsArray.count == 0);
}

- (void)testFindLatestSuggestionsNoQueryResult {
	
	int limit = 10;
	NSDate *queryTime = [NSDate dateWithTimeIntervalSince1970:1234];
	NSString *cityName = @"Singapore";
	id<CWACitySearchInterface> mockCitySearch = OCMProtocolMock(@protocol(CWACitySearchInterface));
	[OCMStub([mockCitySearch cityName]) andReturn:cityName];
	[OCMStub([mockCitySearch queryTime]) andReturn:queryTime];
	id invokeBlock = [OCMArg invokeBlockWithArgs:@[mockCitySearch], nil];
	OCMStub([self.mockCitySearchDao queryLatestSearches:limit callback:invokeBlock]);
	__block NSArray<CWASuggestion *> *suggestionsArray = nil;
	[self.interactor findLatestSearchSuggestions:limit callback:^(CWASearchSuggestions *suggestions) {
		suggestionsArray = suggestions.suggestions;
	}];
	OCMVerifyAllWithDelay(self.mockCitySearchDao, 1);
	XCTAssertTrue(suggestionsArray.count == 1);
	XCTAssertTrue([[suggestionsArray[0] query] isEqualToString:cityName]);
}

- (void)testFindLatestSuggestionsWithQueryResult {
	
	int limit = 10;
	NSDate *queryTime = [NSDate dateWithTimeIntervalSince1970:1234];
	NSString *cityName = @"Singapore";
	id<CWACitySearchInterface> mockCitySearch = OCMProtocolMock(@protocol(CWACitySearchInterface));
	[OCMStub([mockCitySearch cityName]) andReturn:cityName];
	[OCMStub([mockCitySearch queryTime]) andReturn:queryTime];
	id invokeBlock = [OCMArg invokeBlockWithArgs:@[mockCitySearch], nil];
	OCMStub([self.mockCitySearchDao queryLatestSearches:limit cityName:cityName callback:invokeBlock]);
	__block NSArray<CWASuggestion *> *suggestionsArray = nil;
	[self.interactor findLatestSearchSuggestions:limit query:cityName callback:^(CWASearchSuggestions *suggestions) {
		suggestionsArray = suggestions.suggestions;
	}];
	OCMVerifyAllWithDelay(self.mockCitySearchDao, 1);
	XCTAssertTrue(suggestionsArray.count == 1);
	XCTAssertTrue([[suggestionsArray[0] query] isEqualToString:cityName]);
}

@end
