//
//  MSMovieDetailViewController.m
//  Movie-Search
//
//  Created by Joshua Howland on 6/18/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "MSMovieDetailViewController.h"
#import "MovieController.h"
#import "MSViewController.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface MSMovieDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;
@property (weak, nonatomic) IBOutlet UIImageView *posterImageView;

@end

@implementation MSMovieDetailViewController

- (instancetype)init {
    self = [super init];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSDictionary *movieSelection = [MovieController sharedInstance].dictionary;
    NSLog(@"%@", movieSelection);

//    MSViewController *vc = [[MSViewController alloc] init];
//
//    [[MovieController sharedInstance] retrieveMovieByID:vc.movieID completion:^(BOOL success, NSDictionary *dictionary) {
    self.titleLabel.text = [movieSelection objectForKey:@"original_title"];
    NSLog(@"%@", self.titleLabel.text);
    self.synopsisLabel.text = [movieSelection objectForKey:@"overview"];
    self.ratingLabel.text = [NSString stringWithFormat:@"%@", [movieSelection objectForKey:@"vote_average"]];
    self.yearLabel.text = [NSString stringWithFormat:@"%@",[movieSelection objectForKey:@"release_date"]];
    [self.posterImageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://image.tmdb.org/t/p/w92%@", [movieSelection objectForKey:@"poster_path"]]]];
//    }];


    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
