//
//  CWAWeatherConditionCell.m
//  WeatherApp
//
//  Created by Top on 10/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import "CWAWeatherConditionCell.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface CWAWeatherConditionCell ()

@property (weak, nonatomic) IBOutlet UIImageView *weatherImage;
@property (weak, nonatomic) IBOutlet UILabel *labelDescription;
@property (weak, nonatomic) IBOutlet UILabel *labelHumidity;
@property (weak, nonatomic) IBOutlet UILabel *labelObservationTime;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicatorImageLoading;

@end

@implementation CWAWeatherConditionCell

- (void)prepareForReuse {
	[super prepareForReuse];
	[self.indicatorImageLoading setHidden:YES];
	[self.weatherImage cancelImageDownloadTask];
}

- (void)updateViewWithWeatherCondition:(CWAWeatherCondition *)condition {
	
	__weak typeof(self) weakSelf = self;
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:condition.iconUrl]];
	[request addValue:@"image/*" forHTTPHeaderField:@"Accept"];
	[self.weatherImage setImageWithURLRequest:request placeholderImage:nil success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image) {
		[weakSelf.weatherImage setHidden:NO];
		[weakSelf.indicatorImageLoading setHidden:YES];
		[weakSelf.indicatorImageLoading stopAnimating];
	} failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
		[weakSelf.indicatorImageLoading setHidden:YES];
		[weakSelf.indicatorImageLoading stopAnimating];
	}];
	[self.weatherImage setHidden:YES];
	[self.indicatorImageLoading setHidden:NO];
	[self.indicatorImageLoading startAnimating];
	[self.labelDescription setText:condition.desc];
	[self.labelHumidity setText:condition.humidity];
	[self.labelObservationTime setText:condition.observationTime];
}

@end
