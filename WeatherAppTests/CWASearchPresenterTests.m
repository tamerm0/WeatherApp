//
//  CWASearchPresenterTests.m
//  WeatherApp
//
//  Created by Top on 11/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "CWASearchPresenter.h"
#import "CWASearchWireframeInterface.h"
#import "CWASearchInteractorInterface.h"
#import "CWASearchSuggestions.h"
#import "CWASearchWeatherDetails.h"
#import "CWAWeatherCondition.h"

@interface CWASearchPresenterTests : XCTestCase

@property (nonatomic, strong)	CWASearchPresenter *presenter;
@property (nonatomic, strong)	id interactorMock;
@property (nonatomic, strong)	id wireframeMock;

@end

@implementation CWASearchPresenterTests

- (void)setUp {
    [super setUp];
	self.interactorMock = OCMProtocolMock(@protocol(CWASearchInteractorInterface));
	self.wireframeMock = OCMProtocolMock(@protocol(CWASearchWireframeInterface));
	self.presenter = [[CWASearchPresenter alloc] init];
	self.presenter.searchInteractor = self.interactorMock;
	self.presenter.searchWireframe = self.wireframeMock;
	self.presenter.suggestionsSize = 10;
}

- (void)tearDown {
    [super tearDown];
}

- (void)testLatestQuerySuggestionsNoQuery {
	CWASearchSuggestions *mockSuggetions = OCMClassMock([CWASearchSuggestions class]);
	id invokeBlock = [OCMArg invokeBlockWithArgs:mockSuggetions, nil];
	OCMStub([self.interactorMock findLatestSearchSuggestions:10 callback:invokeBlock]);
	OCMReject([self.interactorMock findLatestSearchSuggestions:10 query:[OCMArg any] callback:[OCMArg any]]);
	__block CWASearchSuggestions *returnedSuggestions = nil;
	[self.presenter querySearchSuggestions:@"" callback:^(CWASearchSuggestions *suggestions) {
		
		returnedSuggestions = suggestions;
	}];
	OCMVerifyAllWithDelay(self.interactorMock, 2);
	XCTAssert(returnedSuggestions == mockSuggetions);
}

- (void)testLatestQuerySuggestionsWithQuery {
	NSString *query = @"Singapore";
	CWASearchSuggestions *mockSuggetions = OCMClassMock([CWASearchSuggestions class]);
	id invokeBlock = [OCMArg invokeBlockWithArgs:mockSuggetions, nil];
	OCMStub([self.interactorMock findLatestSearchSuggestions:10 query:[OCMArg isEqual:query] callback:invokeBlock]);
	OCMReject([self.interactorMock findLatestSearchSuggestions:10 callback:[OCMArg any]]);
	__block CWASearchSuggestions *returnedSuggestions = nil;
	[self.presenter querySearchSuggestions:query callback:^(CWASearchSuggestions *suggestions) {
		
		returnedSuggestions = suggestions;
	}];
	OCMVerifyAllWithDelay(self.interactorMock, 2);
	XCTAssert(returnedSuggestions == mockSuggetions);
}

- (void)testPresentingSearchDetailsFound {
	NSString *query = @"Singapore";
	CWAWeatherCondition *mockCondition = OCMClassMock([CWAWeatherCondition class]);
	CWASearchWeatherDetails *mockDetails = OCMClassMock([CWASearchWeatherDetails class]);
	[OCMStub([mockDetails emptyMessage]) andReturn:@""];
	[OCMStub([mockDetails details]) andReturn:@[mockCondition]];
	id invokeBlock = [OCMArg invokeBlockWithArgs:mockDetails, nil];
	OCMStub([self.interactorMock queryWeatherDeatils:query callback:invokeBlock]);
	[self.presenter presentSearchDetails:query];
	OCMExpect([self.wireframeMock presentDetailsViewController:query weatherDetails:mockDetails]);
	OCMVerifyAllWithDelay(self.wireframeMock, 1);
}

- (void)testPresentingSearchDetailsNotFound {
	NSString *query = @"Singapore";
	NSString *message = @"Empty";
	CWASearchWeatherDetails *mockDetails = OCMClassMock([CWASearchWeatherDetails class]);
	[OCMStub([mockDetails emptyMessage]) andReturn:message];
	[OCMStub([mockDetails details]) andReturn:@[]];
	id invokeBlock = [OCMArg invokeBlockWithArgs:mockDetails, nil];
	OCMStub([self.interactorMock queryWeatherDeatils:query callback:invokeBlock]);
	[self.presenter presentSearchDetails:query];
	OCMExpect([self.wireframeMock showAlertWithMessage:message]);
	OCMVerifyAllWithDelay(self.wireframeMock, 1);
}


@end
