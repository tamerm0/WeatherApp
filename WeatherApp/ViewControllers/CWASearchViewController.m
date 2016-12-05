//
//  CWASearchViewController.m
//  WeatherApp
//
//  Created by Tamer on 5/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import "CWASearchViewController.h"

@interface CWASearchViewController () <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>
	
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *suggestionsTableView;

@end

@implementation CWASearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
	
#pragma mark - UITableViewDelegate methods
	
#pragma mark - UITableViewDataSource methods
	
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 0;
}
	
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	return nil;
}
	
#pragma mark - UISearchBarDelegate methods


@end
