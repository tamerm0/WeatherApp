//
//  CWASearchPresenterInterface.h
//  WeatherApp
//
//  Created by Tamer on 6/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

@class CWASearchSuggestions;
@protocol CWASearchPresenterInterface <NSObject>

/**
 * Filter suggestions based on query, if query is nil or empty, this method returns initial search suggestions
 */
- (void)querySearchSuggestions:(NSString *)query callback:(void(^)(CWASearchSuggestions *suggestions))callback;

@end
