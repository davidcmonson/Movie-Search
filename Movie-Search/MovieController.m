//
//  MovieController.m
//  Movie-Search
//
//  Created by Joshua Howland on 6/18/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "MovieController.h"
#import "NetworkController.h"

@implementation MovieController

+ (MovieController *)sharedInstance {
    
    static MovieController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [MovieController new];
    });
    return sharedInstance;
    
}

- (void)retrieveMovieByName:(NSString *)name completion:(void (^)(BOOL success))completion {
    [[NetworkController api] GET:@"search/movie" parameters:[NetworkController parametersWithAPIKey:@{@"query" : name }] success:^(NSURLSessionDataTask *task, id responseObject) {
        self.resultMovies = responseObject[@"results"];
        completion(YES);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(NO);
    }];
}



@end
