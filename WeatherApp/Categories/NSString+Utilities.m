//
//  NSString+Utilities.m
//  WeatherApp
//
//  Created by Tamer on 7/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import "NSString+Utilities.h"

@implementation NSString (Utilities)

+ (BOOL)isEmpty:(NSString *)string {
	if (string && [string isKindOfClass:[NSString class]]) {
		
		NSString *trimmedString = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
		if ([trimmedString length] == 0) {
			
			return YES;
		} else {
			return NO;
		}
	}
	return YES;
}
@end
