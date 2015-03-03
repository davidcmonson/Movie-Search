//
//  NetworkController.m
//  Movie-Search
//
//  Created by Jason Noah Choi on 3/3/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "NetworkController.h"
#import <AFNetworking/AFNetworking.h>

static NSString * const APIKey = @"";

@implementation NetworkController

+ (AFHTTPSessionManager *)api {
    static AFHTTPSessionManager *api = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        api = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"https://api.themoviedb.org/3/"]];
        api.responseSerializer = [AFJSONResponseSerializer serializer];
        api.requestSerializer = [AFJSONRequestSerializer serializer];
    });
    return api;
}

+ (NSDictionary *)parametersWithAPIKey:(NSDictionary *)parameters {
    NSMutableDictionary *parametersWithKey = [[NSMutableDictionary alloc] initWithDictionary:parameters];
    [parametersWithKey setObject:APIKey forKey:@"api_key"];

    return parametersWithKey;
}

@end
