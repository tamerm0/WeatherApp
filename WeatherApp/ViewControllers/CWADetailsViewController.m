//
//  CWADetailsViewController.m
//  WeatherApp
//
//  Created by Tamer on 7/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import "CWADetailsViewController.h"
#import "CWASearchWeatherDetails.h"
#import "CWAWeatherCondition.h"
#import "CWAWeatherConditionCell.h"

#define kWeatherCellId	@"weather-condition-cell-id"

@interface CWADetailsViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UITableView *weatherTableView;

@end

@implementation CWADetailsViewController

- (void)viewDidLoad {
	
    [super viewDidLoad];
	self.weatherTableView.refreshControl = [[UIRefreshControl alloc] init];
	[self.weatherTableView.refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
	
	[self.weatherTableView registerNib:[UINib nibWithNibName:NSStringFromClass([CWAWeatherConditionCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:kWeatherCellId];
}

- (void)refresh:(id)sender {
	__weak typeof(self) weakSelf = self;
	[self.eventHandler refreshWeatherDeatils:self.cityName callback:^(NSArray<CWAWeatherCondition *> *conditions) {
		weakSelf.weatherConditions = conditions;
		[weakSelf.weatherTableView reloadData];
	}];
}

#pragma mark - UITableViewDelegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - UITableViewDataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.weatherConditions.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	CWAWeatherConditionCell *cell = [tableView dequeueReusableCellWithIdentifier:kWeatherCellId forIndexPath:indexPath];
	[cell updateViewWithWeatherCondition:self.weatherConditions[indexPath.row]];
	return cell;
}

@end
