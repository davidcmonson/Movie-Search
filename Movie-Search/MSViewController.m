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
@property (nonatomic, strong) MSMovieDetailViewController *detailVC;

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
    [[MovieController sharedInstance] retrieveMovieByName:self.searchField.text completion:^(BOOL success, NSArray *resultMovies) {
        if (success) {
            [self.tableView reloadData];
        } else {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Failed" message:@"Didn't load" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil];
            [alertView show];
        }
    }];
    [self.searchField resignFirstResponder];
}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if ([segue.identifier isEqualToString:@"moviesegue"]) {
//        UITableViewCell *cell = sender;
//        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
//
//        MSMovieDetailViewController *detailVC = [segue destinationViewController];
//
//    }
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //MSMovieDetailViewController *detailViewController = [MSMovieDetailViewController new];
    self.detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"detailStory"];
    NSDictionary *movie = [MovieController sharedInstance].resultMovies[indexPath.row];
    self.movieID = movie[@"id"];
    NSLog(@"%@", self.movieID);

    

    [[MovieController sharedInstance] retrieveMovieByID:[MovieController sharedInstance].resultMovies[indexPath.row][@"id"] completion:^(BOOL success) {
//        self.detailVC.titleLabel.text = [movieSelection objectForKey:@"original_title"];
//        self.detailVC.synopsisLabel.text = [movieSelection objectForKey:@"overview"];
//        self.detailVC.ratingLabel.text = dictionary[@"vote_average"];
//        self.detailVC.yearLabel.text = dictionary[@"release_date"];
       // NSLog(@"%@", [movieSelection objectForKey:@"original_title"]);
        [self.navigationController pushViewController:self.detailVC animated:YES];
    }];

    

}

@end
