//
//  MSViewController.m
//  Movie-Search
//
//  Created by Joshua Howland on 6/18/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "MSViewController.h"
#import "MSResponseTableViewDataSource.h"
#import "MSMovieDetailViewController.h"
#import "MovieController.h"

@interface MSViewController () <UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITextField *searchField;
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) MSResponseTableViewDataSource *dataSource;

@end

@implementation MSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.dataSource = [MSResponseTableViewDataSource new];
    
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];

}

- (IBAction)search:(id)sender {
    [[MovieController sharedInstance] retrieveMovieByName:self.searchField.text completion:^(BOOL success) {
        if (success) {
            [self.tableView reloadData];
        } else {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Failed" message:@"Didn't load" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil];
            [alertView show];
        }
    }];
    [self.searchField resignFirstResponder];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    MSMovieDetailViewController *detailViewController = [MSMovieDetailViewController new];
    [self.navigationController pushViewController:detailViewController animated:YES];
}

@end
