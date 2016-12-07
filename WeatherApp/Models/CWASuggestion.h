//
//  CWASuggestion.h
//  WeatherApp
//
//  Created by Top on 7/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CWASuggestion : NSObject

/**
 * Suggestion query
 */
@property (nonatomic, copy)	NSString *query;

/**
 * Init suggestion with query string
 */
- (instancetype)initWithQuery:(NSString *)query;

@end
