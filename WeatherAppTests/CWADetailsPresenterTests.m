//
//  CWADetailsPresenterTests.m
//  WeatherApp
//
//  Created by Top on 11/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "CWADetailsPresenter.h"
#import "CWADetailsWireframeInterface.h"
#import "CWADetailsInteractorInterface.h"
#import "CWASearchWeatherDetails.h"
#import "CWAWeatherCondition.h"

@interface CWADetailsPresenterTests : XCTestCase

@property (nonatomic, strong)	CWADetailsPresenter *presenter;
@property (nonatomic, strong)	id mockInteractor;
@property (nonatomic, strong)	id mockWireframe;

@end

@implementation CWADetailsPresenterTests

- (void)setUp {
    [super setUp];
	self.mockInteractor = OCMProtocolMock(@protocol(CWADetailsInteractorInterface));
	self.mockWireframe = OCMProtocolMock(@protocol(CWADetailsWireframeInterface));
	self.presenter = [[CWADetailsPresenter alloc] init];
	self.presenter.detailsInteractor = self.mockInteractor;
	self.presenter.detailsWireframe = self.mockWireframe;
}

- (void)tearDown {
    [super tearDown];
}

- (void)testRefreshWeatherDetailsNotFound {
	
	NSString *message = @"Empty";
	NSString *city = @"Singapore";
	CWASearchWeatherDetails *mockDetails = OCMClassMock([CWASearchWeatherDetails class]);
	[OCMStub([mockDetails emptyMessage]) andReturn:message];
	[OCMStub([mockDetails details]) andReturn:@[]];
	id invokeBlock = [OCMArg invokeBlockWithArgs:mockDetails, nil];
	OCMStub([self.mockInteractor queryWeatherDeatils:city callback:invokeBlock]);
	[self.presenter refreshWeatherDeatils:city callback:^(NSArray<CWAWeatherCondition *> *details) {
		XCTAssertTrue(details.count == 0);
	}];
	OCMExpect([self.mockWireframe showAlertMessage:message]);
	OCMVerifyAllWithDelay(self.mockWireframe, 1);
}

- (void)testRefreshWeatherDetailsFound {
	
	NSString *message = @"Empty";
	NSString *city = @"Singapore";
	CWAWeatherCondition *mockCondition = OCMClassMock([CWAWeatherCondition class]);
	CWASearchWeatherDetails *mockDetails = OCMClassMock([CWASearchWeatherDetails class]);
	[OCMStub([mockDetails emptyMessage]) andReturn:message];
	[OCMStub([mockDetails details]) andReturn:@[mockCondition]];
	id invokeBlock = [OCMArg invokeBlockWithArgs:mockDetails, nil];
	OCMStub([self.mockInteractor queryWeatherDeatils:city callback:invokeBlock]);
	[self.presenter refreshWeatherDeatils:city callback:^(NSArray<CWAWeatherCondition *> *details) {
		XCTAssertTrue(details.count == 1);
	}];
	OCMReject([self.mockWireframe showAlertMessage:message]);
	OCMVerifyAllWithDelay(self.mockWireframe, 1);
}

@end
