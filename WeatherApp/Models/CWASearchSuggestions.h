//
//  CWASearchSuggestions.h
//  WeatherApp
//
//  Created by Top on 7/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CWASuggestion;

@interface CWASearchSuggestions : NSObject

/**
 * Array suggestions to be displayed on search screen
 */
@property (nonatomic, strong)	NSArray<CWASuggestion *> *suggestions;

/**
 * Init search suggestions with array of suggestions
 */
- (instancetype)initWithSuggestions:(NSArray<CWASuggestion *> *)suggestions;

@end
