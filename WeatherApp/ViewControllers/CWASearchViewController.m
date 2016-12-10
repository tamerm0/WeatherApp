//
//  CWASearchViewController.m
//  WeatherApp
//
//  Created by Tamer on 5/12/16.
//  Copyright © 2016 Careem. All rights reserved.
//

#import "CWASearchViewController.h"

#import "CWASearchPresenterInterface.h"
#import "CWASearchSuggestions.h"
#import "CWASuggestion.h"

#define kSuggestionCellId		@"suggestions-cell-id"

@interface CWASearchViewController () <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchResultsUpdating>
	
@property (nonatomic, strong)	UISearchController *searchController;
@property (nonatomic, weak) IBOutlet UITableView *suggestionsTableView;
@property (nonatomic, strong)	CWASearchSuggestions *searchSuggestions;

@end

@implementation CWASearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Initialize search controller
	self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
	self.searchController.searchResultsUpdater = self;
	[self.searchController.searchBar sizeToFit];
	self.suggestionsTableView.tableHeaderView = self.searchController.searchBar;
	self.searchController.dimsBackgroundDuringPresentation = NO;
	self.searchController.searchBar.delegate = self;
	self.definesPresentationContext = YES;
	
	// Register table view cells
	[self.suggestionsTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kSuggestionCellId];
	self.title = kStringSearchTitle;
}
	
#pragma mark - UITableViewDelegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - UITableViewDataSource methods
	
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.searchSuggestions.suggestions.count;
}
	
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [self.suggestionsTableView dequeueReusableCellWithIdentifier:kSuggestionCellId];
	CWASuggestion *suggestion = self.searchSuggestions.suggestions[indexPath.row];
	cell.textLabel.text = suggestion.query;
	return cell;
}
	
#pragma mark - UISearchBarDelegate methods

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
	[self.eventHandler presentSearchDetails:searchBar.text];
}

#pragma mark - UISearchResultsUpdating methods

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
	if (self.searchController.isActive) {
		__weak typeof(self) this = self;
		[self.eventHandler querySearchSuggestions:searchController.searchBar.text callback:^(CWASearchSuggestions *suggestions) {
			this.searchSuggestions = suggestions;
			[this.suggestionsTableView reloadData];
		}];
	} else {
		self.searchSuggestions = nil;
		[self.suggestionsTableView reloadData];
	}
}

@end
